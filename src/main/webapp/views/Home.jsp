<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Home</title>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
		<link rel="stylesheet" href="./views/css/style.css">
	</head>
	<body id="page-top">
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
				<div class="menu">
					<div class="row">
						<c:if test="${Role == 'admin' }">
							<div class="col-sm-12 col-md-6 col-lg-4 menu-column mx-auto">
								<div class="menu-card mx-auto my-auto">
									<h5 class="menu-item"><a class="" href="SignUp"><i class="fa fa-users mr-4" aria-hidden="true"></i>Manage Users</a></h5>
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-4 menu-column mx-auto">
								<div class="menu-card mx-auto my-auto">
									<h5 class="menu-item"><a class="" href="GetTaskMaster"><i class="fa fa-tasks mr-4" aria-hidden="true"></i>Task Master</a></h5>
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-4 menu-column mx-auto">
								<div class="menu-card mx-auto my-auto">
									<h5 class="menu-item"><a class="" href="GetTaskMapping"><i class="fa fa-tasks mr-4" aria-hidden="true"></i>Assign New Task</a></h5>
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-4 menu-column mx-auto">
								<div class="menu-card mx-auto my-auto">
									<h5 class="menu-item"><a class="" href="GetViewTaskMapping"><i class="fa fa-tasks mr-4" aria-hidden="true"></i>Manage Assigned Tasks</a></h5>
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-4 menu-column mx-auto">
								<div class="menu-card mx-auto my-auto">
									<h5 class="menu-item"><a class="" href="GetAdminReports"><i class="fa fa-book mr-4" aria-hidden="true"></i>Report</a></h5>
								</div>
							</div>
						</c:if>
						<c:if test="${Role == 'user' }">
							<div class="col-sm-12 col-md-6 col-lg-4 menu-column mx-auto">
								<div class="menu-card mx-auto my-auto">
									<h5 class="menu-item"><a class="" href="GetUserTasks"><i class="fa fa-tasks mr-4" aria-hidden="true"></i>My Tasks</a></h5>
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-4 menu-column mx-auto">
								<div class="menu-card mx-auto my-auto">
									<h5 class="menu-item"><a class="" href="GetUserReports"><i class="fa fa-book mr-4" aria-hidden="true"></i>Report</a></h5>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="Footer.jsp" />
		
		<a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fa fa-angle-up"></i>
		</a>
		
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script type="text/javascript" src="./views/js/common.js"></script>
	</body>
</html>