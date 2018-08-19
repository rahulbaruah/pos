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
use Log;

class SaleController extends Controller
{
    public function index()
    {
        /*if(Auth::user()->role_id == 1) { 
            $data['sales'] = Sale::select("*" , "sales.id as id")->where("status",'>',0)->where("type", "pos")->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy("sales.id", "DESC")->groupBy('sales.id')->paginate(25);
        } else { 
            $data['sales'] = Sale::where("cashier_id", Auth::user()->id)->where("status",'>',0)->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy("sales.id", "DESC")->groupBy('sales.id')->paginate(25);
        }*/
		
		$data['sales'] = Sale::select("*" , "sales.id as id")->where("status",'>',0)->where("type", "pos")->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy("sales.id", "DESC")->groupBy('sales.id')->paginate(25);
        
        return view('backend.sales.index', $data);
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::orderBy('name', 'ASC')->get();
        $products = Product::where("is_delete" , 0)->orderBy("name" , "ASC")->get();
        return view('backend.sales.create', ['products' => $products,'categories' => $categories]);
    }

    public function receipt($id)
    {
		$sale = Sale::findOrFail($id);
        
		$data = [
            'sale' => $sale,
        ];

        return view('backend.sales.receipt', $data);
    }
    
    public function completeSale(Request $request)
    {
		$request->validate([
			'items' => 'required',
		]);
		
        $form = $request->all();
		$items = $request->input('items');
		$amount = 0;
		foreach($items as $item) { 
			$amount += $item['price'] * $item['quantity'];
		}	
		$amount += $request->input('scharge') + $request->input('vat') + $request->input('delivery_cost') - $request->input('discount');
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

        return url("sales/receipt/".$sale->id);
		
		/*$printresult1 = '';
		$printresult2 = '';
		
		if(setting_by_key('printer1')) {
			$printresult1 = $this->printInvoice($sale, setting_by_key('printer1'));
		}
		
		if($printresult1 == 'success') {
			return 'success';
		}
		
		return 'Could not print. Please see log.';*/
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
		$total = $this->newItem('Total', number_format($sale->subtotal - $sale->discount + $sale->vat,2), $currency);
		/* Date is kept the same for testing */
		// $date = date('l jS \of F Y h:i:s A');
		$date = date('l jS \of F Y h:i:s A');
		
		try {
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

			$printer -> text("GSTIN:18AIUPB0248F12C\n");
			
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
			$tax1 = $this->newItem('GST@'.setting_by_key("vat").'%', number_format($sale->vat,2));
			$printer -> text($tax1);
			$tax2 = $this->newItem('S.CHARGE@'.setting_by_key("scharge").'%', number_format($sale->scharge,2));
			$printer -> text($tax2);
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
			return 'success';
		} catch(Exception $e) {
			trigger_error($e -> getMessage()); // Should be logged some-place for troubleshooting.
			return $e -> getMessage();
		}
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
	
	public function autocomplete(Request $request)
    {
        //Log::info($request);
        
        $term = $request->input('term');
    
        $results = [];
        
        $queries = Product::select('id', 'name', 'prices', 'titles')
                            ->where('name', 'LIKE', '%'.$term.'%')
                            ->get();
        
        foreach ($queries as $product) {
			$prices = json_decode($product->prices); $titles = json_decode($product->titles);
            $results[] = [ 'id' => $product->id, 'value' => $product->name.' ('.$prices[0].')', 'name' => $product->name, 'price' =>  $prices[0], 'size' => $titles[0] ];
        }
        
        return response()->json($results);
    }
	
}
