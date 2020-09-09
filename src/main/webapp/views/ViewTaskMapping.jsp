<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Task Responses</title>
		
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
								<li class="breadcrumb-item active">Manage Task Responses</li>
							</ol>
						</nav>
					</div>
					
					<div class="row py-2">
						<div class="col-sm-12 col-md-6 col-lg-4 mx-auto">
							<label class="my-0 pb-1">Select Any One User</label>
							<select name="user" id="hello" class="browser-default custom-select"></select>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="table-wrapper">
								<table class="table table-striped text-center">
									<thead>
										<tr class="table-title">
											<td colspan="10"><h2>Manage Task Responses</h2></td>
										</tr>
										<tr>
											<th style="width:100px;">Task Name</th>
											<th style="width:10px;">Deadline</th>
											<th style="width:10px;">Reminder Count</th>
											<th style="width:200px;">Extension Description</th>
											<th style="width:20px;">Completion Date</th>
											<th style="width:100px;">Completion Description</th>
											<th style="width:10px;">Completion Status</th>
											<th style="width:10px;">Score</th>
											<th style="width:10px;">Actions</th>
										</tr>
									</thead>
									<tbody id="tasklist"></tbody>
								</table>
							</div>
						</div>	
					</div>
					<!-- row -->
					
					<div id="ExtensionModal" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<form action="RespondExtension" method="post">
									<div class="modal-header py-3">
										<h5>Extend Form</h5>
										<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
										<input type="text" name="id" id="id" hidden="true"/>
										<div class="row" hidden="true">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="user_ref" id="user_ref" class="form-control" autofocus="autofocus" readonly />
													<label for="User Name">User Id</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="username" id="username" class="form-control" autofocus="autofocus" readonly />
													<label for="User Name">User</label>
												</div>
											</div>
										</div>
										<div class="row" hidden="true">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="task" id="task" class="form-control" autofocus="autofocus" readonly />
													<label for="task Name">Task Id</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="" id="taskname" class="form-control" autofocus="autofocus" readonly />
													<label for="task Name">Task name</label>
												</div>
											</div>
										</div>
										<div class="row">
											<label for="Description" class="ml-3">Task Description</label>
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<textarea name="description" id="description" rows="2" cols="20" class="form-control" autofocus="autofocus" readonly></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="deadline" id="deadline" class="form-control" autofocus="autofocus" readonly />
													<label for="deadline">Deadline</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="reminder" id="reminder" class="form-control" autofocus="autofocus" readonly />
													<label for="Reminder">Reminder Count</label>
												</div>
											</div>
										</div>
										<div class="row">
											<label for="Description" class="ml-3">Reason For Extension</label>
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<textarea name="extension_description" id="extension_description" rows="2" cols="20" class="form-control" autofocus="autofocus" readonly></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input type="date" name="extended_deadline" id="extended_deadline" class="form-control" required/>
													<label for="extension Date">Next Deadline<span class="mandatory"> *</span></label>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal-body -->
									<div class="modal-footer">
										<input type="reset" class="btn-custom px-4 py-2" data-dismiss="modal" value="Cancel">
										<input type="submit" class="btn-custom px-4 py-2" value="Extend">
									</div>
								</form>
							</div>
							<!-- Modal content -->
						</div>
						<!-- Modal Dialog -->
					</div>
					<!-- Modal -->
					
					<div id="ValidationModal" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<form action="ValidateResponse" method="post">
									<div class="modal-header py-3">
										<h5>Validation Form</h5>
										<button type="button" class="close white-text" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<label class="d-flex justify-content-end mandatory mandatory-text mr-2">* must be filled</label>
										<input type="text" name="id" id="id" hidden="true"/>
										<div class="row" hidden="true">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="user_ref" id="user_ref" class="form-control" autofocus="autofocus" readonly />
													<label for="User Name">User Id</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="username" id="username" class="form-control" autofocus="autofocus" readonly />
													<label for="User Name">User</label>
												</div>
											</div>
										</div>
										<div class="row" hidden="true">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="task" id="task" class="form-control" autofocus="autofocus" readonly />
													<label for="task Name">Task Id</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="" id="taskname" class="form-control" autofocus="autofocus" readonly />
													<label for="task Name">Task name</label>
												</div>
											</div>
										</div>
										<div class="row">
											<label for="Description" class="ml-3">Task Description</label>
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<textarea name="description" id="description" rows="2" cols="20" class="form-control" autofocus="autofocus" readonly></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="deadline" id="deadline" class="form-control" autofocus="autofocus" readonly />
													<label for="deadline">Deadline</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="reminder" id="reminder" class="form-control" autofocus="autofocus" readonly />
													<label for="Reminder">Reminder Count</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<input name="completion_date" id="completion_date" class="form-control" autofocus="autofocus" readonly />
													<label for="Completion date">Completed on</label>
												</div>
											</div>
										</div>
										<div class="row">
											<label for="Description" class="ml-3">Completion Description</label>
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<textarea name="completion_description" id="completion_description" rows="2" cols="20" class="form-control" autofocus="autofocus" readonly></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<label for="Score" class="pl-3">Score<span class="mandatory"> *</span></label>
											<div class="col-sm-12">
												<div class="md-form mt-0">
													<select name="score" id="score" class="browser-default custom-select" required>
														<option value="0">-- Select Score --</option>
														<option value="5">5</option>
														<option value="4">4</option>
														<option value="3">3</option>
														<option value="2">2</option>
														<option value="1">1</option>
													</select>		
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<input type="reset" class="btn-custom px-4 py-2" data-dismiss="modal" value="Cancel">
										<input type="submit" class="btn-custom px-4 py-2" value="Submit">	
									</div>
								</form>	
							</div>
							<!-- Modal Content -->
						</div>
						<!-- Modal Dialog -->
					</div>
					<!-- Modal -->
				</div>
				<!-- Container fluid -->
			</div>
			<!-- Content -->
	    </div>
	    <!-- Wrapper -->
	    
	    <c:if test="${DateExtended != null }">
			<div class="toast" id="LongToast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text pt-2 bg-success">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>Deadline Extended For this User done successfully...</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${TaskReportValidated != null }">
			<div class="toast" id="LongToast" style="position: absolute; right: 10px; top: 130px; width: 300px;">
				<div class="toast-header white-text pt-2 bg-success">
					<h6 class="mr-auto">Success</h6>
					<button type="button" class="ml-2 mb-1 close white-text" data-dismiss="toast">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body py-2">
					<div>User Report was Validated Successfully...</div>
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
					var userid = button.data('userid');
					var username = button.data('user');
					var taskid = button.data('taskid');
					var taskname = button.data('taskname');
					var taskdesc = button.data('taskdesc');
					var deadline = button.data('deadline');
					var reminder = button.data('reminder');
					var extensiondesc = button.data('extensiondesc');
					
					var modal = $(this);
					modal.find('#id').val(id);
					modal.find('#user_ref').val(userid);
					modal.find('#username').val(username);
					modal.find('#task').val(taskid);
					modal.find('#taskname').val(taskname);
					modal.find('#description').val(taskdesc);
					modal.find('#deadline').val(deadline);
					modal.find('#reminder').val(reminder);
					modal.find('#extension_description').val(extensiondesc);
				});

				$('#ValidationModal').on('show.bs.modal', function (event) {
					var button = $(event.relatedTarget);
					var id = button.data('id');
					var userid = button.data('userid');
					var username = button.data('user');
					var taskid = button.data('taskid');
					var taskname = button.data('taskname');
					var taskdesc = button.data('taskdesc');
					var deadline = button.data('deadline');
					var reminder = button.data('reminder');
					var completiondate = button.data('completiondate');
					var completiondesc = button.data('completiondesc');
					
					var modal = $(this);
					modal.find('#id').val(id);
					modal.find('#user_ref').val(userid);
					modal.find('#username').val(username);
					modal.find('#task').val(taskid);
					modal.find('#taskname').val(taskname);
					modal.find('#description').val(taskdesc);
					modal.find('#deadline').val(deadline);
					modal.find('#reminder').val(reminder);
					modal.find('#completion_date').val(completiondate);
					modal.find('#completion_description').val(completiondesc);
				});

				var user = $('#hello');
				var varurl = "http://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllUsers";
				$.ajax({
					type: 'GET',
					url: varurl,
					async: true,
					success: function(result){
						//console.log(result);
						var output = "<option value='0'> -- Select -- </option>";
		                for(var i in result){
		                    output+="<option value=" + result[i].user_id + ">" + result[i].name + "</option>";
		                }
						//console.log(output);
					user.html(output);
					}
				});

				var tasklist = $('#tasklist');
				$('#hello').change(function(){
	                $(this).find("option:selected").each(function(){
	                    var id = $(this).attr("value");
						
                		var pre = "http://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllTaskByUserId/";
                		var varurl = pre+id;
                		$.ajax({
                			type: 'GET',
                    		url: varurl,
                    		async: true,
                    		success:function(result){
                    			//console.log(result);
                    			var output = "";
                    			if(result == 0){
									output = "<tr><td colspan='10' class='text-center'>No Records to show...</td></tr>";
                            	}else{
                            		for(var i in result){
                                		if(result[i].completion_status < 1){
                                			output += "<tr><td>"+ result[i].task.task_name +"</td><td>"+ result[i].deadline +"</td><td>"+ result[i].reminder +"</td><td>"+ result[i].extension_description +"</td><td>"+ result[i].completion_date +"</td><td>"+ result[i].completion_description +"</td><td>"+ result[i].completion_status +"</td><td>"+ result[i].score +"</td><td><a href='#ExtensionModal' class='' data-toggle='modal' data-id='"+ result[i].id +"' data-userid='"+ result[i].user.user_id +"' data-user='"+ result[i].user.name +"' data-taskid='"+ result[i].task.id +"' data-taskname='"+ result[i].task.task_name +"' data-taskdesc='"+ result[i].task.description +"' data-deadline='"+ result[i].deadline +"' data-reminder='"+ result[i].reminder +"' data-extensiondesc='"+ result[i].extension_description +"'><i class='fa fa-plus text-info mx-1' data-toggle='tooltip' data-placement='top' title='Extend'></i>Extend</a><a href='#ValidationModal' class='' data-toggle='modal' data-id='"+ result[i].id +"' data-userid='"+ result[i].user.user_id +"' data-user='"+ result[i].user.name +"' data-taskid='"+ result[i].task.id +"' data-taskname='"+ result[i].task.task_name +"' data-taskdesc='"+ result[i].task.description +"' data-deadline='"+ result[i].deadline +"' data-reminder='"+ result[i].reminder +"' data-completiondate='"+ result[i].completion_date +"' data-completiondesc='"+ result[i].completion_description +"'><i class='fa fa-pencil text-success mx-1' data-toggle='tooltip' data-placement='top' title='Validate'></i>Validate</a></td></tr>";
                                        }
                            		}
                                }
                        		console.log(output);
                    			tasklist.html(output);
                    		}
            			});
	             	});
				});
			});
		</script>
	</body>
</html>