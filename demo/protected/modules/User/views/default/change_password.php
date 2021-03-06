<?php
/* @var $this UserController */
/* @var $model User */
/* @var $form CActiveForm */
?>

<div class="pageheader">
        <div class="media">
          <div class="media-body">
            <ul class="breadcrumb">
               <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
              <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=User/default/admin">Users</a></li>
              <!--<li>Activate / Deactivate  User</li>-->
			  <li>Change Password</li>
            </ul>
            <h4> <?php echo CHtml::link(
                Yii::t("User.admin", "Manage"),
                array("admin"),
                array("class"=>"btn btn-primary pull-right")
 ); ?></h4>
          </div>
        </div>
        <!-- media --> 
      </div>
      <div class="contentpanel">
        <div class="row">
          <div class="col-md-12 user_section">
            <div class="clearfix"></div>
            <div class="panel panel-default">
              <div class="panel-body titlebar"> <span class="fa fa-pencil"></span>
                <h2>Change Password</h2>
              </div>
            </div>
            <div class="col-md-12">
              <div class="table-responsive">


<div class="col-md-12">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
	
)); ?>


	<?php echo $form->errorSummary($model); ?>
 <div class="col-md-5 mr100">

<? /*?> <div class="form-group">
		<?php echo $form->labelEx($model,'username',array('class'=>'col-sm-5')); ?>
		<div class="col-sm-7">
		<?php echo $form->textField($model,'username',array('size'=>60,'maxlength'=>255,'class'=>'form-control')); ?>
		<?php echo $form->error($model,'username'); ?>
		</div>
		
	</div><?php */?>

	<div class="form-group">
		<?php echo $form->labelEx($model,'password',array('class'=>'col-sm-5')); ?>
		 <div class="col-sm-7">
		<?php echo $form->passwordField($model,'password',array('size'=>60,'maxlength'=>255,'class'=>'form-control')); ?>
		
		<?php echo $form->error($model,'password'); ?>
		</div>
	</div>

	<div class="form-group">
		<?php echo $form->labelEx($model,'confirm_password',array('class'=>'col-sm-5')); ?>
		 <div class="col-sm-7">
		<?php echo $form->passwordField($model,'confirm_password',array('size'=>60,'maxlength'=>255,'class'=>'form-control')); ?>

		<?php echo $form->error($model,'confirm_password'); ?>
				</div>
	</div>



</div>
	  <div class="col-md-12" >
		<?php echo CHtml::submitButton('Change Password',array('class'=>'btn btn-primary mr5')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->


		   </div>
              <!-- table-responsive --> 
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <!-- contentpanel -->