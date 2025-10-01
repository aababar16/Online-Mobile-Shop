<%@page import="java.sql.ResultSet"%>
<%@page import="com.mobile.db.SendMail"%>
<%@ include file="header.jsp" %>
<%
if(request.getParameter("btnrecover")!=null){
	String user=request.getParameter("user");
	String secq=request.getParameter("secq");
	String seca=request.getParameter("seca");
	ResultSet rs=db.getRows("select * from Users where EmailID=? and Secq=? and SecA=?",user,secq,seca);
	if(rs.next()){
		System.out.println("Your Password: "+rs.getString("Password"));
		//SendMail.send(user, "Your Password", "Hi<br>Your Password: "+rs.getString("Password")+"<br>Please keep it safe");
		msg="Your Password sent to your email";
	}else{		
		msg="Invalid Information...try again";
	}
}
	
%>

<div class="container mt-5">
<div class="row justify-content-center">	
<div class="col-5">	
<div class="card">	
<div class="card-header bg-primary">
	<h4 class="text-white">Password Recovery Form</h4>
</div>		
<div class="card-body">
<form name="form1" id="form1" method="post">
<div class="form-group">
	UserName/EmailID
	<input type="text" name="user" id="user" class="form-control"/>
</div>
<div class="form-group">
	Security Questions
	<select name="secq" id="secq" class="form-select">
		<option value="What is your last name?">What is your last name?</option>
		<option value="What is your birthdate?">What is your birthdate?</option>
		<option value="What is your favourite food?">What is your favourite food?</option>
	</select>
</div>
<div class="form-group">
	Security Answer
	<input type="text" name="seca" id="seca" class="form-control"/>
</div>
<div class="form-group">	
	<br>
	<input type="submit" name="btnrecover" class="btn btn-primary float-end" value="Submit"/>
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
			pass:{
				required:true
			},
			pass1:{
				required:true
			},
			pass2:{
				required:true,
				equalTo:"#pass1"
			}
		},
		messages:{
			pass:{
				required:"Old Password is required"
			},
			pass1:{
				required:"New Password is required"
			},
			pass2:{
				required:"Confirm New Password is required",
				equalTo:"New password Mismatch"
			}

		}
	});
});
</script>	