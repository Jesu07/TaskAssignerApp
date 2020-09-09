<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<% Date date = new Date( ); 
SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Task Assignment</title>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
		<link rel="stylesheet" href="./views/css/style.css">
	</head>
	<body id="page-top" class="ubuntu">
		
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
								<li class="breadcrumb-item active">Task Assignment</li>
							</ol>
						</nav>
					</div>
								
					<div class="row py-1">
						<div class="col-sm-12 col-md-12 col-lg-12 mx-auto">
							<div class="table-wrapper">
								
								<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
								
								<c:url value="/GetTaskMapping" var="pagedLink">
									<c:param name="p" value="~" />
								</c:url>
								
								<table class="table table-striped">
									<thead>
										<tr class="table-title">
											<td colspan="3"><h5>Manage Task Assignment</h5></td>
											<td colspan="3"><a href="#addModal" class="btn btn-info add-new px-3 py-2" data-toggle="modal"><i class="fa fa-plus-circle"></i> <span class="ml-2">Add</span></a></td>
										</tr>
										<tr class="">
											<th style="width: 300px;">Task Name</th>
											<th>Assigned To</th>
											<th>Deadline</th>
											<th>Reminder Count</th>
											<th>In Use</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody class="">
										<c:forEach var="l" items="${pagedListHolder.pageList }">
											<tr>
												<td class="text-capitalize">${l.task.task_name }</td>
												<td class="text-capitalize">${l.user_ref.name }</td>
												<td>${l.deadline }</td>
												<td>${l.reminder }</td>
												<td>
													<c:if test="${l.inn == 1 }"><span><i class="fa fa-circle text-success"></i>  Active</span></c:if>
													<c:if test="${l.inn != 1 }"><span><i class="fa fa-circle text-danger"></i>  Inactive</span></c:if>
												</td>
												<td>
													<a href="changeStatusInTaskMapping?id=${l.id }" class="delete"><i class="fa fa-exchange" data-toggle="tooltip" title="Change"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
								
								<!-- Add Modal HTML -->
								<div id="addModal" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<s:form action="SaveTaskMapping" method="post" modelAttribute="TaskMapping">
												<div class="modal-header">						
													<h4 class="modal-title">Assign New Task</h4>
													<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
												
												<div class="modal-body">
													<c:if test="${addExist != null }">
														<div class="toast" id="Toast">
															<div class="toast-header white-text bg-danger pt-2">
																<h6 class="mr-auto">Error</h6>
																<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="toast-body py-2">
																<div>This Task Already Assigned to <b>${addExist }</b>, Assign New Task...</div>
															</div>
														</div>
													</c:if>
													
													<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
													
													<s:hidden path="id"/>
													
													<div class="row my-0">
														<div class="col-sm-12 col-md-12 col-lg-12">
															<label for="Task">Task<span class="mandatory"> *</span></label>
															<s:select path="task" id="task" cssClass="browser-default custom-select"/>
															<s:errors path="task" cssClass="error"></s:errors>
														</div>
													</div>
													
													<div class="row mt-2 mb-0">
														<div class="col-sm-12 col-md-12 col-lg-12">
															<label for="User" class="">User<span class="mandatory"> *</span></label><br>
															<input type="checkbox" name="select_all" id="select_all" class="drop mx-2"/>Select All Users<br>
															<c:forEach items="${userList }" var="ul">
																<s:checkbox path="user_ref" id="user_ref" value="${ul.user_id }" cssClass="checkbox drop mx-2"/>${ul.name }<br>
															</c:forEach>
															<s:errors path="user_ref" cssClass="error"></s:errors>
														</div>
													</div>
													
													<div class="row mt-3">
														<div class="col-sm-11 col-md-11 col-lg-11">
															<div class="md-form my-0 py-0">
																<s:input path="deadline" id="deadline" cssClass="form-control m-0" placeholder="yyyy-mm-dd" oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" pattern="(?:19|20)(?:(?:[13579][26]|[02468][048])-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))|(?:[0-9]{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:29|30))|(?:(?:0[13578]|1[02])-31)))" />
																<label for="Deadline">Last Date<span class="mandatory"> *</span></label><br>
																<s:errors path="deadline" cssClass="error"></s:errors>
															</div>	
														</div>
														<div class="col-sm-1 col-md-1 col-lg-1 mt-1 p-0">
															<a href="#" class="mt-4" data-toggle="tooltip" data-placement="top" title="YYYY-MM-DD"><i class="fa fa-info-circle mt-3"></i></a>
														</div>
													</div>
													
													<div class="my-0" hidden="true">
														<div class="md-form mt-0">
															<s:input path="extended_deadline" id="extended_deadline" value="0000-00-00" cssClass="form-control" />
															<label for="Deadline">Extended Date<span class="mandatory"> *</span></label><br>
															<s:errors path="extended_deadline" cssClass="error"></s:errors>
														</div>
														<div class="md-form mt-0">
															<s:input path="reminder" id="reminder" value="1" cssClass="form-control" />
															<label for="reminder">Reminder<span class="mandatory"> *</span></label><br>
															<s:errors path="reminder" cssClass="error"></s:errors>
														</div>
														
														<div class="md-form mt-0">
															<s:input path="extension_description" id="extension_description" value="--" cssClass="form-control" />
															<label for="Extension Description">Extension Description<span class="mandatory"> *</span>
															</label><br>
															<s:errors path="extension_description" cssClass="error"></s:errors>
														</div>
														
														<div class="md-form mt-0">
															<s:input path="completion_date" id="completion_date" value="0000-00-00" cssClass="form-control" />
															<label for="completion_date">Completion date<span class="mandatory"> *</span></label><br>
															<s:errors path="completion_date" cssClass="error"></s:errors>
														</div>
					
														<div class="md-form mt-0">
															<s:input path="completion_description" id="completion_description" value="--" cssClass="form-control" />
															<label for="Completion Description">Completion Description<span class="mandatory"> *</span>
															</label><br>
															<s:errors path="completion_description" cssClass="error"></s:errors>
														</div>
					
														<div class="md-form mt-0">
															<s:input path="completion_status" id="completion_status" value="0" cssClass="form-control" />
															<label for="completion_status">Completion Status<span class="mandatory"> *</span></label><br>
															<s:errors path="completion_status" cssClass="error"></s:errors>
														</div>
					
														<div class="md-form mt-0">
															<s:input path="score" id="score" value="0" cssClass="form-control" />
															<label for="Score">Score<span class="mandatory">*</span></label><br>
															<s:errors path="score" cssClass="error"></s:errors>
														</div>
													</div>
						
													<div class="form-group mt-0">
														<s:checkbox path="inn" cssClass="inn" />
														<label>In use</label>
													</div>					
												</div>
												<div class="modal-footer">
													<input type="button" class="btn-custom px-4 py-2" data-dismiss="modal" value="Cancel">
													<input type="submit" class="btn-custom px-4 py-2" value="Assign">
												</div>
											</s:form>
										</div>
									</div>
								</div>	
							</div>
							<!-- Table wrapper -->
						</div>
						<!-- col-md-12 -->
					</div>
					<!-- Row -->
				</div>
				<!-- CONTAINER FLUID -->
			</div>
			<!-- CONTENT -->
		</div>
		<!-- WRAPPER -->
			
		<jsp:include page="Footer.jsp" />
		
		<a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fa fa-angle-up"></i>
		</a>
	
		<c:if test="${added != null }">
			<div class="toast" id="Toast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text pt-2 bg-success">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Task Assigned to the users Successfully.</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${active != null }">
			<div class="toast" id="Toast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text bg-success pt-2">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Mapping Activated Successfully.</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${inactive != null }">
			<div class="toast" id="Toast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text bg-success pt-2">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Mapping Deactivated Successfully.</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${addError != null }"> 
			<script type="text/javascript">
				$('#addModal').modal('show');
			</script>
		</c:if>
		<c:if test="${editError != null }"> 
			<script type="text/javascript">
				$('#editModal').modal('show');
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
				$('#select_all').click(function(event) {   
				    if(this.checked) {
				        $(':checkbox').each(function() {
				            this.checked = true;                        
				        });
				    } else {
				        $(':checkbox').each(function() {
				            this.checked = false;                       
				        });
				    }
				});

				var Task = $('#task');
	            $.ajax({
	                type:'GET',
	                url:"http://localhost:8080/api/getAllTask",
	                async:true,
	                success:function(result){
	                    var output = "<option selected disabled> -- Select -- </option>";
	                    for(var i in result){
	                        output+="<option value="+result[i].id+">"+result[i].task_name+"</option>";
	                    }
	                    Task.html(output);
	                }
	            });
	            
	            var user = $('#user');
	            $.ajax({
	                type:'GET',
	                url:"http://localhost:8080/api/getAllUsers",
	                async:true,
	                success:function(result){
	                    var output = "<option selected disabled> -- Select -- </option>";
	                    for(var i in result){
	                        output+="<option value="+result[i].user_id+">"+result[i].name+"</option>";
	                    }
	                    user.html(output);
	                }
	            });
			});
		</script>		
	</body>
</html>