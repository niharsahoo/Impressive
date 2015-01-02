<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>High Clean Admin - Calender</title>
<link href="css/style.default.css" rel="stylesheet">
<link href="css/morris.css" rel="stylesheet">
<link href="css/select2.css" rel="stylesheet" />
<link href="css/style.calendar.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
</head>

<body>
<?PHP include("includes/header.php"); ?>
<section>
  <div class="mainwrapper">
    <?PHP include("includes/left_section.php"); ?>
    <div class="mainpanel">
    <div class="pageheader">
        <div class="media">
          <div class="media-body">
            <ul class="breadcrumb">
              <li><a href="dashboard.php"><i class="glyphicon glyphicon-home"></i></a></li>
              <li><a href="">Quotes</a></li>
              <li>Calender</li>
            </ul>
            <h4>Calender</h4>
          </div>
        </div>
        <!-- media --> 
      </div>
      <div class="contentpanel">
        <div class="row">
          <div class="col-md-12 quote_section"> 
           
                <div class="mb20"></div>
                <div class="row">
                  <div class="col-md-12 mb20">
                    <button class="btn btn-danger mr5">Not Approved</button>
                    <button class="btn btn-primary mr5">Approved</button>
                    <button class="btn btn-success mr5">Started</button>
                    <button class="btn mr5 yellowcolor">Paused</button>
                    <button class="btn blackbgcolor mr5">Completed</button>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div id="calendar"></div>
                  </div>
                  <!-- col-md-9 --> 
                  
                  <!--<div class="col-md-3">
                    <h5 class="lg-title mb10">Draggable Events</h5>
                    <div id='external-events'>
                      <div class='external-event'>My Event 1</div>
                      <div class='external-event'>My Event 2</div>
                      <div class='external-event'>My Event 3</div>
                      <div class='external-event'>My Event 4</div>
                      <div class='external-event'>My Event 5</div>
                    </div>
                  </div>--> 
                  <!-- col-md-3 --> 
                  
                </div>
                <!-- row -->
                
                <div class="clearfix"></div>
             
            
          </div>
        </div>
      </div>
      <!-- contentpanel -->
      <?PHP include("includes/footer.php"); ?>
    </div>
    <!-- mainpanel --> 
  </div>
  <!-- mainwrapper --> 
</section>
<script src="js/jquery-1.11.1.min.js"></script> 
<script src="js/jquery-migrate-1.2.1.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/pace.min.js"></script> 
<script src="js/retina.min.js"></script> 
<script src="js/jquery.cookies.js"></script> 
<script src="js/jquery-ui-1.10.3.min.js"></script> 
<script src="js/moment.min.js"></script> 
<script src="js/fullcalendar.min.js"></script> 
<script src="js/jquery.ui.touch-punch.min.js"></script> 
<script src="js/custom.js"></script> 
<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay',
				
			},
			firstDay:1,
		
			defaultDate: '2014-09-12',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2014-09-01'
				},
				{
					title: 'Long Event    (Assign Job)',
					start: '2014-09-07',
					end: '2014-09-10',
					className:"assignjob"
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2014-09-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2014-09-16T16:00:00'
					
				},
				{
					title: 'Conference',
					start: '2014-09-11',
					end: '2014-09-13'
				},
				{
					title: 'Meeting (A)',
					start: '2014-09-12T10:30:00',
					end: '2014-09-12T12:30:00',
					className:"approvejob"
				},
				{
					title: 'Lunch (A)',
					start: '2014-09-12T12:00:00',
					className:"approvejob"
				},
				{
					title: 'Meeting (A)',
					start: '2014-09-12T14:30:00',
					className:"approvejob"
				},
				{
					title: 'Happy Hour   (A)',
					start: '2014-09-12T17:30:00',
					className:"approvejob"
				},
				{
					title: 'Dinner  (A)',
					start: '2014-09-12T20:00:00',
					className:"approvejob"
				},
				{
					title: 'Birthday Party  (Assign Job)',
					start: '2014-09-13T07:00:00',
					className:"assignjob"
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2014-09-28'
				}
			]
			
			
		});
		

		
		

		
	});

</script> 
<!--<script>
            jQuery(document).ready(function() {
                    
                /* initialize the external events */  
                jQuery('#external-events div.external-event').each(function() {
                          
                    // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                    // it doesn't need to have a start or end
                    var eventObject = {
                        title: $.trim($(this).text()) // use the element's text as the event title
                    };
                                  
                    // store the Event Object in the DOM element so we can get to it later
                    jQuery(this).data('eventObject', eventObject);
                                  
                    // make the event draggable using jQuery UI
                    jQuery(this).draggable({
                        zIndex: 999,
                        revert: true,      // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                    });
                });
                  
                  
                /* initialize the calendar */  
                jQuery('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar !!!
                    drop: function(date, allDay) { // this function is called when something is dropped
                                  
                        // retrieve the dropped element's stored Event Object
                        var originalEventObject = jQuery(this).data('eventObject');
                                          
                        // we need to copy it, so that multiple events don't have a reference to the same object
                        var copiedEventObject = $.extend({}, originalEventObject);
                                          
                        // assign it the date that was reported
                        copiedEventObject.start = date;
                        copiedEventObject.allDay = allDay;
                                          
                        // render the event on the calendar
                        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                        jQuery('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                                          
                        // is the "remove after drop" checkbox checked?
                        if (jQuery('#drop-remove').is(':checked')) {
                            // if so, remove the element from the "Draggable Events" list
                            jQuery(this).remove();
                        }  
                    }
                });    
            });
          
          </script>-->
</body>
</html>
