@extends('layouts.app')

@section('content')
<?php $currency =  $sale->currency; ?>
<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Sale Invoice </h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="{{url('')}}">@lang('common.home')</a>
                        </li>
                     
                        <li class="active">
                            <strong>Invoice </strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
			

<div class="wrapper wrapper-content animated fadeInRight">
                    <div class="ibox-content p-xl">
					<div class="row">
                                <div class="col-sm-4">
                                    <h5>From:</h5>
                                    <address>
                                        <strong>{{$sale->name}}</strong><br>
                                        {{$sale->address}}<br>
                                        <abbr title="Phone">P:</abbr> {{$sale->phone}}<br>
                                        <abbr title="Email">E:</abbr> {{$sale->email}}
                                    </address>
                                </div>
								
								<div class="col-sm-4">
                                    <h5>Table No: {{$sale->table_no}}</h5>
									<?php
										$kods = [];
										foreach($sale->kods as $kod) {
											$kods[] = $kod->kitchen_id;
										}
									?>
                                    <h5>Kitchen Order Nos: {{implode(', ', $kods)}}</h5>
                                </div>

                                <div class="col-sm-4 text-right">
                                    <h4>Invoice No.</h4>
                                    <h4 class="text-navy"> {{ $sale->invoice_no }}</h4>
                                    
                                    <p>
                                        <span><strong>Date:</strong> <?php echo date('d M, Y' , strtotime($sale->created_at)); ?></span><br/>
                                    </p>
                                </div>
                            </div>
							
                            <div class="table-responsive m-t">
                                <table class="table invoice-table">
                                    <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Qty</th>
                                        <th>Unit Price</th>
                                        <th>Total Amount </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
									@foreach($sale->items as $k=>$item)
                                    <tr>
                                        <td>{{ $item->product->name }}({{substr($item->size , 0, 1)}})</td>
                                        <td>{{ $item->quantity }}</td>
                                        <td>{{$currency}}{{$item->price}}</td>
                                        <td>{{$currency}}{{$item->quantity * $item->price}}</td>
                                    </tr>
									@endforeach
                                    
                                    </tbody>
                                </table>
                            </div><!-- /table-responsive -->

                            <table class="table invoice-total">
                                <tbody>
								@if($sale->delivery_cost)
								<tr>
                                    <td><strong>Delivery Charges :</strong></td>
                                    <td>{{$currency}}{{$sale->delivery_cost}}</td>
                                </tr>
								@endif
                                <tr>
                                    <td><strong>Sub Total :</strong></td>
                                    <td>{{$currency}}{{$sale->subtotal}}</td>
                                </tr>
								
								@if($sale->vat)
								 <tr>
                                    <td><strong>CGST {{$sale->vat_percent/2}}%:</strong></td>
                                    <td>{{$currency}}{{$sale->vat/2}}</td>
                                </tr>
								<tr>
                                    <td><strong>SGST {{$sale->vat_percent/2}}%:</strong></td>
                                    <td>{{$currency}}{{$sale->vat/2}}</td>
                                </tr>
								@endif
								
								@if($sale->scharge)
								<tr>
                                    <td><strong>@lang('pos.scharge') {{$sale->scharge_percent/2}}%:</strong></td>
                                    <td>{{$currency}}{{$sale->scharge}}</td>
                                </tr>
								@endif
								
								@if($sale->discount)
                                <tr>
                                    <td><strong>DISCOUNT {{$sale->discount_percent/2}}%:</strong></td>
                                    <td>{{$currency}}{{$sale->discount}}</td>
                                </tr>
								@endif
								
                                <tr>
                                    <td><strong>TOTAL :</strong></td>
                                    <td><strong>{{$currency}}{{$sale->subtotal + $sale->scharge + $sale->vat - $sale->discount}}</strong></td>
                                </tr>
								<tr>
                                    <td><strong>Payment With :</strong></td>
                                    <td>{{$sale->payment_with}}</td>
                                </tr>
                                </tbody>
                            </table>
							
                            <div class="well m-t"><strong>Comments</strong>
                               {{$sale->comment}}
                            </div>
                        </div>
                </div>
@endsection