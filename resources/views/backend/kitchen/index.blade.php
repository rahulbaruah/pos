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
                                <td>
									<a href="{{ url('kitchen/cancel/' . $kitchen->id) }}" class="btn btn-danger btn-xs pull-right">Cancel It</a>
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