<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
		<title>Notifications</title>
	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
		<link rel="stylesheet" href="./views/css/style.css">
	</head>
	
	<body id="page-top" class="">
		<div class="overlay"></div>
		
		<c:set var="UserId" value='<%= session.getAttribute("id")%>'/>
		<c:set var="Name" value='<%= session.getAttribute("name")%>'/>
		<c:set var="Role" value='<%= session.getAttribute("role")%>'/>
		<c:set var="Email" value='<%= session.getAttribute("email")%>'/>
		
		<jsp:include page="Header.jsp" />
				
		<div class="wrapper">
			<jsp:include page="Sidebar.jsp" />
			<div id="content" class="">
				<jsp:include page="Menubar.jsp" />
				
				<div class="container-fluid py-2">
				
					<div class="py-2">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb indigo lighten-4 m-0">
								<li class="breadcrumb-item">
									<a class="black-text" href="Home">Home</a>
									<i class="fa fa-angle-double-right ml-3 mt-1" aria-hidden="true"></i>
								</li>
								<li class="breadcrumb-item active">Notifications</li>
							</ol>
						</nav>
					</div>
						
					<h4 class="py-1">Notifications</h4>
					<div hidden="true"><input type="text" id="userid" value="${UserId }"/></div>
					<div>
						<ul class="notifications">
							<span>New</span><hr>
							<c:forEach var="n" items="${myNotifications }">
								<c:if test="${n.created_for == 'admin' && n.is_viewed == 0 && n.notification_type == 'Extension Request'}">
									<a href="GetViewTaskMapping" class="" id="adminNotifications1">
										<li>
											<div class="" hidden="true"><input type="text" name="id" id="ID1" value="${n.id }"/></div>
											<div class="notify-header">${n.notification_type }</div>
											<div class="notify-content">
												<p class=""><i class="fa fa-angle-double-right pr-2"></i><span>${n.user_ref.name }</span> requested you to extend the Deadline for this task <span>${n.task.task.description }</span>.</p>
											</div>
											<div class="notify-footer">${n.created_date_time }</div>
										</li>
									</a>
								</c:if>
							</c:forEach>
							
							<c:forEach var="n" items="${myNotifications }">
								<c:if test="${n.created_for == 'admin' && n.is_viewed == 0 && n.notification_type == 'Task Report Submission'}">
									<a href="GetViewTaskMapping" class="" id="adminNotifications2">
										<li>
											<div class="" hidden="true"><input type="text" name="id" id="ID2" value="${n.id }"/></div>
											<div class="notify-header">${n.notification_type }</div>
											<div class="notify-content">
												<p class=""><i class="fa fa-angle-double-right pr-2"></i><span>${n.user_ref.name }</span> Submitted his/her Task Completion Report for this task <span>${n.task.task.description }</span>.</p>
											</div>
											<div class="notify-footer">${n.created_date_time }</div>
										</li>
									</a>
								</c:if>
							</c:forEach>
							
							<span>Earlier </span><hr>
							<c:forEach var="n" items="${myNotifications }">
								<c:if test="${n.created_for == 'admin' && n.is_viewed == 1 && n.notification_type == 'Extension Request'}">
									<a href="GetViewTaskMapping" class="">
										<li>
											<div class="notify-header">${n.notification_type }</div>
											<div class="notify-content">
												<p class=""><i class="fa fa-angle-double-right pr-2"></i><span>${n.user_ref.name }</span> requested to extend the Deadline for this task <span>${n.task.task.description }</span>.</p>
											</div>
											<div class="notify-footer">${n.created_date_time }</div>
										</li>
									</a>
								</c:if>
							</c:forEach>
							
							<c:forEach var="n" items="${myNotifications }">
								<c:if test="${n.created_for == 'admin' && n.is_viewed == 1 && n.notification_type == 'Task Report Submission'}">
									<a href="GetViewTaskMapping" class="">
										<li>
											<div class="notify-header">${n.notification_type }</div>
											<div class="notify-content">
												<p class=""><i class="fa fa-angle-double-right pr-2"></i><span>${n.user_ref.name }</span> Submitted his/her Task Completion Report for this task <span>${n.task.task.description }</span>.</p>
											</div>
											<div class="notify-footer">${n.created_date_time }</div>
										</li>
									</a>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- Container Fluid -->
			</div>
		</div>
		<!-- Wrapper -->
		<jsp:include page="Footer.jsp" />
		
		<a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fa fa-angle-up"></i>
		</a>
		
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
		<script type="text/javascript" src="./views/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
        		$('#adminNotifications1').on('click',function(){
        			var id = $('#ID1').val();
        			//alert(id);
            		var pre  = "https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/update_is_viewed/";
    				var varurl = pre+id;
    				$.ajax({
            			type: 'POST',
                		url: varurl,
                		success:function(result){}
        			});
            	});

        		$('#adminNotifications2').on('click',function(){
        			var id = $('#ID2').val();
					//alert(id);
            		var pre  = "https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/update_is_viewed/";
    				var varurl = pre+id;
    				$.ajax({
            			type: 'POST',
                		url: varurl,
                		success:function(result){}
        			});
            	});
			});
		</script>
	</body>
</html>