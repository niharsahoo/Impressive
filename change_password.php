<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>High Clean Admin - Change Password</title>

        <link href="css/style.default.css" rel="stylesheet">
        <link href="css/morris.css" rel="stylesheet">
        <link href="css/select2.css" rel="stylesheet" />

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
              <li><a href="">User</a></li>
              <li>Change Password</li>
            </ul>
            <h4>Change Password</h4>
          </div>
        </div>
        <!-- media --> 
      </div>
                    <div class="contentpanel">
                    <div class="row">
                            <div class="col-md-12 user_section">
                               
                                        <div class="mb20"></div>
                                        <div class="panel panel-default">
                                            <div class="panel-body titlebar">
                                               <span class="fa fa-pencil"></span><h2>Change password</h2>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <form class="form-horizontal" method="post" enctype="multipart/form-data">
                                                        <div class="form-group">
                                                            <label class="col-sm-4">Username</label>
                                                            <div class="col-sm-7">
                                                                <label>admin</label>
                                                            </div>
                                                        </div><!-- form-group -->
                                                        
                                                        <div class="form-group">
                                                            <label class="col-sm-4">New password</label>
                                                            <div class="col-sm-7">
                                                                <input type="text" name="account_name" value="" class="form-control" />
                                                            </div>
                                                        </div><!-- form-group -->
                                                        
                                                        <div class="form-group">
                                                            <label class="col-sm-4">Confirm new password</label>
                                                            <div class="col-sm-7">
                                                                <input type="text" name="account_name" value="" class="form-control" />
                                                            </div>
                                                        </div><!-- form-group -->
                                                        
                                                        <div class="form-group">
                                                            <label class="col-sm-4"></label>
                                                            <div class="col-sm-7">
                                                             <button class="btn btn-primary mr5">Save</button>
                                                            </div>
                                                        </div><!-- form-group -->
                                            </form>
                            
                            </div> 
                            <div class="clearfix"></div>                                     
                                    
                                
                            </div>
                            
                        </div>
                    </div><!-- contentpanel -->
                    
                     <?PHP include("includes/footer.php"); ?> 
                    
                </div><!-- mainpanel -->
            </div><!-- mainwrapper -->
        </section>


        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.min.js"></script>
        <script src="js/pace.min.js"></script>
        <script src="js/retina.min.js"></script>
        <script src="js/jquery.cookies.js"></script>
        
        <script src="js/flot/jquery.flot.min.js"></script>
        <script src="js/flot/jquery.flot.resize.min.js"></script>
        <script src="js/flot/jquery.flot.spline.min.js"></script>
        <script src="js/jquery.sparkline.min.js"></script>
        <script src="js/morris.min.js"></script>
        <script src="js/raphael-2.1.0.min.js"></script>
        <script src="js/bootstrap-wizard.min.js"></script>
        <script src="js/select2.min.js"></script>

        <script src="js/custom.js"></script>
        <script src="js/dashboard.js"></script>

    </body>
</html>
