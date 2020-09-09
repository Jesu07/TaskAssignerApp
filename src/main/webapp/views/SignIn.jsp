<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Sign In</title>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
		<link rel="stylesheet" href="./views/css/style.css">
		
		<style type="text/css">
			.image{
				background-image: url('./views/Images/bg-login7.jpg');
		    	background-size: cover;
		      	background-repeat:   no-repeat;
		      	background-position: justify;
			}
		</style>
	</head>
	<body>
		<jsp:include page="Header.jsp" />
		<div id="content">
			<div class="container-fluid">
				<div class="row image">
					<div class="col-sm-12 col-md-6 col-lg-4 mx-auto">
						<div class="card custom-card my-5">
							<div class="card-head custom-card-header white-text text-center py-3 ubuntu">
								<h4>Sign in</h4>
							</div>
							<div class="card-body custom-card-body px-5 mt-1 open-sans">
								<s:form cssClass="login-form" style="color: #757575;" action="Login" method="post" modelAttribute="signin">
	
									<!-- Username -->
									<div class="row">
										<div class="col-sm-11 col-md-11 col-lg-11">
											<div class="md-form mt-0">
												<s:input path="username" id="username" autofocus="autofocus" cssClass="form-control" />
												<label for="username">Username</label>
												<s:errors path="username" cssClass="error"></s:errors>
											</div>
										</div>
										<div class="col-sm-1 col-md-1 col-lg-1 p-0 mt-1">
											<a href="#" data-toggle="tooltip" data-placement="top" title="20mcale1"><i class="fa fa-info-circle mt-4"></i></a>
										</div>
									</div>
									
									<!-- Password -->
									<div class="row">
										<div class="col-sm-11 col-md-11 col-lg-11">
											<div class="md-form mt-0">
												<s:password path="password" id="password" cssClass="form-control" />
												<label for="password">Password</label>
												<s:errors path="password" cssClass="error"></s:errors>
											</div>
										</div>
										<div class="col-sm-1 col-md-1 col-lg-1 p-0 mt-1">
											<a href="#" data-toggle="tooltip" data-placement="top" title="xxxxxxx"><i class="fa fa-info-circle mt-4"></i></a>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-12 col-md-12 col-lg-6">
	 										<input type="checkbox" onclick="showPassword()" >
											<label>Show Password</label>
										</div>
										<div class="col-sm-12 col-md-12 col-lg-6">
											<a href="#forgotModal" data-toggle="modal">Forgot password ?</a>
										</div>
									</div>
									
									<!-- Sign in button -->
									<div>
										<button	class="btn btn-custom btn-block my-3 py-2 waves-effect z-depth-0" type="submit">Sign in</button>
									</div>
								</s:form>
								<!-- Form -->
								
								<!-- Forgot Modal -->
								<div id="forgotModal" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<s:form action="SendOTP" method="post" modelAttribute="forgotPassword">
												<div class="modal-header">						
													<h4 class="modal-title">Reset Your Password</h4>
													<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
												
												<div class="modal-body">
													<c:if test="${emailError != null }">
														<div class="toast" id="Toast">
															<div class="toast-header white-text bg-danger pt-2">
																<h5 class="mr-auto">Error</h5>
																<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="toast-body py-2">
																<div>Oops! This Email ID is not registered, Please Try Again...</div>
															</div>
														</div>
													</c:if>
	
													<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
																		
													<div class="row">
														<div class="col col-sm-11 col-md-11 col-lg-11">
															<div class="md-form mt-0">
																<s:input path="email" id="email" placeholder="abc@gmail.com" autofocus="autofocus" cssClass="form-control text-lowercase"/>
																<label for="email">Email<span class="mandatory"> *</span></label>
																<s:errors path="email" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col col-sm-1 col-md-1 col-lg-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="abc@gmail.com"><i class="fa fa-info-circle mt-4"></i></a>
														</div>
													</div>					
												</div>
												<div class="modal-footer">
													<input type="button" class="btn-custom px-3 py-1" data-dismiss="modal" value="Cancel">
													<input type="submit" class="btn-custom px-3 py-1" value="Submit">
												</div>
											</s:form>
										</div>
									</div>
								</div>
								<!-- Forgot Password Modal -->
								
								<!-- OTP Verification Modal -->
								<div id="otpModal" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<s:form action="VerifyOTP" method="post" modelAttribute="otp">
												<div class="modal-header">						
													<h4 class="modal-title">OTP Verification</h4>
													<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
												
												<div class="modal-body">
													
													<c:if test="${otpError != null }">
														<div class="toast" id="Toast">
															<div class="toast-header white-text bg-danger pt-2">
																<h5 class="mr-auto">Error</h5>
																<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="toast-body py-2">
																<div>Invalid OTP. Please Try Again Later...</div>
															</div>
														</div>
													</c:if>
													
													<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
	
													<c:if test="${email != null }">
														<p class="text-center mb-3">
															OTP has been sent to this Email ID ${email } 
														</p>
													</c:if>
	
													<s:hidden path="id" value="${id }"/>				
													<div class="row">
														<div class="col col-sm-11 col-md-11 col-lg-11">
															<div class="md-form mt-0">
																<s:input path="otp" id="otp" autofocus="autofocus" maxlength="6" cssClass="form-control"/>
																<label for="otp">OTP<span class="mandatory"> *</span></label>
																<s:errors path="otp" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col col-sm-1 col-md-1 col-lg-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="123456"><i class="fa fa-info-circle mt-4"></i></a>
														</div>
													</div>					
												</div>
												<div class="modal-footer">
													<input type="button" class="btn-custom px-3 py-1" data-dismiss="modal" value="Cancel">
													<input type="submit" class="btn-custom px-3 py-1" value="Submit">
												</div>
											</s:form>
										</div>
									</div>
								</div>
								<!-- OTP Verification Modal -->
								
								<!-- Reset Password Modal -->
								<div id="resetModal" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<s:form action="ResetPassword" method="post" modelAttribute="changePassword">
												<div class="modal-header">						
													<h4 class="modal-title">Reset Password</h4>
													<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
												
												<div class="modal-body">
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
	
													<label class="d-flex justify-content-end mandatory mandatory-text mt-2">* must be filled </label>
	
													<s:hidden path="id" id="id" value='<%=session.getAttribute("id")%>' />
	
													<div class="row">
														<div class="col-sm-11 col-md-11 col-lg-11">
															<div class="md-form mt-0">
																<s:input path="new_pwd" id="new_pwd" maxlength="15" cssClass="form-control" />
																<s:label path="new_pwd" for="New Password">New Password<span class="mandatory"> *</span> </s:label>
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
																<s:input path="confirm_pwd" id="confirm_pwd" maxlength="15" cssClass="form-control" />
																<s:label path="confirm_pwd" for="Confirm Password">Confirm Password<span class="mandatory"> *</span> </s:label>
																<s:errors path="confirm_pwd" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col col-sm-1 col-md-1 col-lg-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="Abc@123"><i class="fa fa-info-circle mt-4"></i></a>
														</div>
													</div>
	
													<div class="mt-4">
														<input type="submit" class="btn-custom px-3 py-1" value="Update">
													</div>
												</div>
											</s:form>
										</div>
									</div>
								</div>
								<!-- Reset Password Modal -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<c:if test="${msg != null }">
			<div class="toast" id="Toast" 
				style="position: absolute; right: 10px; top: 65px; width:300px;">
				<div class="toast-header white-text bg-danger pt-2">
					<h6 class="mr-auto">Oops !</h6>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Invalid Username or Password, Please Try Again...</div>
				</div>
			</div>
		</c:if>
	
		<c:if test="${session != null }">
			<div class="toast" id="Toast" 
				style="position: absolute; right: 10px; top: 65px; width:300px;">
				<div class="toast-header white-text bg-danger pt-2">
					<h6 class="mr-auto">Oops !</h6>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Your Session time has been Expired. Please Sign in Again...</div>
				</div>
			</div>
		</c:if>
	
		<c:if test="${updated != null }">
			<div class="toast" id="Toast" 
				style="position: absolute; right: 10px; top: 65px; width:300px;">
				<div class="toast-header white-text bg-success pt-2">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Your Password has been Updated Successfully...</div>
				</div>
			</div>
		</c:if>
		
		<jsp:include page="Footer.jsp" />
		
		<c:if test="${forgotModal != null }">
			<script type="text/javascript">
				$('#forgotModal').modal('show');
			</script>
		</c:if>
		
		<c:if test="${otpModal != null }">
			<script type="text/javascript">
				$('#otpModal').modal('show');
			</script>
		</c:if>
		
		<c:if test="${resetModal != null }">
			<script type="text/javascript">
				$('#resetModal').modal('show');
			</script>
		</c:if>
		<!-- jQuery -->
	  	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>	
	  	<script type="text/javascript" src="./views/js/common.js"></script>
	  	<script type="text/javascript">
			function showPassword() {
				var x = document.getElementById("password");
				if (x.type === "password") {
					x.type = "text";
				}else {
					x.type = "password";
				}
			}
		</script>
	</body>
</html>