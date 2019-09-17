<?php include('include/header.php');?>	
<style>
table.dataTable thead .sorting:before, table.dataTable thead .sorting_asc:before, table.dataTable thead .sorting_desc:before, table.dataTable thead .sorting_asc_disabled:before, table.dataTable thead .sorting_desc_disabled:before
{
    display: none;
}
table.dataTable thead .sorting:after, table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_desc:after, table.dataTable thead .sorting_asc_disabled:after, table.dataTable thead .sorting_desc_disabled:after
{
    display: none;
}
</style>
<section role="main" class="content-body">
	<header class="page-header">
		<h2>Timetable</h2>
	
		<div class="right-wrapper text-right">
			<ol class="breadcrumbs">
				<li>
					<a href="dashboard.php">
						<i class="fa fa-home"></i>
					</a>
				</li>
				<li><span>Forms</span></li>
				<li><span>Timetable</span></li>
			</ol>
	
			<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
		</div>
	</header>

	<!-- start: page -->
		<section class="card">
			<header class="card-header">
				<div class="card-actions">
					<a href="#" class="card-action card-action-toggle" data-card-toggle></a>
					<a href="#" class="card-action card-action-dismiss" data-card-dismiss></a>
				</div>
		
				<h2 class="card-title">Timetable</h2>
			</header>
			<div class="card-body">
				<?php if(isset($error_msg)){ ?>
					<div class="alert alert-danger" id="alert">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
							<strong><?php echo $error_msg; ?></strong>  
						</div>
				<?php } ?>
				
				<?php if(isset($success_msg)){ ?>
					<div class="alert alert-success" id="success">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
							<strong><?php echo $success_msg; ?></strong>  
						</div>
				<?php } ?>
							
				 
 <?php $this->load->helper('form');?>
 <?php echo form_open_multipart('Welcome/timetables');?>  
 		<div class="row">
			<div class="col-sm-4">
				<div class="mb-3">
					<a href="<?php echo base_url(); ?>index.php/timetables_add">
					<button id="addToTable" type="button"  class="btn btn-primary">Add <i class="fa fa-plus"></i></button>
					</a>
				</div>
			</div>
			<div class="col-sm-2" style="float: left">
				<div class="mb-2">
					<select  name="class" id="class_sel" class="form-control" required > 
						<option value="0">Select Class</option>
							<?php foreach ($class_show as $row) { ?>
							<option <?php if($class == $row->id){  echo "selected" ; }?> value="<?php echo $row->id;?>">
								<?php echo $row->class;?>
							</option> 
						<?php  }?> 
					</select>
				</div>
			</div>
			<div class="col-sm-2" style="float: left">	
				<div class="mb-2" >
					<select  name="section" id="sections_sel" class="form-control"  required > 
						<option value="0">Select Section</option> 
						<?php   foreach ($sections_distinct as $row) { ?>
    						<option <?php if($section1 == $row->sections){  echo "selected" ; }?>  value="<?php echo $row->sections;?>" >
    							<?php echo $row->sections;?> 
    						</option> 
						<?php } ?> 
					</select>
				</div>
			</div>
			<div class="col-sm-4" style="float: left">	
				<div class="mb-4" >
					<input class="btn btn-primary" type="submit"  name="Search" value="Show"> 
					<input class="btn btn-primary" id="clear" type="submit"  name="Clear All" value="Clear All">
					<input class="btn btn-primary" type="submit"  name="Edit" value="Edit"> 
					<input class="btn btn-primary" type="submit"  name="Delete" value="Delete">   
				</div>
			</div>
		</div> 
<?php echo form_close(); ?> 

<?php if(isset($timetables_show[0])){ $timetable = json_decode($timetables_show[0]->details, True) ;  
$week =array('mon','tue','wed','thu','fri','sat','sun');
 ?> 
 Class : <?php echo $timetable['class'] ; ?> <br>Section : <?php echo $section1 ; ?> 
				<table  class="table table-bordered table-striped mb-0" id="datatable-tabletools" >
					<thead>
						<tr>
							<th style="display:none">Day</th>
							<th>Day</th>
    						<?php for($i=1;$i<= max($timetable['lecture']);$i++){  ?>
    							<th>Period <?php echo $i;?></th>  
    						<?php }?>  
						</tr>
					</thead>
 					<tbody>    
					<?php  for($i=0;$i<7;$i++){
					      $sub='subject_'.$week[$i];
					      $start ='start_time_'.$week[$i];
					      $end ='end_time_'.$week[$i]; ?>
 					<tr >  
							<th style="display:none"><?php echo $i;?></th>
						<th><?php echo ucfirst($week[$i]);?></th>  
						<?php for($j=0;$j< max($timetable['lecture']);$j++){  ?>
                      <th>
                    	<?php if(isset($timetable[$sub][$j]) &&  $timetable[$sub][$j]!=''){ echo $timetable[$sub][$j] ; }?>
                    	<br><?php if(isset($timetable[$start][$j]) &&  $timetable[$start][$j]!=''){ ?>(<?php  echo $timetable[$start][$j] ; ?> 
                    	- <?php  if(isset($timetable[$end][$j]) &&  $timetable[$end][$j]!=''){ echo $timetable[$end][$j] ;  } ?>)<?php } ?>
                    </th>  
                  	  <?php }?>  
                   
     				</tr> 	    
					<?php }?>  
     				</tbody>	
				</table>
				<?php }?>
			</div>
		</section>
	<!-- end: page -->
</section>

<?php include('include/footer.php');?>			
<!-- Vendor -->
<script src="<?php echo base_url(); ?>vendor/jquery/jquery.js"></script>
<script src="<?php echo base_url(); ?>vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="<?php echo base_url(); ?>vendor/popper/umd/popper.min.js"></script>
<script src="<?php echo base_url(); ?>vendor/bootstrap/js/bootstrap.js"></script>
<script src="<?php echo base_url(); ?>vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="<?php echo base_url(); ?>vendor/common/common.js"></script>
<script src="<?php echo base_url(); ?>vendor/nanoscroller/nanoscroller.js"></script>
<script src="<?php echo base_url(); ?>vendor/magnific-popup/jquery.magnific-popup.js"></script>
<script src="<?php echo base_url(); ?>vendor/jquery-placeholder/jquery-placeholder.js"></script> 
<!-- Specific Page Vendor -->
<script src="<?php echo base_url(); ?>vendor/select2/js/select2.js"></script>
<script src="<?php echo base_url(); ?>vendor/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url(); ?>vendor/datatables/media/js/dataTables.bootstrap4.min.js"></script>
<script src="<?php echo base_url(); ?>vendor/datatables/extras/TableTools/Buttons-1.4.2/js/dataTables.buttons.min.js"></script>
<script src="<?php echo base_url(); ?>vendor/datatables/extras/TableTools/Buttons-1.4.2/js/buttons.bootstrap4.min.js"></script>
<script src="<?php echo base_url(); ?>vendor/datatables/extras/TableTools/Buttons-1.4.2/js/buttons.html5.min.js"></script>
<script src="<?php echo base_url(); ?>vendor/datatables/extras/TableTools/Buttons-1.4.2/js/buttons.print.min.js"></script> 
<script src="<?php echo base_url(); ?>vendor/datatables/extras/TableTools/JSZip-2.5.0//jszip.min.js"></script>
<script src="vendor/datatables/extras/TableTools/pdfmake-0.1.32/pdfmake.min.js"></script>
<script src="<?php echo base_url(); ?>vendor/datatables/extras/TableTools/pdfmake-0.1.32/vfs_fonts.js"></script> 
<!-- Theme Base, Components and Settings -->
<script src="<?php echo base_url(); ?>js/theme.js"></script> 
<!-- Theme Custom -->
<script src="<?php echo base_url(); ?>js/custom.js"></script> 
<!-- Theme Initialization Files -->
<script src="<?php echo base_url(); ?>js/theme.init.js"></script> 
<!-- Examples<?php echo base_url(); ?> -->
<script src="js/examples/examples.datatables.default.js"></script>
<script src="<?php echo base_url(); ?>js/examples/examples.datatables.row.with.details.js"></script>
<script src="<?php echo base_url(); ?>js/examples/examples.datatables.tabletools.js"></script>
	
		

<script type="text/javascript">
var d = document.getElementById("timetables");
d.className += " nav-active";  
var n = document.getElementById("nav1");
n.className += " nav-expanded nav-active"; 


function edit($id,$date,$time, $subject,$class,$sections,$sections_id){ 

	$('#id').val($id);      
	$('#date').val($date);
	$('#time').val($time);  
    $('#class').val($class);

     var opt = $('<option />');  
	 opt.val($sections_id);
	 opt.text($sections);
	 $('#section').append(opt); 
	   
    var opt = $('<option />');  
	 opt.val($subject);
	 opt.text($subject);
	 $('#subject').append(opt)
	$('#editrow').modal('show'); 
}
function add(){
	$('#addrow').modal('show');  
	$('#nxt_mon').hide();    
	$('#nxt_tue').hide();     
	$('#nxt_wed').hide();     
	$('#nxt_thu').hide();     
	$('#nxt_fri').hide();     
	$('#nxt_sat').hide();     
	$('#nxt_sun').hide();  
	$('#footer').hide();  
}
function del($id){   
	$('#id_del').val($id); 
	$('#delrow').modal('show'); 
}


$(document).ready(function(){

	$('#next').click(function(){   
		if($('#mon').val()>0){      $('#nxt_mon').show();   }
		if($('#tue').val()>0){ 		$('#nxt_tue').show();   }
		if($('#wed').val()>0){ 		$('#nxt_wed').show();   }
		if($('#thu').val()>0){ 		$('#nxt_thu').show();   }
		if($('#fri').val()>0){ 		$('#nxt_fri').show();   }
		if($('#sat').val()>0){ 		$('#nxt_sat').show();   }  
		if($('#sun').val()>0){ 		$('#nxt_sun').show();   }       
		$('#footer').show();  
		var subject = $('#subj').val();    
    	var strArray = subject.split(",");  
    	var opt = '';
        for(var i = 0; i < strArray.length; i++){  
       		 opt +=  "<option>"+strArray[i]+"</option>";  
        }
		var mon =   $('#mon').val();  
		var next_div =''; 
	    for(var i = 1; i <= mon; i++){  
    		next_div +='<label class="col-sm-4 control-label text-sm-right pt-2">Lecture '+i+':</label> ';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="subject[]" id="subject_mon_'+i+'" class="form-control"> '+opt+'</select>';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="start_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="end_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="teacher[]" id="teacher" class="form-control"> </select>';
    		next_div +='</div>'; 
	    }
	    $('#next_div_mon').html(next_div);

		var tue =   $('#tue').val();  
		var next_div =''; 
	    for(var i = 1; i <= tue; i++){  
    		next_div +='<label class="col-sm-4 control-label text-sm-right pt-2">Lecture '+i+':</label> ';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="subject[]" id="subject_tue_'+i+'" class="form-control"> '+opt+' </select>';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="start_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="end_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="teacher[]" id="teacher" class="form-control"> </select>';
    		next_div +='</div>'; 
	    }
	    $('#next_div_tue').html(next_div);

		var wed =   $('#wed').val();  
		var next_div =''; 
	    for(var i = 1; i <= wed; i++){  
    		next_div +='<label class="col-sm-4 control-label text-sm-right pt-2">Lecture '+i+':</label> ';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="subject[]" id="subject_wed_'+i+'" class="form-control"> '+opt+' </select>';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="start_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="end_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="teacher[]" id="teacher" class="form-control"> </select>';
    		next_div +='</div>'; 
	    }
	    $('#next_div_wed').html(next_div);

		var thu =   $('#thu').val();  
		var next_div =''; 
	    for(var i = 1; i <= thu; i++){  
    		next_div +='<label class="col-sm-4 control-label text-sm-right pt-2">Lecture '+i+':</label> ';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="subject[]" id="subject_thu_'+i+'" class="form-control">  '+opt+'</select>';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="start_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="end_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="teacher[]" id="teacher" class="form-control"> </select>';
    		next_div +='</div>'; 
	    }
	    $('#next_div_thu').html(next_div);

		var fri =   $('#fri').val();  
		var next_div =''; 
	    for(var i = 1; i <= fri; i++){  
    		next_div +='<label class="col-sm-4 control-label text-sm-right pt-2">Lecture '+i+':</label> ';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="subject[]" id="subject_fri_'+i+'" class="form-control"> '+opt+' </select>';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="start_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="end_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="teacher[]" id="teacher" class="form-control"> </select>';
    		next_div +='</div>'; 
	    }
	    $('#next_div_fri').html(next_div);

		var sat =   $('#sat').val();  
		var next_div =''; 
	    for(var i = 1; i <= sat; i++){  
    		next_div +='<label class="col-sm-4 control-label text-sm-right pt-2">Lecture '+i+':</label> ';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="subject[]" id="subject_sat_'+i+'" class="form-control">  '+opt+'</select>';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="start_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="end_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="teacher[]" id="teacher" class="form-control"> </select>';
    		next_div +='</div>'; 
	    }
	    $('#next_div_sat').html(next_div);

		var sun =   $('#sun').val();  
		var next_div =''; 
	    for(var i = 1; i <= sun; i++){  
    		next_div +='<label class="col-sm-4 control-label text-sm-right pt-2">Lecture '+i+':</label> ';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="subject[]" id="subject_sun_'+i+'" class="form-control">  '+opt+'</select>';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="start_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<input type="Time" name="end_time[]" id="tm" class="form-control">';
    		next_div +='</div>';
    		next_div +='<div class="col-sm-2">';
    		next_div +='<select name="teacher[]" id="teacher" class="form-control"> </select>';
    		next_div +='</div>'; 
	    }
	    $('#next_div_sun').html(next_div);
    
	});

 
    $('#add_new').attr("disabled", true);
    $('#save').attr("disabled", false);
     
    $('#add_new').click(function(){  
    	$('#add_new').attr("disabled", true);
    	$('#save').attr("disabled", false);  
     	$('#dt').val(''); 
        $('#tm').val(''); 
        $('#sel_sub').val(''); 
        
        $('#error_m').html('');
    	 $('#success_m').html('');
    });
        
    $('#save').click(function(e){   
    	$('#add_new').attr("disabled", false);
    	$('#save').attr("disabled", true);
    	
        e.preventDefault();    
        var form = $('#comment1')[0]; 
    	// Create an FormData object 
        var data = new FormData(form); 
        console.log("data : ", data); 
        $.ajax({
            type:'POST',
            url: "<?php echo base_url(); ?>index.php/timetables_add",
            data:data,
            cache:false,
            contentType: false,
            processData: false,
            success:function(data){
                console.log("succe42342ss");
                console.log(data);
               
                if(data == 1){ 
              		$('#success_m').html('Record inserted successfully');
                }
                else{  
                    $('#error_m').html('Error in insertion   !');
                }
      		 } 
       }); 
    
    });
    	    
    $('#classE').change(function(){  
    $("#section > option").remove();  
    var sel_class = $('#classE').val();  
    	 $.ajax({
    		 type: "GET",
    		 url: "<?php echo base_url(); ?>index.php/sections_fetch", 
    		 data: 'class_sel='+sel_class,
             datatype : "json",
    		 success: function(classD)  
    		 {   
    			 var obj = $.parseJSON(classD);
    			 var opt = $('<option />');  
    			 opt.val('');
    			 opt.text('');
    			 $('#section').append(opt); 
                    $.each(obj, function (index, object) {  
                   		 var opt = $('<option />');  
        				 opt.val(object['id']);
        				 opt.text(object['sections']);
        				 $('#section').append(opt); 
                   }) 
    		 } 
    	 }); 
    });
    
    $('#section').change(function(){  
    	$("#subject > option").remove();  
    	var sel_section = $('#section').val();  
    		 $.ajax({
    			 type: "GET",
    			 url: "<?php echo base_url(); ?>index.php/subject_fetch", 
    			 data: 'sel_section='+sel_section,
    	         datatype : "json",
    			 success: function(classD)  
    			 {   
    				 var obj = $.parseJSON(classD);
    				 var opt = $('<option />');  
    				 opt.val('');
    				 opt.text('');
    				 $('#subject').append(opt); 
    	                $.each(obj, function (index, object) { 
    	                   	console.log(object);
    
    	                	var strArray = object['subject'].split(","); 
    	                 
    	                    for(var i = 0; i < strArray.length; i++){  
        	               		 var opt = $('<option />');  
        	    				 opt.val(strArray[i]);
        	    				 opt.text(strArray[i]);
        	    				 $('#subject').append(opt); 
    	                    }
    	               }) 
    			 } 
    		 }); 
    	});
    
    $('#sel_class').change(function(){  
    $("#sel_section > option").remove();  
    var sel_class = $('#sel_class').val();  
    	 $.ajax({
    		 type: "GET",
    		 url: "<?php echo base_url(); ?>index.php/sections_fetch", 
    		 data: 'class_sel='+sel_class,
             datatype : "json",
    		 success: function(classD)  
    		 {   
    			 var obj = $.parseJSON(classD);
    			 var opt = $('<option />');  
    			 opt.val('');
    			 opt.text('');
    			 $('#sel_section').append(opt); 
                    $.each(obj, function (index, object) {  
                   		 var opt = $('<option />');  
        				 opt.val(object['id']);
        				 opt.text(object['sections']);
        				 $('#sel_section').append(opt); 
                   }) 
    		 } 
    	 }); 
    });
    
    $('#sel_section').change(function(){  
    	$("#sel_sub > option").remove();  
    	var sel_section = $('#sel_section').val();  
    		 $.ajax({
    			 type: "GET",
    			 url: "<?php echo base_url(); ?>index.php/subject_fetch", 
    			 data: 'sel_section='+sel_section,
    	         datatype : "json",
    			 success: function(classD)  
    			 {   
    				 var obj = $.parseJSON(classD);
    				 var opt = $('<option />');  
    				 opt.val('');
    				 opt.text('');
    				 $('#sel_sub').append(opt); 
    	                $.each(obj, function (index, object) { 
    	                   	console.log(object); 
    	                   	$('#subj').val(object['subject']);  
    	               }) 
    			 } 
    		 }); 
    });

});



</script>
 

<!-- add row  
<div class="modal fade" id="addrow" role="dialog"  >
<div class="modal-dialog  modal-lg">
	<div class="modal-content" style="width: 137%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" style="margin: 0px 0px 0px 0px !important; padding: 0px 0px 0px 0px !important;">&times;</button>
          <h3 class="modal-title" style="margin-right:  78%;">Add Timetable</h3>
        </div>
<div class="modal-body">
<div class="col-lg-12"> 
	<section class="card">
	<form id="comment1" method="post" enctype="multipart/form-data" >
		<div class="card-body" style="padding-left: 0%;padding-right: 13%;"> 
			<div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2">Class:</label>
				<div class="col-sm-8">
					<select name="class" id="sel_class" class="form-control">
						<option></option>
						<?php foreach ($class_show as $row) { ?>
							<option value="<?php echo $row->id;?>"> <?php echo $row->class;?> </option> 
						<?php  }?> 
					</select>
				</div>
			</div> 
			<div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2">Sections:</label>
				<div class="col-sm-8">
					<select name="section" id="sel_section" class="form-control"> 
					</select>
				</div>
			</div> 
			<input type="text" name="subject" id="subj">
			<hr>
			<div class="form-group row">  
				<label class="col-sm-4 control-label text-sm-right pt-2"> </label>
				<div class="col-sm-1"> <label class=" control-label text-sm-right pt-2" > Mon </label></div>
				<div class="col-sm-1"> <label class=" control-label text-sm-right pt-2" > Tue </label></div>
				<div class="col-sm-1"> <label class=" control-label text-sm-right pt-2" > Wed</label> </div>
				<div class="col-sm-1"> <label class=" control-label text-sm-right pt-2" > Thur </label></div>
				<div class="col-sm-1"> <label class=" control-label text-sm-right pt-2" > Fri </label></div>
				<div class="col-sm-1"> <label class=" control-label text-sm-right pt-2" > Sat </label></div>
				<div class="col-sm-1"> <label class=" control-label text-sm-right pt-2" > Sun </label></div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2"> No. Of Lectures:</label>
				<div class="col-sm-1"> <input type="number" min="0" name="mon" id="mon" class="form-control"> </div>
				<div class="col-sm-1"> <input type="number" min="0" name="tue" id="tue" class="form-control"> </div>
				<div class="col-sm-1"> <input type="number" min="0" name="wed" id="wed" class="form-control"> </div>
				<div class="col-sm-1"> <input type="number" min="0" name="thu" id="thu" class="form-control"> </div>
				<div class="col-sm-1"> <input type="number" min="0" name="fri" id="fri" class="form-control"> </div>
				<div class="col-sm-1"> <input type="number" min="0" name="sat" id="sat" class="form-control"> </div>
				<div class="col-sm-1"> <input type="number" min="0" name="sun" id="sun" class="form-control"> </div> 
			 </div>
			 <div class="text-right">
    			 <input class="btn btn-primary" type="button" id="next"  value="Next"> 
    			<button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
			</div> 
			
			
			 <div class="form-group row" id="nxt">
    			<label class="col-sm-4 control-label text-sm-right pt-2" style="font-weight: bold"> Monday</label>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" >  	Subject </label></div>
    			<div class="col-sm-2"> <label class=" control-label text-sm-right pt-2" > Start Time </label>	</div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > End Time </label></div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > Teacher </label></div>
			</div> 
			<input type="text" name="day" value="monday">
		   <div class="form-group row" id="next_div_mon">  </div>
		   
		   
			 <div class="form-group row" id="nxt_tue">
    			<label class="col-sm-4 control-label text-sm-right pt-2" style="font-weight: bold"> Tuesday</label>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" >  	Subject </label></div>
    			<div class="col-sm-2"> <label class=" control-label text-sm-right pt-2" > Start Time </label>	</div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > End Time </label></div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > Teacher </label></div>
			</div>
			<input type="text" name="day" value="tueday">
		   <div class="form-group row" id="next_div_tue">  </div>
		   
		   
			 <div class="form-group row" id="nxt_wed">
    			<label class="col-sm-4 control-label text-sm-right pt-2" style="font-weight: bold"> Wednesday</label>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" >  	Subject </label></div>
    			<div class="col-sm-2"> <label class=" control-label text-sm-right pt-2" > Start Time </label>	</div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > End Time </label></div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > Teacher </label></div>
			</div>
			<input type="text" name="day" value="wednesday">
		   <div class="form-group row" id="next_div_wed">  </div>
		   
		   
			 <div class="form-group row" id="nxt_thu">
    			<label class="col-sm-4 control-label text-sm-right pt-2" style="font-weight: bold"> Thursday</label>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" >  	Subject </label></div>
    			<div class="col-sm-2"> <label class=" control-label text-sm-right pt-2" > Start Time </label>	</div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > End Time </label></div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > Teacher </label></div>
			</div>
			<input type="text" name="day" value="thursday">
		   <div class="form-group row" id="next_div_thu">  </div>
		   
		   
			 <div class="form-group row" id="nxt_fri">
    			<label class="col-sm-4 control-label text-sm-right pt-2" style="font-weight: bold"> Friday</label>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" >  	Subject </label></div>
    			<div class="col-sm-2"> <label class=" control-label text-sm-right pt-2" > Start Time </label>	</div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > End Time </label></div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > Teacher </label></div>
			</div>
			<input type="text" name="day" value="friday">
		   <div class="form-group row" id="next_div_fri">  </div>
		   
		   
			 <div class="form-group row" id="nxt_sat">
    			<label class="col-sm-4 control-label text-sm-right pt-2" style="font-weight: bold"> Saturday</label>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" >  	Subject </label></div>
    			<div class="col-sm-2"> <label class=" control-label text-sm-right pt-2" > Start Time </label>	</div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > End Time </label></div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > Teacher </label></div>
			</div>
			<input type="text" name="day" value="saturday">
		   <div class="form-group row" id="next_div_sat">  </div>
		   
		   
			 <div class="form-group row" id="nxt_sun">
    			<label class="col-sm-4 control-label text-sm-right pt-2" style="font-weight: bold"> Sunday</label>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" >  	Subject </label></div>
    			<div class="col-sm-2"> <label class=" control-label text-sm-right pt-2" > Start Time </label>	</div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > End Time </label></div>
    			<div class="col-sm-2"><label class=" control-label text-sm-right pt-2" > Teacher </label></div>
			</div>
			<input type="text" name="day" value="sunday">
		   <div class="form-group row" id="next_div_sun">  </div>
		   
	    </div>
		<footer class="card-footer text-right" id="footer"> 
		<span style="margin-left:10px;color:green;" id="success_m"></span>
		<span style="margin-left:10px;color:red" id="error_m"></span>
			<input class="btn btn-primary" type="button" id="add_new"  value="Add new">
			<input class="btn btn-primary" type="button" id="save"  name="save_practices" value="Save"> 
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()">Close</button>
		</footer>
	</section>  
	<?php echo form_close(); ?>
</div> 

</div>                                          
</div>
</div>                                          
</div>
</div>        

<!-- edit row 
<div class="modal fade" id="editrow" role="dialog"  >
<div class="modal-dialog">
         <div class="modal-content" style="width: 155%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" style="margin: 0px 0px 0px 0px !important; padding: 0px 0px 0px 0px !important;">&times;</button>
          <h3 class="modal-title" style="margin-right:  78%;">Edit Timetable</h3>
        </div>
		<div class="modal-body">         
		       <div class="col-lg-12"> 
	 <section class="card"> 
	 <?php $this->load->helper('form');?>
	 <?php echo form_open_multipart('Welcome/timetables');?>  
	 <input type="hidden" id="id" name="id" class="form-control">
	 
			<div class="card-body" style="padding-left: 0%;padding-right: 13%;"> 
				<div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2">Class:</label>
				<div class="col-sm-8">
					<select name="class" id="classE" class="form-control"> 
						<?php foreach ($class_show as $row) { ?>
							<option value="<?php echo $row->id;?>"> <?php echo $row->class;?> </option> 
						<?php  }?> 
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2">Sections:</label>
				<div class="col-sm-8">
					<select name="section" id="section" class="form-control"> 
					 </select>
				</div>
			</div> 
			<div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2"> Subject:</label>
				<div class="col-sm-8">
					<select name="subject" id="subject" class="form-control">  
					</select>
				</div>
			</div>
	       
	       <div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2">Date:</label>
				<div class="col-sm-8">
					<input type="date" id="date" name="date" class="form-control">
				</div>
			</div>
	    	<div class="form-group row">
				<label class="col-sm-4 control-label text-sm-right pt-2"> Time :</label>
				<div class="col-sm-8">
					<input type="Time" name="time" id="time" class="form-control">
				</div>
			</div>
			
			 
	    </div>

	    </div>
			<footer class="card-footer text-right">
				<input class="btn btn-primary" type="submit"  name="edit_timetables" value="Update">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</footer>
		</section>
	<?php echo form_close(); ?>
	</form>
</div> 

</div>                                          
</div>
</div>       
</div>                                          
</div>
<!-- del row -->
<div class="modal fade" id="delrow" role="dialog"  >
<div class="modal-dialog">
	 <?php $this->load->helper('form');?>
	 <?php echo form_open_multipart('Welcome/timetables');?>  
	<div class="modal-content" style="width: 155%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" style="margin: 0px 0px 0px 0px !important; padding: 0px 0px 0px 0px !important;">&times;</button>
          <h3 class="modal-title" style="margin-right: 75%;">Delete Timetable</h3>
        </div>
<div class="modal-body">  
    <div class="col-lg-12"> 
		<section class="card"> 
			<div class="card-body" style="padding-left: 0%;padding-right: 13%;">
			   <div class="modal-wrapper">
				 <div class="modal-text">
					 <div class="modal-text">
	                 <p>Are you sure that you want to delete this row?</p>
	                 <input type="hidden" id="id_del" name="id" class="form-control">
						<input type="hidden" id="Timetable_name" name="Timetable" class="form-control">
                    </div>
				 </div>
				</div>
		    </div>
			<footer class="card-footer text-right">
				<input class="btn btn-primary" type="submit"  name="del_timetables" value="Delete">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</footer>
		</section> 
	</div> 	
	<?php echo form_close(); ?>		
</div>                                          
</div>
</div>                                          
</div>                                        
</div>										