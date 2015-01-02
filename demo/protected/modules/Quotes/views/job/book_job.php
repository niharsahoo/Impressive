

 <div class="pageheader">
        <div class="media">
          <div class="media-body">
            <ul class="breadcrumb">
              <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
              <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=Quotes/default/admin">Quotes</a></li>
              <li>Job</li>
            </ul>
            <h4>Book Job</h4>
          </div>
        </div>
        <!-- media --> 
      </div>
      <div class="contentpanel">
	  
	  				
	<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'buildings-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>
		
        <div class="row">
          <div class="col-md-12 quote_section"> 
     	   
                <div class="mb20"></div>
                <div class="panel panel-default">
                  <div class="panel-body titlebar">
                    <span class="glyphicon  glyphicon-th"></span><h2>Book Job</h2>
                  </div>
                </div>
		
                <dl class="quotedetaildl col-md-6">
                  
				  <?php echo $form->errorSummary($model); ?>
				  <dt class="col-md-4">Number staff required</dt>
				  
                  <dd class="col-md-6">
				  <?php echo $form->textField($model,'staff_required',array('onkeypress'=>"return isNumber(event)", 'rows'=>6, 'cols'=>50,'class'=>'form-control')); ?>
				  </dd> 
				  
				  
				  <dt class="col-md-4"></dt>				  
                  <dd class="col-md-6">
					&nbsp;
				  </dd> 
				  

 
				  
				  <dt class="col-md-4">Job Start Date</dt>				  
                  <dd class="col-md-6">
				  <?php echo $form->textField($model,'job_started_date',array('rows'=>6, 'cols'=>50,'class'=>'form-control','id'=>'job_started_date')); ?>
				  
<?php echo $form->error($model,'job_started_date'); ?>					  
				  </dd> 
				  

				       
				   
				  <dt class="col-md-4"></dt>				  
                  <dd class="col-md-6">
					&nbsp;
				  </dd> 
				  

				       
				  
				  <dt class="col-md-4">Job End Date</dt>
				  
<dd class="col-md-6">
				  				  <?php echo $form->textField($model,'job_end_date',array('rows'=>6, 'cols'=>50,'class'=>'form-control','id'=>'job_end_date')); ?>
	
<?php echo $form->error($model,'job_end_date'); ?>
				  </dd> 
				  
				  
				  <dt class="col-md-4"></dt>				  
                  <dd class="col-md-6">
					&nbsp;
				  </dd> 
				  
				
				  
<?php 

				$frequency_type_options = array();	
		
				$criteria = new CDbCriteria();
				$criteria->select = "id,name";
				$criteria->order = 'id';
				$loop_contacts = FrequencyType::model()->findAll($criteria);
				
				foreach ($loop_contacts as $value)  {			
				$frequency_type_options[$value->id] =  $value->name; 
				}


?>					

					  
				  
				  <dt class="col-md-4">Frequency type</dt>
				  
                  <dd class="col-md-6">
				  <?php echo $form->dropDownList($model, 'frequency_type', $frequency_type_options ,array('class'=>'form-control')); ?>					
				  </dd> 
				  
	
	   
				  <dt class="col-md-4"></dt>				  
                  <dd class="col-md-6">
					&nbsp;
				  </dd> 
				  
<?php

$period_start_date = isset($_POST['period_start_date']) ? $_POST['period_start_date'] : '';
$period_end_date = isset($_POST['period_end_date']) ? $_POST['period_end_date'] : '';
		
?>

			  
				  <dt class="col-md-4">Period Start Date</dt>				  
                  <dd class="col-md-6">
				  
		<input type="text" id="period_start_date"  name="period_start_date" class="form-control" value="<?php echo $period_start_date; ?>"/>
		
				  </dd> 
				  

				       
				   
				  <dt class="col-md-4"></dt>				  
                  <dd class="col-md-6">
					&nbsp;
				  </dd> 
				  

				       
				  
				  <dt class="col-md-4">Period End Date</dt>
				  
                  <dd class="col-md-6">
			
			<input type="text" id="period_end_date"  name="period_end_date" class="form-control" value="<?php echo $period_end_date; ?>"/>

				  </dd> 
				  
			




	
				  
				  
				  
				 </dl>
				
				  <dl class="quotedetaildl col-md-6">
				  <dt class="col-md-4">&nbsp;</dt>
				  
                  <dd class="col-md-6">
			
					
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save',array('class'=>'btn btn-primary')); ?>
	
			  
				  </dd>
                  
                </dl>
	
                <div class="clearfix"></div>




				
          </div>
        </div>
		
<?php $this->endWidget(); ?>
		
      </div>
      <!-- contentpanel --> 
   
   
<script type="text/javascript">
   
   
   $(document).ready(function(){
   
    $("#job_started_date").datepicker({
		dateFormat:'yy-mm-dd',
        minDate: 0,
        maxDate: "+1000D",
        numberOfMonths: 1,
        onSelect: function(selected) {
          $("#job_end_date").datepicker("option","minDate", selected)
        }
    });
    $("#job_end_date").datepicker({ 
		dateFormat:'yy-mm-dd',
        minDate: 0,
        maxDate:"+1000D",
        numberOfMonths: 1,
        onSelect: function(selected) {
           $("#job_started_date").datepicker("option","maxDate", selected)
        }
    });  

   
    $("#period_start_date").datepicker({
		dateFormat:'yy-mm-dd',
        minDate: 0,
        maxDate: "+1000D",
        numberOfMonths: 2,
        onSelect: function(selected) {
          $("#period_end_date").datepicker("option","minDate", selected)
        }
    });
    $("#period_end_date").datepicker({ 
		dateFormat:'yy-mm-dd',
        minDate: 0,
        maxDate:"+1000D",
        numberOfMonths: 2,
        onSelect: function(selected) {
           $("#period_start_date").datepicker("option","maxDate", selected)
        }
    });  

	
	
});



function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}		

</script>