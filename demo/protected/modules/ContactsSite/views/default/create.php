<?php
/* @var $this ContactsSiteController */
/* @var $model ContactsSite */

?>
 <div class="pageheader">
        <div class="media">
          <div class="media-body">
            <ul class="breadcrumb">
              <li><a href="dashboard.php"><i class="glyphicon glyphicon-home"></i></a></li>
             <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=Quotes/default/admin">Quotes</a></li>
              <li><a href="<?php echo Yii::app()->getBaseUrl(true); ?>/?r=ContactsSite/default/admin">Sites</a></li>
			  <li>Add Site Details</li>
            </ul>
            <h4><?php echo CHtml::link(
                Yii::t("ContactsSite.admin", "Manage"),
                array("admin"),
                array("class"=>"btn btn-primary pull-right")
 ); ?></h4>
          </div>
        </div>
        <!-- media --> 
      </div>
      <div class="contentpanel">
        <div class="row">
          <div class="col-md-12 quote_section">
            <div class="clearfix"></div>
            <div class="panel panel-default">
              <div class="panel-body titlebar"> <span class="glyphicon  glyphicon-th"></span>
                <h2>Add Site</h2>
              </div>
            </div>
            <div class="col-md-12">
              <div class="table-responsive">
<?php $this->renderPartial('_form', array('model'=>$model,'contact_ids_error_msg'=>$contact_ids_error_msg)); ?>
</div>
              <!-- table-responsive --> 
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <!-- contentpanel -->
      
