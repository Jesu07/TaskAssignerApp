<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		
		<title>Profile</title>
		
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
		
		<c:if test="${ (Personal != null) || (School != null) || (College != null) || (Contact != null) }">
			<div class="toast" id="Toast" 
				style="position: absolute; overflow: auto; right: 10px; top: 130px; width: 300px; z-index: 1;">
				<div class="toast-header white-text pt-2 bg-success">
					<h5 class="mr-auto">Success</h5>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<c:if test="${Personal != null }"><div>Your Personal Details are Saved Successfully...</div></c:if>
					<c:if test="${School != null }"><div>Your School Details are Saved Successfully...</div></c:if>
					<c:if test="${College != null }"><div>Your Qualification Details are Saved Successfully...</div></c:if>
					<c:if test="${Contact != null }"><div>Your Contact Details are Saved Successfully...</div></c:if>
				</div>
			</div>
		</c:if>
		
		<c:if test="${ (ProfileUpdate != null) || (SchoolUpdate != null) || (CollegeUpdate != null) || (ContactUpdate != null) }">
			<div class="toast" id="Toast" 
				style="position: absolute; overflow: auto; right: 10px; top: 130px; width: 300px; z-index: 1;">
				<div class="toast-header white-text pt-2 bg-success">
					<h5 class="mr-auto">Success</h5>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<c:if test="${ProfileUpdate != null }"><div>Your Profile Details are Updated Successfully...</div></c:if>
					<c:if test="${SchoolUpdate != null }"><div>Your School Details are Updated Successfully...</div></c:if>
					<c:if test="${CollegeUpdate != null }"><div>Your College Details are Updated Successfully...</div></c:if>
					<c:if test="${ContactUpdate != null }"><div>Your Contact Details are Updated Successfully...</div></c:if>
				</div>
			</div>
		</c:if>
		
		<div class="wrapper">		
			<jsp:include page="Sidebar.jsp" />
			<div id="content" class="">
				<jsp:include page="Menubar.jsp" />
				<div class="container-fluid">
					
					<h3 class="d-flex justify-content-center banner-black py-1 mt-3 mb-2">My Profile</h3>
					
					<!-- Nav tabs -->
					<ul class="nav nav-tabs mt-3" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
					    	<a class="nav-link active" id="personal-tab" data-toggle="tab" href="#personal" role="tab" aria-controls="home" aria-selected="true">Personal</a>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<a class="nav-link" id="education-tab" data-toggle="tab" href="#education" role="tab" aria-controls="profile" aria-selected="false">Education</a>
					  	</li>
					  	<li class="nav-item" role="presentation">
						    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="messages" aria-selected="false">Contact</a>
					  	</li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="personal" role="tabpanel" aria-labelledby="personal-tab">
							<div class="row my-3">
								<div class="col col-sm-12 col-md-12 col-lg-12">
									<h4 class="tab-header">Personal Information</h4>
				  					<c:if test="${user.personal_status == 0 }">
										<label class="d-flex justify-content-end mandatory mt-0 mb-0">* Must be filled</label>
										<s:form action="SavePersonal" method="post" modelAttribute="personal" enctype="multipart/form-data">
		
											<!-- Row 1 -->
											<div class="row mt-2 mb-0">
												<div class="col-sm-12 col-md-6 col-lg-3" hidden="true">
													<div class="md-form mt-0">
														<s:input path="user_ref" id="user_ref" value="${UserId }" cssClass="form-control" autofocus="autofocus"/>
														<label for="User ID">User Id</label>
														<s:errors path="user_ref" cssClass="error" />
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="md-form mt-3">
														<input name="name" id="name" value="${Name }" class="text-capitalize form-control" autofocus="autofocus" />
														<label for="name">Name</label>
														<%-- <s:errors path="name" cssClass="error" /> --%>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<label for="Designation" class="my-0">Designation<span class="mandatory"> *</span></label>
													<s:select path="designation" id="designation" cssClass="browser-default custom-select" />
													<s:errors path="designation" cssClass="error" />
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="md-form mt-3">
														<s:input path="email" id="email" value="${Email }" cssClass="form-control" autofocus="autofocus"/>
														<label for="Email">Email<span class="mandatory"> *</span></label>
														<s:errors path="email" cssClass="error" />
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="md-form mt-3">
														<s:input path="mobile" id="mobile" maxlength="10" placeholder="9876543210" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" cssClass="form-control" autofocus="autofocus" />
														<label for="Mobile Number">Mobile Number<span class="mandatory"> *</span></label>
														<s:errors path="mobile" cssClass="error" />
													</div>
												</div>
											</div>
											
											<!-- Row 2 -->
											<div class="row my-0">
												<div class="col-sm-12 col-md-6 col-lg-3">
													<label for="Gender" class="my-0">Gender<span class="mandatory"> *</span></label>
													<s:select path="gender" id="gender" cssClass="browser-default custom-select">
														<option value="">-- Select --</option>
														<option value="Male">Male</option>
														<option value="Female">Female</option>
														<option value="Transgender">Transgender</option>
													</s:select>
													<s:errors path="gender" cssClass="error" />
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="md-form mt-3">
														<s:input type="text" path="dob" id="dob" placeholder='yyyy-mm-dd' pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))" oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" cssClass="form-control" autofocus="autofocus"  />
														<label for="dob">Date Of Birth<span class="mandatory"> *</span></label>
														<s:errors path="dob" cssClass="error" />
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="md-form mt-3">
														<s:input path="place_of_birth" id="place_of_birth" cssClass="form-control" autofocus="autofocus"  />
														<label for="Place Of Birth">Place Of Birth<span class="mandatory"> *</span></label>
														<s:errors path="place_of_birth" cssClass="error" />
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<label for="Blood Group" class="my-0">Blood Group<span class="mandatory"> *</span></label>
													<s:select path="blood_group" id="blood_group" cssClass="browser-default custom-select" />
													<s:errors path="blood_group" cssClass="error" />
												</div>
											</div>
											
											<!-- Row 3 -->
											<div class="row mt-2 mb-0">
												<div class="col-sm-12 col-md-6 col-lg-3 mt-2">
													<label for="Mother Tongue" class="my-0">Mother Tongue<span class="mandatory"> *</span></label>
													<s:select path="mother_tongue" id="mother_tongue" cssClass="browser-default custom-select" />
													<s:errors path="mother_tongue" cssClass="error" />
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3 mt-2">
													<label for="Nationality" class="my-0">Nationality<span class="mandatory"> *</span></label>
													<s:select path="nationality" id="nation" cssClass="browser-default custom-select" />
													<s:errors path="nationality" cssClass="error" />
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3 mt-2">
													<label for="Religion" class="my-0">Religion<span class="mandatory"> *</span></label>
													<s:select path="religion" id="religion" cssClass="browser-default custom-select" />
													<s:errors path="religion" cssClass="error" />
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3 mt-2">
													<label for="Category" class="my-0">Category<span class="mandatory"> *</span></label>
													<s:select path="category" id="comm_category" cssClass="browser-default custom-select" />
													<s:errors path="category" cssClass="error" />
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3 mt-4">
													<label for="Image Upload" class="mb-1">Upload Image<span class="mandatory"> *</span></label>
													<input type="file" name="image" id="image" class="" />
												</div>
												<div class="col-sm-12 col-md-5 col-lg-3 mt-5">
													<s:checkbox path="inn" id="inn" cssClass="inn"/>
													<s:errors path="inn" cssClass="error"></s:errors>
													<label>In use</label>
												</div>
											</div>
											
											<!-- Row 4 -->
											<div class="d-flex justify-content-end mt-0">
												<input type="reset" name="cancel" id="cancel" value="Reset" class="btn btn-default"/>
												<input type="submit" name="add" id="add" value="Save" class="btn btn-info"/>
											</div>
										
										</s:form>
										<!-- Form End -->
									</c:if>
								</div>
								<!-- col -->
							</div>
							<!-- row -->							
					  		
					  		<c:if test="${user.personal_status == 1 }">
					  			<div class="" id="PersonalView">
					  				<div class="row mt-2 mb-0">
					  					<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="name" id="name" value="${pv.user_ref.name }" class="text-capitalize form-control" autofocus="autofocus" readonly/>
												<label for="name">Name</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="designation" id="designation" value="${pv.designation.name }" class="form-control" autofocus="autofocus" readonly/>
												<label for="designation">Designation</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="email" id="email" value="${pv.email }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Email">Email</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="mobile" id="mobile" value="${pv.mobile }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Mobile Number">Mobile Number</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="gender" id="gender" value="${pv.gender }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Gender">Gender</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="date" id="date" value="${pv.dob }" class="form-control" autofocus="autofocus" readonly/>
												<label for="name">Date of Birth</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input id="age" name="age" value="" class="form-control" autofocus="autofocus" readonly/>
												<label for="Age">Age</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="place_of_birth" id="place_of_birth" value="${pv.place_of_birth }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Place Of Birth">Place Of Birth</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="bloodgroup" id="bloodgroup" value="${pv.blood_group.name }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Blood Group">Blood Group</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="mother_tongue" id="mother_tongue" value="${pv.mother_tongue.name }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Mother Tongue">Mother Tongue</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="Nationality" id="Nationality" value="${pv.nationality.name }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Nationality">Nationality</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="Religion" id="Religion" value="${pv.religion.name }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Religion">Religion</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="Category" id="Category" value="${pv.category.acronym }" class="form-control" autofocus="autofocus" readonly/>
												<label for="Category">Category</label>
											</div>
										</div>
										<img alt="" src="/uploads/${pv.image_name }" width="80" height="80">
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class=" mt-0">
												<label for="In use">In Use</label><br>
												<c:if test="${ pv.inn  == 1 }"><span><i class="fa fa-circle text-success"></i>  Active</span></c:if>
						  						<c:if test="${ pv.inn  == 0 }"><span><i class="fa fa-circle text-danger"></i>  Inactive</span></c:if>
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3 mx-auto">
											<a href="EditProfile"><button class="btn-custom w-50 py-2 mt-4">Edit</button></a>
					  					</div>
					  				</div>
					  			</div>
					  		</c:if>
					  	</div>
					  	<!-- Personal -->
		
					  	<div class="tab-pane" id="education" role="tabpanel" aria-labelledby="education-tab">
					  		<div class="row my-3">
								<div class="col col-sm-12 col-md-12 col-lg-12">
					  				<h4 class="tab-header">Educational Information</h4>
					  				
					  				<div class="table-wrapper">
										<table class="table table-striped table-hover">
											<thead>
												<tr class="table-title">
													<td colspan="3"><h4>School</h4></td>
													<td></td>
													<td colspan="3"><a href="#schoolAddModal" class="btn btn-info add-new px-3 py-2" data-toggle="modal"><i class="fa fa-plus-circle"></i> <span class="ml-2">Add</span></a></td>
												</tr>
												<tr>
													<th>Category</th>
													<th>School name</th>
													<th>Board</th>
													<th>Marks</th>
													<th>Percentage</th>
													<th>In Use</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="sv" items="${sv}">
													<c:if test="${sv.user_ref.user_id ==  UserId}">
														<tr>
															<td>${sv.school_category }</td>
															<td>${sv.school_name }</td>
															<td>${sv.board }</td>
															<td>${sv.marks }</td>
															<td>${sv.percentage }</td>
															<td>
																<c:if test="${sv.inn == 1 }"><span><i class="fa fa-circle text-success"></i>  Active</span></c:if>
																<c:if test="${sv.inn != 1 }"><span><i class="fa fa-circle text-danger"></i>  Inactive</span></c:if>
															</td>
															<td>
																<a href="#schoolEditModal" class="edit" data-toggle="modal" data-id="${sv.id }" data-user="${sv.user_ref.user_id }" data-category=${sv.school_category } data-school="${sv.school_name }" data-board="${sv.board }" data-marks="${sv.marks }" data-percentage="${sv.percentage }" data-inn="${sv.inn }"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Edit"></i></a>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
								
										<!-- Add Modal HTML -->
										<div id="schoolAddModal" class="modal">
											<div class="modal-dialog">
												<div class="modal-content">
													<s:form action="SaveSchool" method="post" modelAttribute="school">
														<div class="modal-header">						
															<h4 class="modal-title">Add School Details</h4>
															<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
														</div>
														
														<div class="modal-body">
															<c:if test="${schoolAddExist != null }">
																<div class="toast" id="Toast">
																	<div class="toast-header white-text bg-danger pt-2">
																		<h5 class="mr-auto">Error</h5>
																		<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="toast-body py-2">
																		<div>This Category Details Already Exist, Enter New One...</div>
																	</div>
																</div>
															</c:if>
															
															<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
															
															<s:hidden path="user_ref" id="user_ref" value="${UserId }"/>
															
															<div class="row mt-2">
																<div class="col-sm-12">
																	<label for="Category" class="my-0">Category<span class="mandatory"> *</span></label>
																	<s:select path="school_category" id="school_category" cssClass="custom-select browser-default">
																		<option value="">-- Select --</option>
																		<option value="SSLC">SSLC</option>
																		<option value="HSC">HSC</option>
																	</s:select>
																	<s:errors path="school_category" cssClass="error"/>
																</div>
															</div>
															
															<div class="row mt-3">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="school_name" id="school_name" cssClass="form-control"/>
																		<label for="School Name">School Name<span class="mandatory"> *</span></label>
																		<s:errors path="school_name" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="ABC School"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="board" id="board" cssClass="form-control"/>
																		<label for="Board">Board<span class="mandatory"> *</span></label>
																		<s:errors path="board" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="State Board"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="marks" id="marks" maxlength="4" cssClass="form-control"/>
																		<label for="Marks">Marks<span class="mandatory"> *</span></label>
																		<s:errors path="marks" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="0000"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="percentage" id="percentage" maxlength="6" cssClass="form-control"/>
																		<label for="Percentage">Percentage<span class="mandatory"> *</span></label>
																		<s:errors path="percentage" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="100"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="form-group">
																<s:checkbox path="inn" cssClass="inn"/>
																<label>In use</label>
															</div>					
														</div>
														<div class="modal-footer">
															<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
															<input type="submit" class="btn btn-info" value="Add">
														</div>
													</s:form>
												</div>
											</div>
										</div>
															
										<!-- Edit Modal HTML -->
										<div id="schoolEditModal" class="modal">
											<div class="modal-dialog">
												<div class="modal-content">
													<s:form action="EditSchool" method="post" modelAttribute="school">
														<div class="modal-header">						
															<h4 class="modal-title">Edit School Details</h4>
															<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
														</div>
																			
														<div class="modal-body">
															
															<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
															
															<s:hidden path="id" id="id" />
															<s:hidden path="user_ref" id="user_ref" />
															<div class="row mt-2">
																<div class="col-sm-12">
																	<label for="Category" class="my-0">Category<span class="mandatory"> *</span></label>
																	<s:select path="school_category" id="school_category" cssClass="custom-select browser-default">
																		<option value="">-- Select --</option>
																		<option value="SSLC">SSLC</option>
																		<option value="HSC">HSC</option>
																	</s:select>
																	<s:errors path="school_category" cssClass="error"/>
																</div>
															</div>
															<div class="row mt-3">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="school_name" id="school_name" cssClass="form-control" autofocus="autofocus"  />
																		<label for="School Name">School Name<span class="mandatory"> *</span></label>
																		<s:errors path="school_name" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="ABC School"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="board" id="board" cssClass="form-control" autofocus="autofocus"  />
																		<label for="Board">Board<span class="mandatory"> *</span></label>
																		<s:errors path="board" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="State board"><i class="fa fa-info-circle mt-5"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="marks" id="marks" maxlength="4" cssClass="form-control" autofocus="autofocus"  />
																		<label for="Marks">Marks<span class="mandatory"> *</span></label>
																		<s:errors path="marks" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="0000"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="percentage" id="percentage" maxlength="5" cssClass="form-control" autofocus="autofocus"  />
																		<label for="Percentage">Percentage<span class="mandatory"> *</span></label>
																		<s:errors path="percentage" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="000"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="form-group">
																<s:checkbox path="inn" cssClass="inn" id="inn"/>
																<label>In use</label>
															</div>					
														</div>
														
														<div class="modal-footer">
															<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
															<input type="submit" class="btn btn-info" value="Update">
														</div>
													</s:form>
												</div>
											</div>
										</div>
									</div><hr>
									<!-- Table wrapper -->
					  				
					  				<div class="table-wrapper">
										<table class="table table-striped table-hover">
											<thead>
												<tr class="table-title">
													<td colspan="3"><h4>College Details</h4></td>
													<td></td>
													<td colspan="3"><a href="#collegeAddModal" class="btn btn-info add-new px-3 py-2" data-toggle="modal"><i class="fa fa-plus-circle"></i> <span class="ml-2">Add</span></a></td>
												</tr>
												<tr>
													<th>Category</th>
													<th>College name</th>
													<th>Course</th>
													<th>University</th>
													<th>CGPA</th>
													<th>In Use</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="cv" items="${cv}">
													<c:if test="${cv.user_ref.user_id ==  UserId}">
														<tr>
															<td>${cv.college_category }</td>
															<td>${cv.clg_name }</td>
															<td>${cv.course }</td>
															<td>${cv.university }</td>
															<td>${cv.cgpa }</td>
															<td>
																<c:if test="${cv.inn == 1 }"><span><i class="fa fa-circle text-success"></i>  Active</span></c:if>
																<c:if test="${cv.inn != 1 }"><span><i class="fa fa-circle text-danger"></i>  Inactive</span></c:if>
															</td>
															<td>
																<a href="#collegeEditModal" class="edit" data-toggle="modal" data-id="${cv.id }" data-user="${cv.user_ref.user_id }" data-category="${cv.college_category }" data-college="${cv.clg_name }" data-course="${cv.course }" data-university="${cv.university }" data-cgpa="${cv.cgpa }" data-inn="${cv.inn }"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Edit"></i></a>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
								
										<!-- Add Modal HTML -->
										<div id="collegeAddModal" class="modal">
											<div class="modal-dialog">
												<div class="modal-content">
													<s:form action="SaveCollege" method="post" modelAttribute="college">
														<div class="modal-header">						
															<h4 class="modal-title">Add College Details</h4>
															<button type="button" class="close  white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
														</div>
														
														<div class="modal-body">
															<c:if test="${collegeAddExist != null }">
																<div class="toast" id="Toast">
																	<div class="toast-header white-text bg-danger pt-2">
																		<h5 class="mr-auto">Error</h5>
																		<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="toast-body py-2">
																		<div>This Category Details Already Exist, Enter New One...</div>
																	</div>
																</div>
															</c:if>
															
															<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
															
															<s:hidden path="user_ref" id="user_ref" value="${UserId }"/>
															
															<div class="row mt-2">
																<div class="col-sm-12">
																	<label for="Category" class="my-0">Category<span class="mandatory"> *</span></label>
																	<s:select path="college_category" id="college_category" cssClass="custom-select browser-default">
																		<option value="">-- Select --</option>
																		<option value="UG">UG</option>
																		<option value="PG">PG</option>
																	</s:select>
																	<s:errors path="college_category" cssClass="error"/>
																</div>	
															</div>
															
															<div class="row mt-3">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="clg_name" id="clg_name" cssClass="form-control" />
																		<label for="School Name">College Name<span class="mandatory"> *</span></label>
																		<s:errors path="clg_name" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="ABC College"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="course" id="course" cssClass="form-control"/>
																		<label for="Course">Course<span class="mandatory"> *</span></label>
																		<s:errors path="course" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="B.Sc/M.Sc Computer Science"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="university" id="university" cssClass="form-control"/>
																		<label for="University">University<span class="mandatory"> *</span></label>
																		<s:errors path="university" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="ABC University"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="cgpa" id="cgpa" maxlength="5" cssClass="form-control"/>
																		<label for="CGPA">CGPA<span class="mandatory"> *</span></label>
																		<s:errors path="cgpa" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="9.0"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="form-group">
																<s:checkbox path="inn" cssClass="inn"/>
																<label>In use</label>
															</div>					
														</div>
														<div class="modal-footer">
															<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
															<input type="submit" class="btn btn-info" value="Add">
														</div>
													</s:form>
												</div>
											</div>
										</div>
															
										<!-- Edit Modal HTML -->
										<div id="collegeEditModal" class="modal">
											<div class="modal-dialog">
												<div class="modal-content">
													<s:form action="EditCollege" method="post" modelAttribute="college">
														<div class="modal-header">						
															<h4 class="modal-title">Edit College Details</h4>
															<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
														</div>
																			
														<div class="modal-body">
															
															<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
															
															<s:hidden path="id" id="id"/>
															<s:hidden path="user_ref" id="user_ref"/>
															
															<div class="row mt-2">
																<div class="col-sm-12">
																	<label for="Category" class="my-0">Category<span class="mandatory"> *</span></label>
																	<s:select path="college_category" id="college_category" cssClass="custom-select browser-default">
																		<option value="">-- Select --</option>
																		<option value="UG">UG</option>
																		<option value="PG">PG</option>
																	</s:select>
																	<s:errors path="college_category" cssClass="error"/>
																</div>	
															</div>
															
															<div class="row mt-3">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="clg_name" id="clg_name" cssClass="form-control" autofocus="autofocus"  />
																		<label for="School Name">College Name<span class="mandatory"> *</span></label>
																		<s:errors path="clg_name" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="ABC College"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="course" id="course" cssClass="form-control" autofocus="autofocus"  />
																		<label for="Course">Course<span class="mandatory"> *</span></label>
																		<s:errors path="course" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="B.Sc/M.Sc Computer science"><i class="fa fa-info-circle mt-5"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="university" id="university" cssClass="form-control" autofocus="autofocus"  />
																		<label for="University">University<span class="mandatory"> *</span></label>
																		<s:errors path="university" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="ABC University"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<s:input path="cgpa" id="cgpa" maxlength="5" cssClass="form-control" autofocus="autofocus"  />
																		<label for="CGPA">CGPA<span class="mandatory"> *</span></label>
																		<s:errors path="cgpa" cssClass="error"/>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="9.0"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="form-group">
																<s:checkbox path="inn" cssClass="inn" id="inn"/>
																<label>In use</label>
															</div>					
														</div>
														
														<div class="modal-footer">
															<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
															<input type="submit" class="btn btn-info" value="Update">
														</div>
													</s:form>
												</div>
											</div>
										</div>
									</div>
									<!-- Table wrapper -->				  				
								</div>
								<!-- col -->
							</div>
							<!-- row -->
					  	</div>
					  	<!-- Education -->
					  	
					  	<div class="tab-pane" id="contact" role="tabpanel" aria-labelledby="contact-tab">
							<div class="row my-3">
								<div class="col col-sm-12 col-md-12 col-lg-12">
									<div class="table-title d-flex justify-content-between">
										<h4 class="mt-2">Contact Details</h4>
										<a href="#contactAddModal" class="btn btn-info add-new px-3 py-2" data-toggle="modal"><i class="fa fa-plus-circle"></i> <span class="ml-2">Add</span></a>
									</div>
									
									<div class="row mx-auto my-3">
										<c:forEach var="c" items="${con}">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<c:if test="${c.user_ref.user_id ==  UserId}">
													<h4>${c.contact_category } Address</h4><br>
													<p>${c.door_no }, ${c.street },<br>
														${c.village },${c.city },<br>
														${c.district.name },${c.state.name },<br>
														${c.country.name }-${c.pincode }.</p>
													<div class="d-flex justify-content-between">
														<p>
															<c:if test="${c.inn == 1 }"><span><i class="fa fa-circle text-success"></i>  Active</span></c:if>
															<c:if test="${c.inn != 1 }"><span><i class="fa fa-circle text-danger"></i>  Inactive</span></c:if>
														</p>
														<a href="#contactEditModal" class="edit" data-toggle="modal" data-id="${c.id }" data-user="${c.user_ref.user_id }" data-category="${c.contact_category }" data-door="${c.door_no }" data-street="${c.street }" data-village="${c.village }" data-city="${c.city }" data-country="${c.country.id }" data-state="${c.state.id }" data-district="${c.district.id }" data-pincode="${c.pincode }" data-inn="${c.inn }">
															<i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Edit"></i>
														</a>
													</div>
												</c:if>
											</div>
										</c:forEach>
									</div>											
									<!-- Add Modal HTML -->
									<div id="contactAddModal" class="modal">
										<div class="modal-dialog">
											<div class="modal-content">
												<s:form action="SaveContact" method="post" modelAttribute="contact">
													<div class="modal-header">						
														<h4 class="modal-title">Add Contact Details</h4>
														<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
													</div>
													
													<div class="modal-body">
														<c:if test="${contactAddExist != null }">
															<div class="toast" id="Toast">
																<div class="toast-header white-text bg-danger pt-2">
																	<h5 class="mr-auto">Error</h5>
																	<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="toast-body py-2">
																	<div>This Category Details Already Exist, Enter New One...</div>
																</div>
															</div>
														</c:if>
														
														<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
														
														<div class="row mt-3" hidden="true">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="user_ref" id="user_ref" value="${UserId }" cssClass="form-control"/>
																	<label for="User">User<span class="mandatory"> *</span></label>
																	<s:errors path="user_ref" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="1,2,3"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
	
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="Category" class="my-0">Category<span class="mandatory"> *</span></label>
																<s:select path="contact_category" id="contact_category" cssClass="custom-select browser-default">
																	<option value="">-- Select --</option>
																	<option value="Official">Official</option>
																	<option value="Permanent">Permanent</option>
																</s:select>
																<s:errors path="contact_category" cssClass="error"/>
															</div>	
														</div>
														
														<div class="row mt-3">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="door_no" id="door_no" max-length="10" cssClass="form-control"/>
																	<label for="Door Number">Door No / Flat NO<span class="mandatory"> *</span></label>
																	<s:errors path="door_no" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="7/77"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="street" id="street" cssClass="form-control"/>
																	<label for="Street">Street Name<span class="mandatory"> *</span></label>
																	<s:errors path="street" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="ABC Street"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="village" id="village" cssClass="form-control"/>
																	<label for="Village">Village</label>
																	<s:errors path="village" cssClass="error"/>		
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="xxxx"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="city" id="city" cssClass="form-control"/>
																	<label for="City">City</label>
																	<s:errors path="city" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="YYYY"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="Country" class="my-0">Country<span class="mandatory"> *</span></label>
																<s:select path="country" id="country" cssClass="browser-default custom-select" />
																<s:errors path="country" cssClass="error" />
															</div>
														</div>
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="State" class="my-0">State<span class="mandatory"> *</span></label>
																<s:select path="state" id="state" cssClass="browser-default custom-select" />
																<s:errors path="state" cssClass="error" />
															</div>
														</div>
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="district" class="my-0">District<span class="mandatory"> *</span></label>
																<s:select path="district" id="district" cssClass="browser-default custom-select" />
																<s:errors path="district" cssClass="error" />
															</div>
														</div>
														<div class="row mt-3">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="pincode" id="pincode" maxlength="6" cssClass="form-control"/>
																	<label for="Pindcode">Pincode<span class="mandatory"> *</span></label>
																	<s:errors path="pincode" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="654321"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="form-group">
															<s:checkbox path="inn" cssClass="inn"/>
															<label>In use</label>
														</div>					
													</div>
													<div class="modal-footer">
														<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
														<input type="submit" class="btn btn-info" value="Add">
													</div>
												</s:form>
											</div>
										</div>
									</div>
														
									<!-- Edit Modal HTML -->
									<div id="contactEditModal" class="modal">
										<div class="modal-dialog">
											<div class="modal-content">
												<s:form action="EditContact" method="post" modelAttribute="contact">
													<div class="modal-header">						
														<h4 class="modal-title">Edit Contact Details</h4>
														<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
													</div>
																		
													<div class="modal-body">
														
														<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
														
														<s:hidden path="id" id="id"/>
														<s:hidden path="user_ref" id="user_ref" value="${UserId }"/>
														
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="Category" class="my-0">Category<span class="mandatory"> *</span></label>
																<s:select path="contact_category" id="contact_category" cssClass="custom-select browser-default">
																	<option value="">-- Select --</option>
																	<option value="Official">Official</option>
																	<option value="Permanent">Permanent</option>
																</s:select>
																<s:errors path="contact_category" cssClass="error"/>
															</div>	
														</div>
														
														<div class="row mt-3">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="door_no" id="door_no" max-length="10" cssClass="form-control" autofocus="autofocus"  />
																	<label for="Door Number">Door No / Flat NO<span class="mandatory"> *</span></label>
																	<s:errors path="door_no" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="7/77"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="street" id="street" cssClass="form-control" autofocus="autofocus"  />
																	<label for="Street">Street Name<span class="mandatory"> *</span></label>
																	<s:errors path="street" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="XXXX"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="village" id="village" cssClass="form-control" autofocus="autofocus"  />
																	<label for="Village">Village</label>
																	<s:errors path="village" cssClass="error"/>		
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="XXXXX"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="city" id="city" cssClass="form-control" autofocus="autofocus"  />
																	<label for="City">City</label>
																	<s:errors path="city" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="YYYYY"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="Country" class="my-0">Country<span class="mandatory"> *</span></label>
																<s:select path="country" id="editCountry" cssClass="browser-default custom-select" />
																<s:errors path="country" cssClass="error" />
															</div>
														</div>
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="State" class="my-0">State<span class="mandatory"> *</span></label>
																<s:select path="state" id="editState" cssClass="browser-default custom-select" />
																<s:errors path="state" cssClass="error" />
															</div>
														</div>
														<div class="row mt-2">
															<div class="col-sm-12">
																<label for="district" class="my-0">District<span class="mandatory"> *</span></label>
																<s:select path="district" id="editDistrict" cssClass="browser-default custom-select" />
																<s:errors path="district" cssClass="error" />
															</div>
														</div>
														<div class="row mt-3">
															<div class="col-sm-11">
																<div class="md-form mt-0">
																	<s:input path="pincode" id="pincode" maxlength="6" cssClass="form-control" autofocus="autofocus"  />
																	<label for="Pindcode">Pincode<span class="mandatory"> *</span></label>
																	<s:errors path="pincode" cssClass="error"/>
																</div>
															</div>
															<div class="col-sm-1 p-0">
																<a href="#" data-toggle="tooltip" data-placement="top" title="654321"><i class="fa fa-info-circle mt-4"></i></a>	
															</div>
														</div>
														<div class="form-group">
															<s:checkbox path="inn" cssClass="inn" id="inn"/>
															<label>In use</label>
														</div>			
													</div>
													
													<div class="modal-footer">
														<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
														<input type="submit" class="btn btn-info" value="Update">
													</div>
												</s:form>
											</div>
										</div>
									</div>
								</div>
								<!-- col -->
							</div>
							<!-- row -->
						</div>
						<!-- contact -->
						
					</div>
					<!-- Tab panes -->
				</div>
				<!-- content -->							
			</div>
			<!-- container fluid -->
		</div>
		<!-- wrapper -->
		
		<jsp:include page="Footer.jsp" />
		
		<a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fa fa-angle-up"></i>
		</a>
		
		<c:if test="${schoolAddError != null }"> 
			<script type="text/javascript">
				$('.nav-tabs a[href="#education"]').tab('show')
				$('#schoolAddModal').modal('show');
			</script>
		</c:if>
		<c:if test="${collegeAddError != null }"> 
			<script type="text/javascript">
				$('.nav-tabs a[href="#education"]').tab('show')
				$('#collegeAddModal').modal('show');
			</script>
		</c:if>
		<c:if test="${contactAddError != null }"> 
			<script type="text/javascript">
				$('.nav-tabs a[href="#contact"]').tab('show')
				$('#contactAddModal').modal('show');
			</script>
		</c:if>
		
		<c:if test="${schoolEditError != null }"> 
			<script type="text/javascript">
				$('.nav-tabs a[href="#education"]').tab('show')
				$('#schoolEditModal').modal('show');
			</script>
		</c:if>
		<c:if test="${collegeEditError != null }"> 
			<script type="text/javascript">
				$('.nav-tabs a[href="#education"]').tab('show')
				$('#collegeEditModal').modal('show');
			</script>
		</c:if>
		<c:if test="${contactEditError != null }"> 
			<script type="text/javascript">
				$('.nav-tabs a[href="#contact"]').tab('show')
				$('#contactEditModal').modal('show');
			</script>
		</c:if>
		
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
		<script type="text/javascript" src="./views/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){			
	
				$('#schoolEditModal').on('show.bs.modal', function (event) {
					var button = $(event.relatedTarget);
					var id = button.data('id');
					var user = button.data('user');
					var category = button.data('category');
					var school = button.data('school');
					var board = button.data('board');
					var marks = button.data('marks');
					var percentage = button.data('percentage');
					var inn = button.data('inn');
	
					var modal = $(this);
					modal.find('#id').val(id);
					modal.find('#user_ref').val(user);
					modal.find('#school_category').val(category);
					modal.find('#school_name').val(school);
					modal.find('#board').val(board);
					modal.find('#marks').val(marks);
					modal.find('#percentage').val(percentage);
					
					if(inn == 1)
						modal.find('#inn').prop('checked',true);
					else
						modal.find('#inn').prop('checked',false);
				});
	
				$('#collegeEditModal').on('show.bs.modal', function (event) {
					var button = $(event.relatedTarget);
					var id = button.data('id');
					var user = button.data('user');
					var category = button.data('category');
					var college = button.data('college');
					var course = button.data('course');
					var university = button.data('university');
					var cgpa = button.data('cgpa');
					var inn = button.data('inn');
	
					var modal = $(this);
					modal.find('#id').val(id);
					modal.find('#user_ref').val(user);
					modal.find('#college_category').val(category);
					modal.find('#clg_name').val(college);
					modal.find('#course').val(course);
					modal.find('#university').val(university);
					modal.find('#cgpa').val(cgpa);
					
					if(inn == 1)
						modal.find('#inn').prop('checked',true);
					else
						modal.find('#inn').prop('checked',false);
				});
	
				$('#contactEditModal').on('show.bs.modal', function (event) {
					var button = $(event.relatedTarget);
					var id = button.data('id');
					var user = button.data('user');
					var category = button.data('category');
					var door = button.data('door');
					var street = button.data('street');
					var village = button.data('village');
					var city = button.data('city');
					var country = button.data('country');
					var state = button.data('state');
					var district = button.data('district');
					var pincode = button.data('pincode');
					var inn = button.data('inn');
	
					var modal = $(this);
					modal.find('#id').val(id);
					modal.find('#user_ref').val(user);
					modal.find('#contact_category').val(category);
					modal.find('#door_no').val(door);
					modal.find('#street').val(street);
					modal.find('#village').val(village);
					modal.find('#city').val(city);
					modal.find('#editCountry').val(country);
					modal.find('#editState').val(state);
					modal.find('#editDistrict').val(district);
					modal.find('#pincode').val(pincode);
					
					if(inn == 1)
						modal.find('#inn').prop('checked',true);
					else
						modal.find('#inn').prop('checked',false);
				});
				
				var designation = $('#designation');
	            $.ajax({
	                type:'GET',
	                url:"http://localhost:8080/api/getAllDesignation",
	                async:true,
	                success:function(result){
	                    var output = "<option selected disabled> -- Select -- </option>";
	                    for(var i in result){
	                        output+="<option value="+result[i].id+">"+result[i].name+"</option>";
	                    }
	                    designation.html(output);
	                }
	            });
	
				var blood = $('#blood_group');
	            $.ajax({
	                type:'GET',
	                url:"http://localhost:8080/api/getAllBlood",
	                async:true,
	                success:function(result){
	                    var output = "<option selected disabled> -- Select -- </option>";
	                    for(var i in result){
	                        output+="<option value="+result[i].id+">"+result[i].name+"</option>";
	                    }
	                    blood.html(output);
	                }
	            });
	
	            var language = $('#mother_tongue');
	            $.ajax({
	                type:'GET',
	                url:"http://localhost:8080/api/getAllLanguage",
	                async:true,
	                success:function(result){
	                    var output = "<option selected disabled> -- Select -- </option>";
	                    for(var i in result){
	                        output+="<option value="+result[i].id+">"+result[i].name+"</option>";
	                    }
	                    language.html(output);
	                }
	            });
	
	            var religion = $('#religion');
	            $.ajax({
	                type:'GET',
	                url:"http://localhost:8080/api/getAllReligion",
	                async:true,
	                success:function(result){
	                    var output = "<option selected disabled> -- Select -- </option>";
	                    for(var i in result){
	                        output+="<option value="+result[i].id+">"+result[i].name+"</option>";
	                    }
	                    religion.html(output);
	                }
	            });
	
	            var comm = $('#comm_category');
	            $.ajax({
	                type:'GET',
	                url:"http://localhost:8080/api/getAllCommunity",
	                async:true,
	                success:function(result){
	                    var output = "<option selected disabled> -- Select -- </option>";
	                    for(var i in result){
	                        output+="<option value="+result[i].id+">" + result[i].acronym + "</option>";
	                    }
	                    comm.html(output);
	                }
	            });
	
	            var nation = $('#nation');
	            $.ajax({
					type:'GET',
					url:"http://localhost:8080/api/getAllCountry",
					async:true,
					success:function(result){
						var output = "<option selected disabled> -- Select -- </option>";
						for(var i in result){
							output+="<option value="+result[i].id+">" + result[i].name + "</option>";
						}
						nation.html(output);
					}
	            });
	            
	            var country = $('#country');
	            $.ajax({
					type:'GET',
					url:"http://localhost:8080/api/getAllCountry",
					async:true,
					success:function(result){
						var output = "<option selected disabled> -- Select -- </option>";
						for(var i in result){
							output+="<option value="+result[i].id+">" + result[i].name + "</option>";
						}
						country.html(output);
					}
	            });
	
	            var state = $('#state');
	            $('#country').change(function(){
	                $(this).find("option:selected").each(function(){
	                    var id = $(this).attr("value");
	                    var pre = "http://localhost:8080/api/getAllStateByCountryId/";
	                    var varurl = pre+id;
	                    $.ajax({
	                        type: 'GET',
	                        url: varurl,
	                        async: true,
	                        success:function(result){
	                            var output = "<option value='0'>-- Select --</option>";
	                            for(var i in result){
	                                output+="<option value="+result[i].state.id+">"+result[i].state.name+"</option>";
	                            }
	                            state.html(output);
	                        }
	                    });
	                });
	            });
	
	            var district = $('#district');
	            $('#state').change(function(){
	                $(this).find("option:selected").each(function(){
	                    var id1 = $('#country option:selected').val();
	                    var id = $(this).attr("value");
	                    var pre = "http://localhost:8080/api/getAllDistrictByStateId/";
	                    var varurl = pre+id1+"/"+id;
	                    $.ajax({
	                        type: 'GET',
	                        url: varurl,
	                        async: true,
	                        success:function(result){
	                            var output = "<option value='0'>-- Select --</option>";
	                            for(var i in result){
	                                output+="<option value="+result[i].district.id+">"+result[i].district.name+"</option>";
	                            }
	                            district.html(output);
	                        }
	                    });
	                });
	            });
	
	            var editcountry = $('#editCountry');
	            $.ajax({
					type:'GET',
					url:"http://localhost:8080/api/getAllCountry",
					async:true,
					success:function(result){
						var output = "<option selected disabled> -- Select -- </option>";
						for(var i in result){
							output+="<option value="+result[i].id+">" + result[i].name + "</option>";
						}
						editcountry.html(output);
					}
	            });
	
	            var editstate = $('#editState');
	            $.ajax({
					type:'GET',
					url:"http://localhost:8080/api/getAllState",
					async:true,
					success:function(result){
						var output = "<option selected disabled> -- Select -- </option>";
						for(var i in result){
							output+="<option value="+result[i].id+">" + result[i].name + "</option>";
						}
						editstate.html(output);
					}
	            });
	
	            var editdistrict = $('#editDistrict');
	            $.ajax({
					type:'GET',
					url:"http://localhost:8080/api/getAllDistrict",
					async:true,
					success:function(result){
						var output = "<option selected disabled> -- Select -- </option>";
						for(var i in result){
							output+="<option value="+result[i].id+">" + result[i].name + "</option>";
						}
						editdistrict.html(output);
					}
	            });            
				
	            var dob = $('#date').val();
	            
				if(dob != ''){
				    var str=dob.split('-');    
				    var firstdate=new Date(str[0],str[1],str[2]);
				    var today = new Date();        
				    var dayDiff = Math.ceil(today.getTime() - firstdate.getTime()) / (1000 * 60 * 60 * 24 * 365);
				    var age = parseInt(dayDiff);
				    $('#age').val(age);
				}
				
			});
		</script>
	</body>
</html>