@extends('layouts.app')

@section('content')

 <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>@lang('common.products') </h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="{{url('')}}">@lang('common.home')</a>
                        </li>
                     
                        <li class="active">
                            <strong>@lang('common.products')</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
				<h5>@lang('common.products') </h5>
                    <div class="ibox-title">
						<form role="search" class="" action="" method="GET">
							<div class="col-sm-4">
								<div class="input-group">
								  <input name="q" type="text" class="form-control" placeholder="Search for..." value="{{ app('request')->input('q') }}">
								  <span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
								  </span>
								</div><!-- /input-group -->
							  </div><!-- /.col-lg-6 -->
						</form>
                        <div class="ibox-tools">						
						<a href="{{ url('products/create') }}" class="btn btn-primary btn-xs">@lang('common.add_new')</a>
						
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
							
                          
                           
                        </div>
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" >
					
					 <thead>
                        <tr>
                            <th>#</th>
                            <th>Photo</th>
                            <th>@lang('common.name')</th>
                            <th>Price</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    @forelse ($products as $key => $product)
                        <tr class="gradeX">
                            <td>{{ $products->firstItem() + $key }}</td>
                            <td>
							@if(file_exists('uploads/products/thumb/' . $product->id . '.jpg'))
								<img width="50px" src="{{url('uploads/products/thumb/' .$product->id . '.jpg')}}">
							@else
								<img width="50px" src="{{url('herbs/noimage.jpg')}}">
							@endif
							</td>
                            <td>{{ $product->name }}</td>
							<?php $prices = json_decode($product->prices); ?>
                            <td>{{ $prices[0] }}</td>
                            <td>
                                <form id="delete-product" action="{{ url('products/' . $product->id) }}" method="POST" class="form-inline">
                                    <input type="hidden" name="_method" value="delete">
                                    {{ csrf_field() }}
                                    <input type="submit" value="@lang('common.delete')" class="btn btn-danger btn-xs pull-right btn-delete">
                                </form>
                                 <a href="{{ url('products/' . $product->id . '/edit') }}" class="btn btn-primary btn-xs pull-right"><i class="fa fa-pencil-square-o"> </i> </a>
                            </td>
                        </tr>
                    @empty
                        <tr> 
						  <td colspan="5">
								  @lang('common.no_record_found')
									
                                </td>
								</tr>
                    @endforelse
						<tr> 
						  <td colspan="5">
						{!! $products->render() !!}
						</td>
								</tr>
                    </tbody>
					
					
                    </table>
                        </div>

                    </div>
                </div>
            </div>
            </div>
           
        </div>
   
@endsection
