@extends('layouts.app')

@section('content')
<?php 
$currency =  setting_by_key("currency");
?>
 <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>All Kitchen Orders</h5>
                        
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
							<th>Kitchen Order No</th>
                            <th>Table No</th>
                            <th>Date</th>
                            <th>Total Amount</th>
                            <!--<th>Status</th>-->
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    @if (!empty($kitchens))
                        @forelse ($kitchens as $key => $kitchen)
                            <tr>
                                <td>{{ $key + 1 }}</td>
								<td>{{ $kitchen->id }}</td>
                                <td>{{ $kitchen->table_no }}</td>
                                <td>{{ $kitchen->created_at->format('d F Y') }}</td>
                                <td>{{$currency}} {{ ($kitchen->amount )}}</td>
									{{--	@if($kitchen->status == 1)  
								<td>
                                    <a href="javascript:void(0)" class="btn btn-primary btn-xs ">Completed</a>
                                </td>
									@else
								<td>
                                    <a href="javascript:void(0)" class="btn btn-danger btn-xs">Canceled</a>
                                </td>
									@endif
									--}}
								
                                <td>
                                    <a target="_blank" href="{{ url('kitchen/receipt/' . $kitchen->id) }}" class="btn btn-primary btn-xs pull-right">@lang('common.show')</a>
                                </td>
                            </tr>
                        @empty
                           <tr> 
						  <td colspan="5">
								 @lang('common.no_record_found')
									
                                </td>
								</tr>
                        @endforelse
                    @endif
                    </tbody>
                </table>
				{!! $kitchens->render() !!}

                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection