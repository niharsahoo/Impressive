<?php
/* @var $this UserController */
/* @var $model User */

?>
<div class="pageheader">
        <div class="media">
          <div class="media-body">
            <ul class="breadcrumb">
               <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=Dashboard"><i class="glyphicon glyphicon-home"></i></a></li>
              <li><a href="">Users</a></li>
              <li>Users</li>
            </ul>
            <h4>View Users <?php echo CHtml::link(
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
              <div class="panel-body titlebar"> <span class="glyphicon  glyphicon-th"></span>
                <h2>View user</h2>
              </div>
            </div>
            <div class="col-md-12">
              <div class="table-responsive">
              		<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(

//		'Avatar',
		'first_name',
		'last_name',
		'username',
		'password',
		'email',
		'role_id',
		'last_logined',
		'salt',
		'ip_address',
		'gender',
		'date_of_birth',
		'view_jobs',
		'home_phone',
		'mobile_phone',
		'street',
		'city',
		'state_province',
		'country_id',
		'zip_code',
		'interested_in',
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
  
