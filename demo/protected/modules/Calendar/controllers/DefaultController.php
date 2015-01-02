<?php

class DefaultController extends Controller
{

	public $layout='//layouts/column1';
	public $base_url_assets = null;
	
	public function init() {
		$this->base_url_assets = '//' . CommonFunctions::remove_http(Yii::app()->getBaseUrl(true));
	}	
		public function accessRules()
	{
		return array(
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array(
								'index',
							),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	
	public function actionIndex()
	{
		$job_status = isset($_REQUEST['job_status']) ? urldecode($_REQUEST['job_status']) : '';
		$approval_status = isset($_REQUEST['approval_status']) ? urldecode($_REQUEST['approval_status']) : '';
		
		$Criteria = new CDbCriteria();
		
		if(! empty($approval_status))
		$Criteria->condition = "approval_status = '$approval_status'";
		
		if(! empty($job_status) && $job_status == 'Started')
		$Criteria->condition = "job_status = 'Started' || job_status = 'Restarted' ";
		else if(! empty($job_status))
		$Criteria->condition = "job_status = '$job_status'";
		
		$all_jobs = QuoteJobs::model()->findAll($Criteria); 
		
		$calender_events = array(); $i=0;
		$approved_booked_value = 0 ;
		$not_approved_booked_value = 0 ;
		foreach($all_jobs as $job) {
		
		if($job->booked_status == 'Booked' && $job->approval_status == 'Approved By Admin')
		$approved_booked_value = $approved_booked_value + $job->final_total;
		
		if($job->booked_status == 'Booked' && $job->approval_status == 'Pending Admin Approval')
		$not_approved_booked_value = $not_approved_booked_value + $job->final_total;
		
				// quote model by job id
				$quote_model = Quotes::model()->findByPk($job->quote_id);
	
				if($quote_model !== null) {
				
					$calender_events[$i]['id'] = $job->id;

				// building model
				$building_model = Buildings::model()->findByPk($job->building_id);
				
				// site model
				$site_model = ContactsSite::model()->findByPk($quote_model->site_id);
				

					//$calender_events[$i]['title'] = '('.$job->id.')-'.$site_model->site_name.'-'.$building_model->building_name.'- $'.$job->final_total;
					$title = '('.$job->id.')- $'.$job->final_total.'-'.$site_model->site_name.'-'.$building_model->building_name;
					$title = str_replace("'","",$title);
					$calender_events[$i]['title'] = $title;
					
					
					$calender_events[$i]['start'] = $job->job_started_date;
					$calender_events[$i]['end'] = date('Y-m-d', strtotime($job->job_end_date.' +1 days'));
					$calender_events[$i]['url'] = Yii::app()->getBaseUrl(true).'/?r=Quotes/Job/view&id='.$job->id;
					
					if($job->approval_status == 'Pending Admin Approval')
					$calender_events[$i]['className'] = "notapprovejob";
					else if($job->approval_status == 'Approved By Admin' && $job->job_status == 'NotStarted')
					$calender_events[$i]['className'] = "approvejob";
					else if($job->job_status == 'Started' || $job->job_status == 'Restarted')
					$calender_events[$i]['className'] = "assignjob";
					else if($job->job_status == 'Paused')
					$calender_events[$i]['className'] = "pausedjob";
					else if($job->job_status == 'Completed')
					$calender_events[$i]['className'] = "completedjob";
					
					$i++;
					}
		}	
		//echo '<pre>'; print_r($calender_events); echo '</pre>';

	
		$this->render('index', array(
		'calender_events' => json_encode($calender_events),
		'job_status' => $job_status,
		'approval_status' => $approval_status,
		'approved_booked_value' => $approved_booked_value,
		'not_approved_booked_value' => $not_approved_booked_value,
		)
		);
	}
	
	
	public function actionDragJob() {
	
	//print_r($_post);
		$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : 0; 
		$move_date = isset($_REQUEST['move_date']) ? $_REQUEST['move_date'] : '';
		
		if($id > 0) {
			$model = QuoteJobs::model()->findByPk($id);		
			$interval_days = CommonFunctions::getIntervalDays($model->job_started_date,$model->job_end_date);
			$model->job_started_date = $move_date;
			$model->job_end_date = date('Y-m-d', strtotime($move_date.' +'.$interval_days.' days'));
			if($model->save()) {
				JobSupervisor::model()->deleteAll(array("condition" => "job_id=".(int)$id));	
				JobSiteSupervisor::model()->deleteAll(array("condition" => "job_id=".(int)$id));	
				JobStaff::model()->deleteAll(array("condition" => "job_id=".(int)$id));
			}
		
		}
		
	}

}	