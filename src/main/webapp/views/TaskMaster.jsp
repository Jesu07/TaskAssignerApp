<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<% Date date = new Date( ); 
SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd hh:mm:ss"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Task Master</title>
		
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
									<i class="fa fa-angle-double-right mx-2 mt-1" aria-hidden="true"></i>
								</li>
								<li class="breadcrumb-item active">Task Master</li>
							</ol>
						</nav>
					</div>
								
					<div class="row py-1">
						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="table-wrapper">
								
								<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
								
								<c:url value="/GetTaskMaster" var="pagedLink">
									<c:param name="p" value="~" />
								</c:url>
								
								<table class="table table-striped table-hover">
									<thead>
										<tr class="table-title">
											<td colspan="3"><h5>Manage <b>Tasks</b></h5></td>
											<td></td>
											<td colspan="3"><a href="#addModal" class="btn btn-info add-new px-3 py-2" data-toggle="modal"><i class="fa fa-plus-circle"></i> <span class="ml-2">Add</span></a></td>
										</tr>
										<tr>
											<th>Created By</th>
											<th>Task Name</th>
											<th>Description</th>
											<th>Created on</th>
											<th>Status</th>
											<th>In Use</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="l" items="${pagedListHolder.pageList }">
											<tr>
												<td class="text-capitalize">${l.user_ref.name }</td>
												<td>${l.task_name }</td>
												<td>${l.description }</td>
												<td>${l.created_on }</td>
												<td>${l.status }</td>
												<td>
													<c:if test="${l.inn == 1 }"><span><i class="fa fa-circle text-success"></i>  Active</span></c:if>
													<c:if test="${l.inn != 1 }"><span><i class="fa fa-circle text-danger"></i>  Inactive</span></c:if>
												</td>
												<td>
													<a href="#editModal" class="edit" data-toggle="modal" data-id="${l.id }" data-taskname="${l.task_name }" data-description="${l.description }" data-inn="${l.inn }"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Edit"></i></a>
													<a href="#deleteModal" class="delete" data-toggle="modal" data-id="${l.id }" data-taskname="${l.task_name }"><i class="fa fa-trash" data-toggle="tooltip" data-placement="top" title="Delete"></i></a>
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
											<s:form action="SaveTaskMaster" method="post" modelAttribute="addTask">
												<div class="modal-header">						
													<h4 class="modal-title">Add New Task</h4>
													<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
												
												<div class="modal-body">
													<c:if test="${addExist != null }">
														<div class="toast" id="Toast">
															<div class="toast-header white-text bg-danger pt-2">
																<h5 class="mr-auto">Error</h5>
																<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="toast-body py-2">
																<div>This Task Already Exist, Enter New Task Name...</div>
															</div>
														</div>
													</c:if>
													
													<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
													
													<s:hidden path="id"/>
													
													<div class="row" hidden="true">
														<div class="col-sm-11">
															<div class="md-form mt-0">
																<s:input path="user_ref" id="user_ref" value="${UserId }" cssClass="form-control"/>
																<label for="User Name">User name<span class="mandatory"> *</span></label>
																<s:errors path="user_ref" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col-sm-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
														</div>
													</div>
													<div class="row">
														<div class="col-sm-11">
															<div class="md-form mt-0">
																<s:input path="task_name" id="task_name" cssClass="form-control"/>
																<label for="task Name">Task name<span class="mandatory"> *</span></label>
																<s:errors path="task_name" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col-sm-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
														</div>
													</div>
													<div class="row">
														<label for="Description" class="ml-3">Task Description<span class="mandatory"> *</span></label>
														<div class="col-sm-11">
															<div class="md-form mt-0">
																<s:textarea path="description" id="description" rows="3" cols="20" cssClass="form-control"/>
																<s:errors path="description" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col-sm-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-5"></i></a>	
														</div>
													</div>
													<div class="row">
														<div class="col-sm-11">
															<div class="md-form mt-0">
																<s:input path="created_on" id="created_on" cssClass="form-control" value='<%= ft.format(date) %>' readonly="true"/>
																<label for="Creation Date">Creation Date And Time<span class="mandatory"> *</span></label>
																<s:errors path="created_on" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col-sm-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="YYYY/MM/DD HH:MM:SS"><i class="fa fa-info-circle mt-4"></i></a>	
														</div>
													</div>
													<div class="form-group">
														<s:checkbox path="inn" cssClass="inn"/>
														<label>In use</label>
													</div>					
												</div>
												<div class="modal-footer">
													<input type="button" class="btn-custom px-4 py-2" data-dismiss="modal" value="Cancel">
													<input type="submit" class="btn-custom px-4 py-2" value="Add">
												</div>
											</s:form>
										</div>
									</div>
								</div>
													
								<!-- Edit Modal HTML -->
								<div id="editModal" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<s:form action="EditTask" method="post" modelAttribute="addTask">
												<div class="modal-header">						
													<h4 class="modal-title">Edit Task</h4>
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
																	
												<div class="modal-body">
													<c:if test="${editExist != null }">
														<div class="toast" id="Toast">
															<div class="toast-header white-text bg-danger pt-2">
																<h5 class="mr-auto">Error</h5>
																<button type="button" class="ml-2 mb-1 close white-text"
																	data-dismiss="toast">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="toast-body py-2">
																<div>This Task Already Exist.. Try New One...</div>
															</div>
														</div>
													</c:if>
													
													<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
													
													<s:hidden path="id" id="id"/>					
													
													<div class="row">
														<div class="col-sm-11">
															<div class="md-form mt-0">
																<s:input path="task_name" id="task_name" autofocus="autofocus" cssClass="form-control"/>
																<label for="task Name">Task name<span class="mandatory"> *</span></label>
																<s:errors path="task_name" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col-sm-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
														</div>
													</div>
													<div class="row">
														<label for="Description" class="ml-3">Task Description<span class="mandatory"> *</span></label>
														<div class="col-sm-11">
															<div class="md-form mt-0">
																<s:textarea path="description" id="description" rows="3" cols="20" cssClass="form-control"/>
																<s:errors path="description" cssClass="error"></s:errors>
															</div>
														</div>
														<div class="col-sm-1 p-0">
															<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-5"></i></a>	
														</div>
													</div>
													<div class="form-group">
														<s:checkbox path="inn" id="inn"/>
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
								
								<!-- Delete Modal HTML -->
								<div id="deleteModal" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<form action="DeleteTask" method="post">
												<div class="modal-header">						
													<h4 class="modal-title">Delete Task</h4>
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
												<div class="modal-body">					
													<input id="id" name="id" hidden="true" />
													<div class="md-form mt-0">
														<input id="task_name" autofocus="autofocus" class="form-control" readonly/>
														<label for="Task Name">Task Name</label>
													</div>
													<p>Are you sure you want to Deactivate these Record ?</p>
												</div>
												<div class="modal-footer">
													<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
													<input type="submit" class="btn btn-danger" value="Delete">
												</div>
											</form>
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
				<!-- Container Fluid -->
			</div>
		</div>
		<!-- Wrapper -->
		
		<c:if test="${added != null }">
			<div class="toast" id="Toast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text pt-2 bg-success">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Task Details are Added Successfully.</div>
				</div>
			</div>
		</c:if>
	
		<c:if test="${updated != null }">
			<div class="toast" id="Toast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text bg-success pt-2">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Task Details are Updated Successfully.</div>
				</div>
			</div>
		</c:if>
	
		<c:if test="${deleted != null }">
			<div class="toast" id="Toast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text bg-danger pt-2">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text"
						data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Task Deactivated Successfully.</div>
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
		
		<jsp:include page="Footer.jsp" />
		
		<a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fa fa-angle-up"></i>
		</a>
		
	    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script type="text/javascript" src="./views/js/common.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$('#editModal').on('show.bs.modal', function (event) {
				var button = $(event.relatedTarget);
				var id = button.data('id');
				var taskname = button.data('taskname');
				var description = button.data('description');
				var inn = button.data('inn');
	
				var modal = $(this);
				modal.find('#id').val(id);
				modal.find('#task_name').val(taskname);
				modal.find('#description').val(description);
				
				if(inn == 1)
					modal.find('#inn').prop('checked',true);
				else
					modal.find('#inn').prop('checked',false);
			});
	
			$('#deleteModal').on('show.bs.modal', function (event) {
				var button = $(event.relatedTarget);
				var id = button.data('id');
				var taskname = button.data('taskname'); 
	
				var modal = $(this);
				modal.find('#id').val(id);
				modal.find('#task_name').val(taskname);
			});
		});
		</script>
	</body>
</html>