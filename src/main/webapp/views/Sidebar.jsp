<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
		<title>Side Bar</title>
	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
		<link rel="stylesheet" href="./views/css/style.css">
	</head>
	<body id="page-top">
		
		<c:set var="UserId" value='<%= session.getAttribute("id")%>' />
		<c:set var="Name" value='<%= session.getAttribute("name")%>' />
		<c:set var="Role" value='<%= session.getAttribute("role")%>' />
		<c:set var="Email" value='<%= session.getAttribute("email")%>' />
	
		<!-- Sidebar  -->
		<nav id="sidebar" class="ubuntu">
			<div id="dismiss">
				<i class="fa fa-arrow-left"></i>
			</div>
			<div class="p-3">
				<div class="sidebar-header text-center mt-3">
					<h3>Task Assigner</h3>
				</div>
				
				<div hidden="true"><input type="text" name="userid" id="userid" value="${UserId }"/></div>
				
				<div class="avatar text-center px-2 py-2" id="avatar"></div>
				
				<div class="text-center white-text text-capitalize banner-white py-2">Hai ${Name }<br>${Role }</div>
				<ul class="list-unstyled components my-1">
					<li class="">
						<a href="Home"><i class="fa fa-home mr-2" aria-hidden="true"></i>Home</a>
					</li>
					<li>
						<a href="GetProfile"><i class="fa fa-address-book mr-2" aria-hidden="true"></i>Profile</a>
					</li>
					<li>
						<a href="ChangePassword"><i class="fa fa-cogs mr-2" aria-hidden="true"></i>Change Password</a>
					</li>
					<li>
						<a href="logout"><i class="fa fa-sign-out mr-2" aria-hidden="true"></i>Logout</a>
					</li>
				</ul>
			</div>
		</nav>
		
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
		<script type="text/javascript" src="./views/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var user = $("#userid").val();
				//alert(user);

				var avatar = $("#avatar");
				var pre = "http://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getUserImageByUserID/";
				var image_url = pre+user;
				$.ajax({ 
					type: 'GET',
            		url: image_url,
            		async: true, 
					success: function(result) {
						if(result == 0){
							var output="<img src='./views/images/avatar.png' class='rounded-circle z-depth-0' alt='avatar image' height='80' width='80'>";
						}else{
							var output="<img src='/uploads/" + result[i].image_name + "' class='rounded-circle' alt='User Image' width='80' height='80'>";
						}
					//console.log(output);
					avatar.html(output);
					}
				});
			});
		</script>
	</body>
</html>