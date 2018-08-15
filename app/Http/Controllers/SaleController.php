<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Sale;
use App\Category;
use App\Product;
use App\Customer;
use Auth;
use Validator;
//use PDF;
//use SnappyImage;
use \Html2Text\Html2Text;
use View;
use Storage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\CapabilityProfile;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\Printer;

class SaleController extends Controller
{
    public function index()
    {
        if(Auth::user()->role_id == 1) { 
            $data['sales'] = Sale::select("*" , "sales.id as id")->where("type", "pos")->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy("sales.id", "DESC")->paginate(25);
        } else { 
            $data['sales'] = Sale::where("cashier_id", Auth::user()->id)->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy("sales.id", "DESC")->paginate(25);
        }
        
        return view('backend.sales.index', $data);
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::get();
        $products = Product::where("is_delete" , 0)->orderBy("name" , "ASC")->get();
        return view('backend.sales.create', ['products' => $products,'categories' => $categories]);
    }

    public function receipt($id)
    {
		$sale = Sale::findOrFail($id);
        
		/*$data = [
            'sale' => $sale,
        ];*/

        //return view('backend.sales.receipt', $data);

        //$pdf = SnappyImage::loadView('backend.sales.receipt', $data)->setOption('width','58');
        //return $pdf->inline();
        //return $pdf->download('invoice.pdf');
        
        //$view = View::make('backend.sales.receipt', $data);
        //$contents = (string) $view;
        
        //$html = new \Html2Text\Html2Text($contents);

        //echo $html->getText();

        //Storage::put('file.txt', $html->getText());
		
		//$profile = CapabilityProfile::load("simple");
		//$connector = new WindowsPrintConnector("smb://RAHUL-PC/POS-58");
		//$printer = new Printer($connector, $profile);
		//$printer -> text("Hello World!\n");
		//$printer -> cut();
		//$printer -> close();
		
		$this->printInvoice($sale, 'smb://RAHUL-PC/POS-58');
    }
    
    public function completeSale(Request $request)
    {
        $form = $request->all();
		$items = $request->input('items');
		$amount = 0;
		foreach($items as $item) { 
			$amount += $item['price'] * $item['quantity'];
		}	
		$amount += $request->input('vat') + $request->input('delivery_cost') - $request->input('discount');
		$form['amount'] = $amount;
		
		$rules = Sale::$rules;
        $rules['items'] = 'required';

        $validator = Validator::make($form, $rules);

        if ($validator->fails()) {
            return response()->json(
                [
                'errors' => $validator->errors()->all(),
                ], 400
            );
        }
		
        $sale = Sale::createAll($form);

        //return url("sales/receipt/".$sale->id);
		
		$error = '';
		
		if(setting_by_key('printer1')) {
			try {
				$this->printInvoice($sale, setting_by_key('printer1'));
			} catch (Exception $e) {
				$error = "Couldn't print to this printer: " . $e -> getMessage() . "\n";
			}
		}
		
		if(setting_by_key('printer2')) {
			try {
			$this->printInvoice($sale, setting_by_key('printer2'));
			} catch (Exception $e) {
				$error += "Couldn't print to this printer: " . $e -> getMessage() . "\n";
			}
		}
		
		if($error !== '') {
			return $error;
		}
		
		return 'success';
    }
    
    public function cancel($id)
    {
        Sale::where("id", $id)->update(array("status" => 0));
        return redirect("sales");
    }
    
    public function printInvoice($sale, $printer){
		
        /* Information for the receipt */		
		$items = [];
		$subtotal_amount = 0;
		$currency =  setting_by_key("currency");
		
		foreach($sale->items as $key=>$item) {
			$items[] = $this->newItem($item->product->name.'('.$item->quantity.')', number_format($item->quantity * $item->price,2));
			$subtotal_amount = $subtotal_amount + ($item->quantity * $item->price);
		}
		
		$subtotal = $this->newItem('Subtotal', $subtotal_amount);
		$tax = $this->newItem('S.TAX(3%),GST(5%)', number_format($sale->vat,2));
		$total = $this->newItem('Total', number_format($sale->subtotal - $sale->discount + $sale->vat,2), $currency);
		/* Date is kept the same for testing */
		// $date = date('l jS \of F Y h:i:s A');
		$date = date('l jS \of F Y h:i:s A');

		/* Start the printer */
		//$logo = EscposImage::load("resources/escpos-php.png", false);
		//$printer = new Printer($connector);
		
		$profile = CapabilityProfile::load("simple");
		$connector = new WindowsPrintConnector($printer);
		$printer = new Printer($connector, $profile);

		/* Print top logo */
		$printer -> setJustification(Printer::JUSTIFY_CENTER);
		//$printer -> graphics($logo);

		/* Name of shop */
		//$printer -> selectPrintMode(Printer::MODE_DOUBLE_WIDTH);
		//$printer -> setJustification(Printer::JUSTIFY_CENTER);
		
		$printer -> selectPrintMode(Printer::MODE_FONT_A);
		$printer -> text(setting_by_key('title')."\n");

		$printer -> selectPrintMode();
		$printer -> text(setting_by_key('address')."\n");
		$printer -> selectPrintMode();
		$printer -> text(setting_by_key('phone')."\n");
		
		$printer -> feed();

		/* Title of receipt */
		$printer -> setEmphasis(true);
		$printer -> text("INVOICE No. ".$sale->invoice_no."\n");
		$printer -> setEmphasis(false);
		
		/*---------Barcode---------*/
		$printer -> setBarcodeHeight(80);
		$printer -> barcode($sale->id);
		//$printer -> feed();

		/* Items */
		$printer -> setJustification(Printer::JUSTIFY_LEFT);
		$printer -> setEmphasis(true);
		$printer -> text($this->newItem('', $currency));
		$printer -> setEmphasis(false);
		foreach ($items as $item) {
			$printer -> text($item);
		}
		$printer -> setEmphasis(true);
		$printer -> text($subtotal);
		$printer -> setEmphasis(false);
		$printer -> feed();

		/* Tax and total */
		$printer -> text($tax);
		$printer -> selectPrintMode(Printer::MODE_DOUBLE_WIDTH);
		$printer -> text($total);
		$printer -> selectPrintMode();

		/* Footer */
		$printer -> feed(2);
		$printer -> setJustification(Printer::JUSTIFY_CENTER);
		$printer -> text("Thanks Visit Again.\n");
		//$printer -> text("For trading hours, please visit example.com\n");
		$printer -> feed(1);
		$printer -> text($date . "\n");
		$printer -> feed(2);
		/* Cut the receipt and open the cash drawer */
		$printer -> cut();
		$printer -> pulse();

		$printer -> close();		
    }
	
	public function newItem($name = '', $price = '', $dollarSign = false)
	{
				$rightCols = 8;
				$leftCols = 18;
				if ($dollarSign) {
					$leftCols = $leftCols / 2 - $rightCols / 2;
				}
				$left = str_pad($name, $leftCols) ;

				$sign = ($dollarSign ? $dollarSign.' ' : '');
				$right = str_pad($sign . $price, $rightCols, ' ', STR_PAD_LEFT);
				return "$left$right\n";
	}
	
}
