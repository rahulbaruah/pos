<div class="body">

<?php $currency =  setting_by_key("currency"); ?>
     <div class="page" >
      <!--<br>
      <br>-->
<table width="100%" cellpadding="10" class="tableS" cellspacing="10" style="font-family: Times New Roman; margin-left:0" >
 <tr>
    <td colspan="2" style="text-align:center" class="noborder">
    <!--<img src="{{url('uploads/logo.jpg')}}" width="220" alt="PRA">-->
        <h2>{{setting_by_key('title')}}</h2>
		<strong>{{setting_by_key('address')}}, {{setting_by_key('phone')}}</strong>
    </td>
    
 </tr>

</table>

<table width="90%" cellpadding="10" class="tableS" cellspacing="10" style="font-family: Times New Roman; margin-left:20px;">
    <thead>
 
 <tr>
    <td colspan="3" class="noborder"><strong>@lang('slip.date')</strong> <?php echo $sale->created_at->format('d M, Y'); ?><br/><?php echo $sale->created_at->format('h:i A'); ?> 
        </td>
 </tr>
 <tr>
    <td class="noborder" colspan="5"><strong>Kitchen Order No</strong> {{ $sale->id }}</td>
 </tr>
 <tr>
    <td class="noborder" colspan="5"><strong>@lang('slip.table_no')</strong> {{ $sale->table_no }}</td>
 </tr>
 </thead>
 </table>

<table width="90%" cellpadding="10" class="tableS" cellspacing="10" style="font-family: Times New Roman; margin-left:10px" >
 <thead>
 <tr>
    <td><strong>Particulars<br/>Unit Price</strong></td>
    <td><strong>Qty</strong></td>   
 </tr>
</thead>
<tbody>
    @foreach($sale->items as $item)
                                <tr>
                                    <td>{{ $item->product->name }}<!--<br/><?php echo $currency; ?>{{$item->price}}--></td>
                                    <td>{{ $item->quantity }}</td>
                                </tr>
    @endforeach
</tbody>
</table>
    

</div>

</div>
<p align="center"><input type="button" id="pr" value="Print" onclick="printpage()" class="btn btn-success noprint" /> </p>
<p align="center"><a class="noprint" style="text-align:center" href="{{url('kitchen/create')}}"> @lang('slip.back') </a> </p>


</center>
 

  
       
    
    

  
       
    
    


<script type="text/javascript">
    function printpage() {
        //Get the print button and put it into a variable
        var printButton = document.getElementById("pr");
       // var printButtonk = document.getElementById("prK");
        //Set the print button visibility to 'hidden' 
       // printButton.style.visibility = 'hidden';
       // printButtonk.style.visibility = 'hidden';
        document.title = "";
        document.URL   = "";
        
        //Print the page content
        window.print()
        //Set the print button to 'visible' again 
        //[Delete this line if you want it to stay hidden after printing]
        printButton.style.visibility = 'visible';
       // printButtonk.style.visibility = 'visible';
        
        
    }
</script>

<script type="text/javascript">
    function printpageK() {
        //Get the print button and put it into a variable
        var printButton = document.getElementById("pr");
        //var printButtonk = document.getElementById("prK");
        var kitchen = document.getElementsByClassName("kitchen");
        //Set the print button visibility to 'hidden' 
        for(var i = 0; i < kitchen.length; i++){
            kitchen[i].style.visibility = "hidden"; 
        }
        //printButton.style.visibility = 'hidden';
        //printButtonk.style.visibility = 'hidden';
        
        document.title = "";
        document.URL   = "";
        
        //Print the page content
        window.print()
        //Set the print button to 'visible' again 
        //[Delete this line if you want it to stay hidden after printing]
        printButton.style.visibility = 'visible';
       // printButtonk.style.visibility = 'visible';
        for(var i = 0; i < kitchen.length; i++){
            kitchen[i].style.visibility = "visible"; 
        }
        
    }
</script>


<style>
.tableS { margin-left: 20px; margin-top:0; font-family:Verdana, Geneva, sans-serif; font-size: 9px !important;}
    .tableS tr td  {  padding:2px; font-family:Verdana, Geneva, sans-serif; }
    .tableS tr td.noborder { border:none;  }

.removeborder {border:none !important; }
    body {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        background-color: #FAFAFA;
        font: 12pt "Tahoma";
font-family:Verdana, Geneva, sans-serif;

    }
    * {
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        font-family:Verdana, Geneva, sans-serif;
    }
    .page {
     
       width: 4.8cm;
            height: auto; 
     
        margin: 0 auto;
       
      
        background: white;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);

        font-weight: normal;
              font-size: 9px !important;
              font-family:Verdana, Geneva, sans-serif;
             
    }
    .font_size
    {
      font-size: 8em "tahoma";
      font-family:Verdana, Geneva, sans-serif;
    }
    
    .grandtotalFont { font-size:10em "tahoma"; }
    
    @page {
        size: 4.8cm auto;
        margin:0;
        margin-top: 0;
        font-family:Verdana, Geneva, sans-serif;
    }


 
 
    
    
    @media print {
        html, body {
            width: 4.8cm;
            height: auto; 
            font-size: 8px;   
           margin: 0;  
           font-family:Verdana, Geneva, sans-serif;
       
        }
    
        .noprint{
           display:none;
       }

    table {
            -fs-table-paginate: paginate;
            font-family:Verdana, Geneva, sans-serif;
            page-break-inside: avoid !important;
        }


        .page {
            margin: 0;
            border: initial;
            border-radius: initial;
            width: initial;
            min-height: initial;
            box-shadow: initial;
            background: initial;
            font-family:Verdana, Geneva, sans-serif;
        }
.removeborder {border:none; }


       .form-horizontal,label{
              font-weight: normal;
              font-size: 9px !important;
              font-family:Verdana, Geneva, sans-serif;
              
        }
        .testing {
             display: block;
             font-family:Verdana, Geneva, sans-serif;
        }
        .tableStyle {
            font-family:Verdana, Geneva, sans-serif;

        }
        .tableStyle:last-child {
     font-family:Verdana, Geneva, sans-serif;
}

.page table tr td  {   padding:2px; font-family:Verdana, Geneva, sans-serif; }
       .form-horizontal,label{
              font-weight: normal;
              font-size: 9px !important;
              font-family:Verdana, Geneva, sans-serif;
              
        }
        
        .grandtotalFont { font-size:10em "tahoma"; }

    }
</style>
