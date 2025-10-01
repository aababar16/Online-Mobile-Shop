<%@page import="java.sql.ResultSet"%>
<%@page import="com.mobile.db.DataAccess"%>
<%@ include file="header.jsp"%>

<%
if(request.getParameter("btnlogin")!=null){
	String old=request.getParameter("t1");
	String new1=request.getParameter("t2");
	String new2=request.getParameter("t3");
	
	
	ResultSet rs=db.getRows("select * from Users where UserId=? and Password=?",session.getAttribute("userid"),old);
	if(!rs.next())
	{
		msg="Please enter valid old password";
		
	}
	else
	{
		if(!new1.equals(new2))
		{
			msg="New Password Mismatch";
		}
		else
		{
			db.executeSql("Update Users set Password=? where UserId=?",new1,session.getAttribute("userid"));
			msg="Password changed successfully...";
		}
		
	
	}
}
%> 




<div class="container pt-5 pb-5 w-50 mx-auto">
<br>
<br>
<form id="form1" method="post">
  <fieldset>
    <legend>Change Your Password</legend>    
    
    <div class="form-group">
      <label for="t1">Old Password</label>
      <input type="password" class="form-control" name="t1" id="t1" placeholder="Old Password">
    </div>
    <div class="form-group">
      <label for="t2">New Password</label>
      <input type="password" class="form-control" name="t2" id="t2" placeholder="New Password">
    </div>
    <div class="form-group">
      <label for="t3">Old Password</label>
      <input type="password" class="form-control" name="t3" id="t3" placeholder="Confirm New Password">
    </div>
    <br>
        <button type="submit" name="btnlogin" class="btn btn-primary float-right">Change Password</button>
  </fieldset>
  <%=msg %>
</form>
</div>

<%@ include file="footer.jsp"%>

<script>
$(document).ready(function(){
	$("#form1").validate({
		rules:{
			t1:{
				required:true
			},
			t2:{
				required:true
			},
			t3:{
				required:true,
				equalTo:"#t2"
			}
			
		},
		messages:{
			t1:{
				required:"Old Password is Required"
			},
			t2:{
				required:"New Password is Required"
			},
			t3:{
				required:"Confirm New Password is Required",
				equalTo:"Password Mismatch"
			}
		}
		
	});
	
});
</script>