<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\ReportsEmail;
use DB;
use Mail;
use App\User;
use Response;
use PDF;
use App\Sale;
class EmailController extends Controller
{
	public function index() {
		
		    $query = DB::table("sales")->where("status",'>',0);
		    $query->whereDay('sales.created_at', '=', date('d'));
			
			$sales = $query->select("*", DB::raw('SUM(amount) as total_amount'))->groupBy("cashier_id")->get();
			foreach($sales as $sale) {  
				$sale->user = User::find($sale->cashier_id);
			}
			
			 $data['sales'] = $sales;
			
			$pdf = "";
			if(!empty($_GET['pdf'])) {
				$pdf = $_GET['pdf'];
			}
			if($pdf == "yes") { 
				$data['title'] = "Staff Sold Report";
				//return view("backend.reports.staff_sold_pdf" , $data);
				$pdf = PDF::loadView('backend.reports.staff_sold_pdf' , $data);
				return $pdf->download('staff_sold.pdf');
			}
			
	
			
			$headers = array(
				'Content-Type' => 'application/vnd.ms-excel; charset=utf-8',
				'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
				'Content-Disposition' => 'attachment; filename=staff_sold.csv',
				'Expires' => '0',
				'Pragma' => 'public',
			);
			$name = "staff_sold";
			$filename = "staff_sold".date("d-m-Y",time()).".csv";
		
			$handle = fopen($filename, 'w');
			if(count($sales) > 0) { 
				fputcsv(
				$handle, [
					"#","Name", "Amount"
				]
			);

				foreach($sales as $key=>$sale) {
					fputcsv(
							$handle, [
							  $key+1,
							  isset($sale->user->name) ? $sale->user->name : "Unknown",
							  $sale->total_amount,
							]
						);
				}
			fclose($handle);
			
			//return Response::download($filename, "staff_sold.csv", $headers);
			
			}
			$content = array(
				"subject" => "Daily Staff Sales Report ",
				"message" => "This is a test mail message",
				"sales" => $sales,
				"file" => $filename,
			);
			
		Mail::to(setting_by_key("r_email_1"))->cc(setting_by_key("r_email_2"))->send(new ReportsEmail($content));
	}
	
	
	public function DailySales() {
		
		    $query = Sale::where("status",'>',0);
			$query->whereDay('sales.created_at', '=', date('d'));
			
			$sales = $query->select("*" , "sales.id as id")->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy('sales.created_at', 'DESC')->groupBy("s.sale_id")->get();
			
			$headers = array(
				'Content-Type' => 'application/vnd.ms-excel; charset=utf-8',
				'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
				'Content-Disposition' => 'attachment; filename=abc.csv',
				'Expires' => '0',
				'Pragma' => 'public',
			);
			$filename = "daily_sales".time().".csv";
		
			$handle = fopen(storage_path('app/reports/'.$filename), 'w');
			if(count($sales) > 0) { 
				fputcsv(
				$handle, [
					"#","Amount", "Payment With", "Kitchen Order #"
				]
			);
			$total_amount = 0;
			//$total_discount = 0;
				foreach($sales as $key=>$sale) {
					
					$kods = [];
					foreach($sale->kods as $kod) {
						$kods[] = $kod->kitchen_id;
					}
										
					fputcsv(
							$handle, [
							  $key+1,
							  $sale->amount,
							  $sale->payment_with,
							  implode(', ', $kods)
							]
						);
					
					$total_amount += $sale->amount;
				}
				
				//$total_discount += $sale->discount; 
				
						fputcsv(
							$handle, [
							  "Total",							  
							  $total_amount,
							]
						);
						
			fclose($handle);
			
			//return Response::download($filename, "$name.csv", $headers);
			
			}
			$content = array(
				"subject" => "Daily Sales",
				"message" => "Daily Sales",
				"sales" => $sales,
				"file" => $filename,
			);
		
		Mail::to(setting_by_key("r_email_1"))->cc(setting_by_key("r_email_2"))->send(new ReportsEmail($content));
		
		//return new ReportsEmail($content);
	}
	
	

}
