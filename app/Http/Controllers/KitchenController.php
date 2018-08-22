<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Sale;
use App\Kitchen;
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

class KitchenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['kitchens'] = Kitchen::select("*" , "kitchen.id as id")->where("status",'>',0)->leftJoin("kitchen_items as s" , "s.kitchen_id" , '=', "kitchen.id" )->orderBy("kitchen.id", "DESC")->groupBy('kitchen.id')->paginate(25);
        
        return view('backend.kitchen.index', $data);
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
        return view('backend.kitchen.create', ['products' => $products,'categories' => $categories]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
	
	public function receipt($id)
    {
		$sale = Kitchen::findOrFail($id);
        
		$data = [
            'sale' => $sale,
        ];

        return view('backend.kitchen.receipt', $data);
    }
	
	public function completeSale(Request $request)
    {
		$request->validate([
			'items' => 'required',
		]);

        $form = $request->all();
		$items = $request->input('items');
		/*$amount = 0;
		foreach($items as $item) { 
			$amount += $item['price'] * $item['quantity'];
		}	
		$amount += $request->input('scharge') + $request->input('vat') + $request->input('delivery_cost') - $request->input('discount');
		$form['amount'] = $amount;*/
		
		/*$rules = Sale::$rules;
        $rules['items'] = 'required';

        $validator = Validator::make($form, $rules);

        if ($validator->fails()) {
            return response()->json(
                [
                'errors' => $validator->errors()->all(),
                ], 400
            );
        }*/
		
        $sale = Kitchen::createAll($form);

        return url("kitchen/receipt/".$sale->id);
		
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
        Kitchen::where("id", $id)->update(array("status" => 0));
        return redirect("kitchen");
    }
	
	public function getKitchenItems($table_no){
		$kitchen_orders = Kitchen::where("table_no", $table_no)
							->where("status", 1)
							->get();
		$items = [];
		foreach($kitchen_orders as $kitchen_order) {
			foreach($kitchen_order->items as $kitchen_item) {
				$product = $kitchen_item->product;				
				$prices = json_decode($product->prices); $titles = json_decode($product->titles);
				$items[] = [ 'id' => $product->id, 'name' => $product->name, 'price' =>  $prices[0], 'size' => $titles[0] ];
			}
		}
		
        return response()->json($items);
	}
}
