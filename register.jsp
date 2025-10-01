<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mobile.db.SendMail"%>
<%@ include file="header.jsp" %>
<%
String name="";
String address="";
String mobile="";
String user="";
String pass="";
String secq="";
String seca="";

if(request.getParameter("btnsign")!=null){
	
	name=request.getParameter("name");
	address=request.getParameter("address");
	mobile=request.getParameter("mobile");
	user=request.getParameter("emailid");
	pass=request.getParameter("pass");
	secq=request.getParameter("secq");
	seca=request.getParameter("seca");
	int id=db.executeSqlId("Insert into Users (EmailID,Password,SecQ,SecA,UserType) values(?,?,?,?,?)", user,pass,secq,seca,"Customer");
	//SendMail.send(user, "Registration Successful", "hi "+user+",<p>Welcome to Online Krishi Seva Kendra</p>");
	db.executeSql("Insert into Profile (UserId,Name,Address,MobileNo) values(?,?,?,?)",id,name,address,mobile);
	session.setAttribute("userid", id);
	session.setAttribute("user", user);
	session.setAttribute("name", name);
	session.setAttribute("utype", "Customer");	
	response.sendRedirect("customer.jsp");
}
%>		
<div class="container mt-5">
<div class="row justify-content-center">	
<div class="col-5">	
<div class="card">	
<div class="card-header bg-primary">
	<h4 class="text-white">New Registration</h4>
</div>		
<div class="card-body">
<form name="form1" id="form1" method="post">
<div class="form-group">
	Your Name
	<input type="text" name="name" id="name" class="form-control"/>
</div>
<div class="form-group">
	Your Address
	<input type="text" name="address" id="address" class="form-control"/>
</div>
<div class="form-group">
	Your Mobile No
	<input type="text" name="mobile" id="mobile" class="form-control"/>
</div>
<div class="form-group">
	Email ID/UserName
	<input type="text" name="emailid" id="emailid" class="form-control" autocomplete="off" />
</div>
<div class="form-group">
	Password
	<input type="password" name="pass" id="pass" class="form-control"/>
</div>
<div class="form-group">
	Confirm Password
	<input type="password" name="cpass" id="cpass" class="form-control"/>
</div>
<div class="form-group">
	<label>Security Question</label><br>
	<select name="secq" id="secq" class="form-select">
		<option value="What is your last name?">What is your last name?</option>
		<option value="What is your birthdate?">What is your birthdate?</option>
		<option value="What is your favourite food?">What is your favourite food?</option>
	</select><br>
</div>
<div class="form-group">
	<br>Security Answer
	<input type="text" name="seca" id="seca" class="form-control"/>
</div>

<div class="form-group">	
	<br>
	<input type="submit" name="btnsign" class="btn btn-primary float-end" value="Register"/>
</div>
</form>	
</div>
</div>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>
<script>	
$(function(){
	$("#form1").validate({
		rules:{			
			name:{
				required:true,
				pattern:/^[A-Za-z ]+$/
			},
			address:{
				required:true
			},
			mobile:{
				required:true,
				pattern:/^\d{10}$/
			},
			emailid:{
				required:true,
				email:true
			},
			pass:{
				required:true
			},
			cpass:{
				required:true,
				equalTo:"#pass"
			},
			seca:{
				required:true
			}
		},
		messages:{			
			name:{
				required:"Customer Name is required",
				pattern:"Customer Name allows only chars and spaces"
			},
			address:{
				required:"Customer Address is required"
			},
			mobile:{
				required:"Mobile No is required",
				pattern:"Mobile No allows only 10 digits"
			},
			emailid:{
				required:"Email ID is Required",
				email:"Invalid Email ID"
			},
			pass:{
				required:"Password is required"
			},
			cpass:{
				required:"Confirm Password Required",
				equalTo:"Password Mismatch"
			},
			seca:{
				required:"Security Answer required"
			}

		}
	});
});
</script>	