<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="header.jsp" %>
<%
if(request.getParameter("btn")!=null){
	String ms=request.getParameter("msg");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String fdatetime=new SimpleDateFormat("yyyy-MM-dd hh:mm a").format(new Date());
	//System.out.println(request.getParameter("btn").equals("Save"));
	
	db.executeSql("Insert into feedback (FdateTime,Message,Name,EmailId,Subject) values(?,?,?,?,?)", fdatetime,ms,name,email,subject);
	msg="Your Feedback is submitted successfully";
}
%>
<div class="container mt-5">
<div class="row justify-content-center">	
<div class="col-8">	
<div class="card">	
<div class="card-header bg-primary">
	<h4 class="text-white">Feedback Form</h4>
</div>		
<div class="card-body">
<form name="form1" id="form1" method="post">
<div class="row">
<div class="col-12">	
<div class="form-group">
<textarea class="form-control w-100" name="msg" id="msg" cols="30" rows="9" placeholder="Enter Message"></textarea>
</div>
</div>
<div class="col-sm-6">
<div class="form-group">
<input class="form-control valid" name="name" id="name" type="text" placeholder="Enter your name">
</div>
</div>
<div class="col-sm-6">
<div class="form-group">
<input class="form-control valid" name="email" id="email" type="email" placeholder="Email">
</div>
</div>
<div class="col-12">
<div class="form-group">
<input class="form-control" name="subject" id="subject" type="text" placeholder="Enter Subject">
</div>
</div>

</div>
<div class="form-group mt-3">
<button type="submit" class="button button-contactForm boxed-btn" name="btn">Send</button>
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
			msg:{
				required:true
			},
			name:{
				required:true
			},
			email:{
				required:true,
				email:true
			},
			subject:{
				required:true
			}
		},
		messages:{
			msg:{
				required:"Message is Required"
			},
			name:{
				required:"Name is Required"
			},
			email:{
				required:"Email ID is Required",
				email:"Invalid Email ID"
			},
			subject:{
				required:"Subject is required"
			}

		}
	});
});
</script>	