<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
		<title>Change Password</title>
	
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
		
		<c:if test="${updated != null }">
			<div class="toast" id="Toast"
				style="position: absolute; overflow: auto; right: 10px; top: 130px; width: 350px; z-index: 1;">
				<div class="toast-header white-text bg-success pt-2">
					<h5 class="mr-auto">Notification</h5>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Your Password has been Updated Successfully.</div>
				</div>
			</div>
		</c:if>
		
		<div class="wrapper">
			<jsp:include page="Sidebar.jsp" />
			<div id="content" class="">
				<jsp:include page="Menubar.jsp" />
				<div class="container">
					<div class="row py-3">
						<div class="col-sm-12 col-md-5 col-lg-5 mx-auto">
							<div class="card">
								<div class="card-head white-text text-center py-3 ubuntu">
									<h4>Change Password</h4>
								</div>
								<div class="card-body px-5 pt-0 open-sans">
									<c:if test="${passwordMismatch != null }">
										<div class="toast mt-2" id="Toast">
											<div class="toast-header white-text bg-danger pt-2">
												<h5 class="mr-auto">Error</h5>
												<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="toast-body py-2">
												<div>New password and Confirm Password are doesn't Match...</div>
											</div>
										</div>
									</c:if>
		
									<s:form action="UpdatePassword" method="post" modelAttribute="changePassword">
										<label class="d-flex justify-content-end mandatory mandatory-text mt-2">* must be filled </label>
										
										<s:hidden path="id" id="id" value="${UserId }" />
		
										<div class="row">
											<div class="col-sm-11 col-md-11 col-lg-11">
												<div class="md-form mt-0">
													<s:input type="password" path="new_pwd" id="new_pwd" maxlength="15" autofocus="autofocus" cssClass="form-control" />
													<s:label path="new_pwd" for="New Password">New Password<span class="mandatory"> *</span></s:label>
													<s:errors path="new_pwd" cssClass="error"></s:errors>
												</div>
											</div>
											<div class="col col-sm-1 col-md-1 col-lg-1 p-0">
												<a href="#" data-toggle="tooltip" data-placement="top" title="Abc@123"><i class="fa fa-info-circle mt-4"></i></a>
											</div>
										</div>
										
										<div class="row">
											<div class="col-sm-11 col-md-11 col-lg-11">
												<div class="md-form mt-0">
													<s:input type="password" path="confirm_pwd" id="confirm_pwd" maxlength="15" cssClass="form-control" />
													<s:label path="confirm_pwd" for="Confirm Password">Confirm Password<span class="mandatory"> *</span></s:label>
													<s:errors path="confirm_pwd" cssClass="error"></s:errors>
												</div>
											</div>
											<div class="col col-sm-1 col-md-1 col-lg-1 p-0">
												<a href="#" data-toggle="tooltip" data-placement="top" title="Abc@123"><i class="fa fa-info-circle mt-4"></i></a>
											</div>
										</div>
										
										<div class="mt-2">
											<input type="checkbox" onclick="showPassword()" >
											<label>Show Password</label>
										</div>
										
										<div class="mt-4">
											<button	class="btn btn-custom btn-block my-3 py-2 waves-effect z-depth-0" type="submit">Change</button>
										</div>
									</s:form>
									<!-- Form -->
								</div>
								<!-- Card body -->
							</div>
							<!-- Card  -->
						</div>
					</div>
					<!-- row -->
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
			function showPassword() {
				var x = document.getElementById("new_pwd");
				var y = document.getElementById("confirm_pwd");
				if (x.type === "password" && y.type === "password") {
					x.type = "text";
					y.type = "text"
				}else {
					x.type = "password";
					y.type = "password";
				}
			}
		</script>
	</body>
</html>