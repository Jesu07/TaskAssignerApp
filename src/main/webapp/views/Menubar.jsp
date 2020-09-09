<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
		<title>Menubar</title>
	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
		<link rel="stylesheet" href="./views/css/style.css">
	</head>
	
	<body id="page-top" onload="startTimer()">
		
		<c:set var="UserId" value='<%= session.getAttribute("id")%>'/>
		<c:set var="Name" value='<%= session.getAttribute("name")%>'/>
		<c:set var="Role" value='<%= session.getAttribute("role")%>'/>
		<c:set var="Email" value='<%= session.getAttribute("email")%>'/>
		
		<nav class="navbar navbar-expand-lg navbar-dark bg-info">
			<button type="button" id="sidebarCollapse" class="menubar-btn">
				<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>
		    </button>
				    
		    <a class="navbar-brand mx-2" href="Home">Task Assigner</a>        
			
			<button type="button" class="navbar-toggler collapsed menubar-btn" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
		    	<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>	
		  	</button>
		  	
		  	<div id="navbar" class="navbar-collapse collapse">
		  		<div hidden="true"><input type="text" name="user" id="user" value="${UserId }"/></div>
		  		<ul class="navbar-nav ml-auto">	  			      
		      		<c:if test="${Role == 'admin' }">
				      <li class="nav-item mx-2">
				        <a class="nav-link" href="SignUp"><i class="fa fa-users mr-2" aria-hidden="true"></i>Manage Users</a>
				      </li>
				      <li class="nav-item mx-2">
				        <a class="nav-link" href="GetTaskMaster"><i class="fa fa-tasks mr-2" aria-hidden="true"></i>Task Master</a>
				      </li>
				      <li class="nav-item dropdown mx-2">
				        <a class="nav-link" data-toggle="dropdown" data-target="#submenu" aria-haspopup="true" aria-expanded="false">
				          <i class="fa fa-tasks mr-2" aria-hidden="true"></i>
				          	Task Assignment
				          <i class="fa fa-sort-down ml-1" aria-hidden="true"></i>
				         </a>
				        <div class="dropdown-menu dropdown" aria-labelledby="Dropdown" id="submenu">
				          <a class="dropdown-item" href="GetTaskMapping">
				          	<i class="fa fa-pencil mr-2" aria-hidden="true"></i>Assign Task
				          </a>
				          <a class="dropdown-item" href="GetViewTaskMapping">
				          	<i class="fa fa-address-book mr-2" aria-hidden="true"></i>Task Responses
				          </a>
				        </div>
				      </li>
				      <li class="nav-item mx-2">
				        <a class="nav-link" href="GetAdminReports"><i class="fa fa-book mr-2" aria-hidden="true"></i>Report</a>
				      </li>
				      <li class="nav-item mx-2" id="adminNotifications">
						<!-- <a href="GetAdminNotifications"  class="nav-link badge1"><i class="fa fa-bell mr-2" aria-hidden="true"></i>Notifications</a> -->
					  </li>
			      </c:if>
		      
			      <c:if test="${Role == 'user' }">
				      <li class="nav-item mx-2">
				        <a class="nav-link" href="GetUserTasks"><i class="fa fa-tasks mr-2" aria-hidden="true"></i>My Tasks</a>
				      </li>
				      <li class="nav-item mx-2">
				        <a class="nav-link" href="GetUserReports"><i class="fa fa-book mr-2" aria-hidden="true"></i>Report</a>
				      </li>
				      <li class="nav-item mx-2" id="userNotifications">
						<!-- <a href="GetUserNotifications"  class="nav-link badge1"><i class="fa fa-bell mr-2" aria-hidden="true"></i>Notifications</a> -->
					  </li>
			      </c:if>
		    	</ul>
			</div>
		</nav>
		<!--/.Navbar -->
		
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
		<script type="text/javascript" src="./views/js/common.js"></script>
		<script type="text/javascript">
			function startTimer() { 
				show_notifications(); 
				setInterval(show_notifications, 30000); //Refresh after 30 seconds 
			}

			function show_notifications() {

				var userID = $('#user').val();
				//alert(userID);
				
				var admin = $("#adminNotifications");
				var admin_notifications_url = "http://localhost:8080/api/getAdminNotificationsCount";
				$.ajax({ 
					type: 'GET',
            		url: admin_notifications_url,
            		async: true, 
					success: function(result) {
						var count = 0;
						for(var i in result){
							if(result[i].created_for == 'admin'){
								count++;
							}
							//console.log(count);
						}
						var output="<a href='GetAdminNotifications' class='nav-link badge1' data-badge='" + count + "'><i class='fa fa-bell mr-2' aria-hidden='true'></i>Notifications</a>";
					admin.html(output);
					}
				});

				var user = $("#userNotifications");
				var user_notifications_url = "http://localhost:8080/api/getUserNotificationsCount";
				$.ajax({ 
					type: 'GET',
            		url: user_notifications_url,
            		async: true, 
					success: function(result) {
						//console.log(result);
						var count = 0;
						for(var i in result){
							if(result[i].user.user_id == userID){
								count++;
							}
						}
						var output="<a href='GetUserNotifications' class='nav-link badge1' data-badge='" + count + "'><i class='fa fa-bell mr-2' aria-hidden='true'></i>Notifications</a>";
					user.html(output);
					}
				}); 
			}  
		</script>
	</body>
</html>