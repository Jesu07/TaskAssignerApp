<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
		<title>Update Profile</title>
	
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
				<div class="container-fluid">
					<div class="row py-2">
						<div class="col-sm-12 col-md-12 col-lg-12 mx-auto">
							<h4 class="text-center py-2 banner-black">Update Profile</h4>
							<div class="row p-2">
								<s:form action="UpdateProfile" method="post" modelAttribute="personal" enctype="multipart/form-data">
									<label class="d-flex justify-content-end mandatory mt-0 mb-0">* must be filled</label>
					  				<div class="row mt-2 mb-0">
					  					<s:hidden path="id" id="id" value="${pv.id }"/>
										<div class="col-sm-12 col-md-6 col-lg-3" hidden="true">
											<div class="md-form mt-0">
												<s:input path="user_ref" id="user_ref" value="${pv.user_ref.user_id }" cssClass="form-control" autofocus="autofocus"/>
												<label for="User ID">User Id</label>
												<s:errors path="user_ref" cssClass="error" />
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<input name="name" id="name" value="${pv.user.name }" class="text-capitalize form-control" autofocus="autofocus" />
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
												<s:input path="email" id="email" value="${pv.user.email }" cssClass="form-control" autofocus="autofocus"/>
												<label for="Email">Email<span class="mandatory"> *</span></label>
												<s:errors path="email" cssClass="error" />
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<s:input path="mobile" id="mobile" maxlength="10" placeholder="9876543210" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="${pv.mobile }" cssClass="form-control" autofocus="autofocus" />
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
												<s:input type="date" path="dob" id="dob" placeholder="yyyy-mm-dd" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"  oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" value="${pv.dob }" cssClass="form-control" autofocus="autofocus"  />
												<label for="dob">Date Of Birth<span class="mandatory"> *</span></label>
												<s:errors path="dob" cssClass="error" />
											</div>
										</div>
										<div class="col-sm-12 col-md-6 col-lg-3">
											<div class="md-form mt-3">
												<s:input path="place_of_birth" id="place_of_birth" value="${pv.place_of_birth }" cssClass="form-control" autofocus="autofocus"  />
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
										<div class="col-sm-12 col-md-6 col-lg-3 mt-3">
											<label for="Image Upload" class="mb-1">Upload Image<span class="mandatory"> *</span></label>
											<input type="file" name="image" id="image" class="" />
										</div>
									</div>
									
									<!-- Row 4 -->
									<div class="d-flex justify-content-end mt-0">
										<input type="reset" class="btn-custom px-3 py-1" value="Cancel">
										<input type="submit" class="btn-custom px-3 py-1" value="Update">
									</div>
					  			</s:form>		
					  		</div>	
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
			$(document).ready(function(){
				var designation = $('#designation');
	            $.ajax({
	                type:'GET',
	                url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllDesignation",
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
	                url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllBlood",
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
	                url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllLanguage",
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
	                url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllReligion",
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
	                url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllCommunity",
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
					url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllCountry",
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
					url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllCountry",
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
	                    var pre = "https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllStateByCountryId/";
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
	                    var pre = "https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllDistrictByStateId/";
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
					url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllCountry",
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
					url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllState",
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
					url:"https://ec2-54-247-71-245.eu-west-1.compute.amazonaws.com:5432/api/getAllDistrict",
					async:true,
					success:function(result){
						var output = "<option selected disabled> -- Select -- </option>";
						for(var i in result){
							output+="<option value="+result[i].id+">" + result[i].name + "</option>";
						}
						editdistrict.html(output);
					}
	            });
			});
		</script>
	</body>
</html>