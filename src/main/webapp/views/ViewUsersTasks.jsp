<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<% Date date = new Date( ); 
SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>My Tasks</title>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
		<link rel="stylesheet" type="text/css" href="./views/css/style.css">
		
	</head>
	<body id="page-top">
		<div class="overlay"></div>
		
		<c:set var="UserId" value='<%= session.getAttribute("id")%>'/>
		<c:set var="Name" value='<%= session.getAttribute("name")%>'/>
		<c:set var="Role" value='<%= session.getAttribute("role")%>'/>
		<c:set var="Email" value='<%= session.getAttribute("email")%>'/>
		
		<jsp:include page="Header.jsp" />
		
		<div class="wrapper" class="">
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
								<li class="breadcrumb-item active">My Tasks</li>
							</ol>
						</nav>
					</div>
							
					<ul class="nav nav-tabs mt-3" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
					    	<a class="nav-link active" id="pending-tab" data-toggle="tab" href="#pending" role="tab" aria-controls="home" aria-selected="true">Pending Tasks</a>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<a class="nav-link" id="completed-tab" data-toggle="tab" href="#completed" role="tab" aria-controls="profile" aria-selected="false">Completed Tasks</a>
					  	</li>
					</ul>
						
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="pending" role="tabpanel" aria-labelledby="pending-tab">
							<div class="row">
								<div class="col-sm-12 col-md-12 col-lg-12">
									<div class="table-wrapper">
										
										<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
										
										<c:url value="/GetUserTasks" var="pagedLink">
											<c:param name="p" value="~" />
										</c:url>
										
										<table class="table table-striped text-center">
											<thead>
												<tr class="table-title">
													<td colspan="6"><h2>Pending <b>Tasks</b></h2></td>
												</tr>
												<tr>
													<th>Task Name</th>
													<th>Description</th>
													<th>Deadline</th>
													<th>Extended Deadline</th>
													<th>Reminder Count</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="l" items="${pagedListHolder.pageList }">
													<c:if test="${l.user_ref.name == Name  && l.inn == 1 && l.completion_status == 0}">
														<tr>
															<td>${l.task.task_name }</td>
															<td>${l.task.description }</td>
															<td>${l.deadline }</td>
															<td>${l.extended_deadline }</td>
															<td>${l.reminder }</td>
															<td>
																<c:if test="${l.reminder < 3 }">
																	<a href="#ExtensionModal" class="edit" data-toggle="modal" data-id="${l.id }" data-user="${l.user_ref.user_id }" data-taskid="${l.task.id }" data-taskname="${l.task.task_name }" data-description="${l.task.description }" data-reminder="${l.reminder }"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Extend"></i></a>
																</c:if>	
																<a href="#ResponseModal" class="" data-toggle="modal" data-id="${l.id }" data-user="${l.user_ref.user_id }" data-taskid="${l.task.id }" data-taskname="${l.task.task_name }" data-description="${l.task.description }" data-reminder="${l.reminder }"><i class="fa fa-reply text-info" data-toggle="tooltip" data-placement="top" title="Respond"></i></a>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										
										<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
										
										<div id="ExtensionModal" class="modal fade">
											<div class="modal-dialog">
												<div class="modal-content">
													<form action="RequestExtension" method="post">
														<div class="modal-header">						
															<h4 class="modal-title">Request For Extension</h4>
															<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
														</div>
														
														<div class="modal-body">
															<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
															<input type="text" name="id" id="id" hidden="true"/>
															<div class="row"  hidden="true">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="user_ref" id="user_ref" class="form-control" autofocus="autofocus" readonly />
																		<label for="user Name">User Id<span class="mandatory"> *</span></label>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row"  hidden="true">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="task" id="task" class="form-control" autofocus="autofocus" readonly />
																		<label for="task Name">Task Id<span class="mandatory"> *</span></label>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="" id="taskname" class="form-control" autofocus="autofocus" readonly />
																		<label for="task Name">Task name<span class="mandatory"> *</span></label>
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
																		<textarea name="description" id="description" rows="2" cols="20" class="form-control"  autofocus="autofocus" readonly></textarea>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-5"></i></a>	
																</div>
															</div>
															<div class="row" hidden="true">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="reminder" id="reminder" class="form-control" autofocus="autofocus" readonly />
																		<label for="Reminder">Reminder<span class="mandatory"> *</span></label>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<label for="Description" class="ml-3">Reason For Extension<span class="mandatory"> *</span></label>
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<textarea name="extension_description" id="extension_description" rows="2" cols="20" class="form-control" autofocus="autofocus" required></textarea>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="Reason for Extension"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
															<input type="submit" class="btn btn-info" value="Apply">
														</div>
													</form>
												</div>
											</div>
										</div>
										
										<div id="ResponseModal" class="modal fade">
											<div class="modal-dialog">
												<div class="modal-content">
													<form action="SaveResponse" method="post">
														<div class="modal-header">						
															<h4 class="modal-title">Task Report</h4>
															<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
														</div>
														
														<div class="modal-body">
															<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
															<input type="text" name="id" id="id" hidden="true"/>
															<div class="row" hidden="true">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="user_ref" id="user_ref" class="form-control" autofocus="autofocus" readonly />
																		<label for="User Name">User Id<span class="mandatory"> *</span></label>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row" hidden="true">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="task" id="task" class="form-control" autofocus="autofocus" readonly />
																		<label for="task Name">Task Id<span class="mandatory"> *</span></label>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="" id="taskname" class="form-control" autofocus="autofocus" readonly />
																		<label for="task Name">Task name<span class="mandatory"> *</span></label>
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
																		<textarea name="description" id="description" rows="2" cols="20" class="form-control"  autofocus="autofocus" readonly></textarea>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-5"></i></a>	
																</div>
															</div>
															<div class="row">
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<input name="completion_date" id="completion_date" class="form-control" value='<%= ft.format(date) %>' autofocus="autofocus" readonly/>
																		<label for="Completion Date">Task Completion Date<span class="mandatory"> *</span></label>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="YYYY/MM/DD HH:MM:SS"><i class="fa fa-info-circle mt-4"></i></a>	
																</div>
															</div>
															<div class="row">
																<label for="Description" class="ml-3">Task Completion Description<span class="mandatory"> *</span></label>
																<div class="col-sm-11">
																	<div class="md-form mt-0">
																		<textarea name="completion_description" id="completion_description" rows="2" cols="20" class="form-control"  autofocus="autofocus" required></textarea>
																	</div>
																</div>
																<div class="col-sm-1 p-0">
																	<a href="#" data-toggle="tooltip" data-placement="top" title="abcd"><i class="fa fa-info-circle mt-5"></i></a>	
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
															<input type="submit" class="btn btn-info" value="Submit">
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<!-- Table Wrapper -->	
								</div>	
							</div>
							<!-- row -->	
						</div>
						
						<div class="tab-pane" id="completed" role="tabpanel" aria-labelledby="completed-tab">
							<div class="row">
								<div class="col-sm-12 col-md-12 col-lg-12">
									<div class="table-wrapper">
										
										<c:url value="/GetUserTasks" var="pagedLink">
											<c:param name="p" value="~" />
										</c:url>
										
										<table class="table table-striped text-center">
											<thead>
												<tr class="table-title">
													<td colspan="8"><h2>Completed <b>Tasks</b></h2></td>
												</tr>
												<tr>
													<th>Task Name</th>
													<th>Description</th>
													<th>Deadline</th>
													<th>Extended Deadline</th>
													<th style="width: 10px;">Reminder Count</th>
													<th>Completed On</th>
													<th>Completion Description</th>
													<th style="width: 10px;">Score</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="l" items="${pagedListHolder.pageList }">
													<c:if test="${l.user_ref.name == Name  && l.inn == 1 && l.completion_status == 1}">
														<tr>
															<td>${l.task.task_name }</td>
															<td>${l.task.description }</td>
															<td>${l.deadline }</td>
															<td>${l.extended_deadline }</td>
															<td>${l.reminder }</td>
															<td>${l.completion_date }</td>
															<td>${l.completion_description }</td>
															<td>${l.score }</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										
										<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
										
									</div>
								</div>
							</div>
							<!-- Table Wrapper -->
						</div>
					</div>
					<!-- Tab content -->
				</div>
				<!-- Container fluid -->
			</div>
			<!-- Content -->
	    </div>
	    <!-- Wrapper -->
	    
	    <c:if test="${extended != null }">
			<div class="toast" id="LongToast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text pt-2 bg-success">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Your Extension Request was submitted Successfully, Wait for the Response From Admin...</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${response != null }">
			<div class="toast" id="LongToast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text pt-2 bg-success">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Your Task Report was submitted to The System Successfully...</div>
				</div>
			</div>
		</c:if>
	    
	    <jsp:include page="Footer.jsp" />
	    
	    <a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fa fa-angle-up"></i>
		</a> 
	
	 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
	 	<script type="text/javascript" src="./views/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#ExtensionModal').on('show.bs.modal', function (event) {
					var button = $(event.relatedTarget);
					var id = button.data('id');
					var user = button.data('user');
					var taskid = button.data('taskid')
					var taskname = button.data('taskname');
					var description = button.data('description');
					var reminder = button.data('reminder');
		
					var modal = $(this);
					modal.find('#id').val(id);
					modal.find('#user_ref').val(user);
					modal.find('#task').val(taskid);
					modal.find('#taskname').val(taskname);
					modal.find('#description').val(description);
					modal.find('#reminder').val(reminder);
				});

				$('#ResponseModal').on('show.bs.modal', function (event) {
					var button = $(event.relatedTarget);
					var id = button.data('id');
					var user = button.data('user');
					var taskid = button.data('taskid')
					var taskname = button.data('taskname');
					var description = button.data('description');
					var reminder = button.data('reminder');
		
					var modal = $(this);
					modal.find('#id').val(id);
					modal.find('#user_ref').val(user);
					modal.find('#taskname').val(taskname);
					modal.find('#task').val(taskid);
					modal.find('#description').val(description);
					modal.find('#reminder').val(reminder);
				});
			});
		</script>
	</body>
</html>