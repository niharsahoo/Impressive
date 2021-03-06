<?php
/* @var $this SwmsController */
/* @var $model Swms */
?><div class="pageheader">
        <div class="media">
          <div class="media-body">
            <ul class="breadcrumb">
               <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
              <li><a href="">SWMS</a></li>
              <li>SWMS</li>
            </ul>
            <h4>View SWMS <?php echo CHtml::link(
                Yii::t("Swms.admin", "Manage"),
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
              <div class="panel-body titlebar"> <span class="glyphicon  glyphicon-th"></span>
                <h2>View SWMS</h2>
              </div>
            </div>
            <div class="col-md-12">
              <div class="table-responsive">

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'name',
		'task',
		'consequences',
		'risk',
				
		array (
		'name' => 'description',
		'value'=> strip_tags( html_entity_decode($model->description) ),
		),
		
		'created_at',
		'updated_at',
	),
)); ?>



              </div>
              <!-- table-responsive --> 
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <!-- contentpanel -->
  

