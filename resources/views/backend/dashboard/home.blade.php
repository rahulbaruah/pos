@extends('layouts.app')

@section('content')
<?php $currency =  setting_by_key("currency"); 
$Days = array("Domingo","Lunes","Martes","Miércoles",
                  "Jueves","Viernes","Sábado");
$Months =array(1=>"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio",
             "Agosto","Septiembre","Octubre","Noviembre","Diciembre");



?>
 <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-2 col-md-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">{{$total_sales_today}}</span>
                        <h5>@lang('dashboard.today')</h5>
                    </div>
                    <div class="ibox-content">
                        <h4 class="no-margins">{{$currency}}{{$today}}</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">{{$total_sales_yesterday}}</span>
                        <h5>@lang('dashboard.yesterday')</h5>
                    </div>
                    <div class="ibox-content">
                        <h4 class="no-margins">{{$currency}}{{$yesterday}}</h4>
                        
                    </div>
                </div>
            </div>

			
			 <div class="col-lg-2 col-md-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
					<span class="label label-info pull-right">{{$total_sales_last_week}}</span>
                        <h5>@lang('dashboard.7_days') </h5>
                    </div>
                    <div class="ibox-content">
                        <h4 class="no-margins">{{$currency}}{{$last_week}}</h4>
                       
                    </div>
                </div>
            </div>

			
			 <div class="col-lg-2 col-md-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
					<span class="label label-info pull-right">{{$total_sales_last_month}}</span>
                         <h5>@lang('dashboard.30_days')</h5>
                    </div>
                    <div class="ibox-content">
                        <h4 class="no-margins">{{$currency}}{{$last_month}}</h4>
                        <!--<div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
                        <small>New orders</small> -->
                    </div>
                </div>
            </div>
			
			<div class="col-lg-4 col-md-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">{{$total_sales}} </span>
                        <h5>@lang('dashboard.total_sales')</h5>
                    </div>
                    <div class="ibox-content">
                        <h4 class="no-margins">{{$currency}}{{$total_earning}}</h4>                        
                    </div>
                </div>
            </div>
            
        </div>
		
	
		
		<div class="col-lg-6 col-md-6">
        <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5> @lang('dashboard.last_pos_sales') </h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
           
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>@lang("dashboard.sales_date")</th>
                            <th>@lang("dashboard.discount")</th>
                            <th>@lang("dashboard.total_amount")</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    @if (!empty($sales))
                        @forelse ($sales as $key => $sale)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>{{ $sale->created_at->format('d F Y') }}</td>
                                <td>{{$currency}} {{ $sale->discount }}</td>
                                <td>{{$currency}} {{ $sale->amount }}</td>								
                                <td>
								  <a target="_blank" href="{{ url('reports/sales/' . $sale->id) }}" class="btn btn-primary btn-xs pull-right"> @lang('dashboard.show')</a>
									
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
            </div>

        </div>
		
        </div>
        </div> 
		
		
		<div class="col-lg-6 col-md-6">
        <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>@lang('dashboard.top_10_items')</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
           
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>@lang("dashboard.product_name")</th>
                            <th>@lang("dashboard.sales") </th>
                        </tr>
                    </thead>
                    <tbody>
                    @if (!empty($sales_by_product))
                        @forelse ($sales_by_product as $key => $item)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>{{ $item->product_name }}</td>
                                <td>{{ $item->total_sales }}</td>
								
		
								
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
            </div>

        </div>
		
        </div>
        </div> 
		
		

        </div>

		
	<?php /* <script src="{{url('assets/js/plugins/flot/jquery.flot.js')}}"></script>
    <script src="{{url('assets/js/plugins/flot/jquery.flot.tooltip.min.js')}}"></script>
    <script src="{{url('assets/js/plugins/flot/jquery.flot.resize.js')}}"></script>
    <script src="{{url('assets/js/plugins/flot/jquery.flot.pie.js')}}"></script>
    <script src="{{url('assets/js/plugins/flot/jquery.flot.time.js')}}"></script> */ ?>
	
	<!--<script src="//code.highcharts.com/highcharts.js"></script>
	<script src="//code.highcharts.com/modules/exporting.js"></script>-->

		
		<script> 
		// $(function() {
   // var barOptions = {
        // series: {
            // lines: {
                // show: true,
                // lineWidth: 2,
                // fill: true,
                // fillColor: {
                    // colors: [{
                        // opacity: 0.0
                    // }, {
                        // opacity: 0.0
                    // }]
                // }
            // }
        // },
        // xaxis: {
            // tickDecimals: 0
        // },
        // colors: ["#1ab394"],
        // grid: {
            // color: "#999999",
            // hoverable: true,
            // clickable: true,
            // tickColor: "#D4D4D4",
            // borderWidth:0
        // },
        // legend: {
            // show: false
        // },
        // tooltip: true,
        // tooltipOpts: {
            // content: "x: %x, y: %y"
        // }
    // };
    // var barData = {
        // label: "bar",
        // data: [
            // [1, 34],
            // [2, 25],
            // [3, 19],
            // [4, 34],
            // [5, 32],
            // [6, 44]
        // ]
    // };
    // $.plot($("#flot-line-chart"), [barData], barOptions);
    

// });


// //Flot Pie Chart
// $(function() {
// var myArray = ['#617EBB', '#48C2A9' , '#2c2ccc' , '#2ccc47','#48C2A9','#e5dd42'];   
    // var data = [
	// <?php if(!empty($sales_by_product)) { foreach($sales_by_product as $sale) { ?>
            
			// {
        // label: "<?php echo $sale->product_name; ?>",
        // data: <?php echo $sale->total_sales; ?>,
        // color: myArray[Math.floor(Math.random() * myArray.length)],
    // },<?php } } ?> ];

    // var plotObj = $.plot($("#flot-pie-chart"), data, {
        // series: {
            // pie: {
                // show: true
            // }
        // },
        // grid: {
            // hoverable: true
        // },
        // tooltip: true,
        // tooltipOpts: {
            // content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            // shifts: {
                // x: 20,
                // y: 0
            // },
            // defaultTheme: false
        // }
    // });

// });

</script>

<?php if(count($get_orders_365) > 0) { ?>

<script type="text/javascript">
    
</script>

<?php } ?>
@endsection
