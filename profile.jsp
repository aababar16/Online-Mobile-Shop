<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@ include file="header.jsp" %>
<%
String path=request.getRealPath("/member_image/"); // / means root folder and uploads
%>  
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%=path%>" />
</jsp:useBean>   
<%
String name="";
String address="";
String emailid="";
String mobile="";
String jdate="";
String adhar="";
String pan="";
String photopath="";
String btnval="Save";

if (MultipartFormDataRequest.isMultipartFormData(request))
{
   // Uses MultipartFormDataRequest to parse the HTTP request.
   MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
   
	if(mrequest.getParameter("btnprofile")!=null)
	{
	
	name=mrequest.getParameter("name");
	address=mrequest.getParameter("address");
	emailid=mrequest.getParameter("emailid");
	mobile=mrequest.getParameter("mobile");
	jdate=mrequest.getParameter("jdate");
	adhar=mrequest.getParameter("adhar");
	pan=mrequest.getParameter("pan");
	
	//upload file to server
	photopath="";
	Hashtable files = mrequest.getFiles();		
    if ( (files != null) && (!files.isEmpty()) )
    {
        UploadFile file = (UploadFile) files.get("file");
        photopath=file.getFileName();
        System.out.println(photopath);
        if(photopath!=null && !photopath.equals("")){
        
        	upBean.store(mrequest, "file");            
        }
    }else{       
    ResultSet rs=db.getRows("select * from Profile where userId=?",session.getAttribute("userid"));
	if(rs.next()){
		if(photopath==null || photopath.equals("")){
			photopath=rs.getString("Photo");
		}
	}
    }
	//update
	db.executeSql("Update Profile set Name=?,Address=?,MobileNo=?,JoinDate=?,AdharNo=?,PanNo=?,Photo=? where userId=?",name,address,mobile,jdate,adhar,pan,photopath,session.getAttribute("userid"));	
	msg="Your Profile is updated successfully...";
	
	}
	
	
}else{
	ResultSet rs=db.getRows("select * from Profile where UserId=?",session.getAttribute("userid"));
	if(rs.next()){
		name=rs.getString("Name");
		address=rs.getString("Address");		
		mobile=rs.getString("MobileNo");
		jdate=rs.getString("JoinDate");
		adhar=rs.getString("AdharNo");
		pan=rs.getString("PanNo");
		photopath=rs.getString("Photo");
		
		rs=db.getRows("select * from Users where UserId=?",session.getAttribute("userid"));
		if(rs.next()){
			emailid=rs.getString("EmailID");			
		}
			
	}
}
%>
<div class="container mt-5">
<div class="row justify-content-center">	
<div class="col-5">	
<div class="card">	
<div class="card-header bg-primary text-white">
	<h4 class="text-white">Update Customer Profile</h4>
</div>		
<div class="card-body">
<form name="form1" id="form1" method="post" enctype="multipart/form-data">
<div class="form-group">
Upload Image
<input type="file" name="file" id="file" class="form-control"/>
<br>
<img src="member_image/<%=photopath%>" width="100" height="100" alt="NA" class="rounded"/>
</div>
<div class="form-group">
	Your Name
	<input type="text" name="name" id="name" class="form-control" value="<%=name %>"/>
</div>
<div class="form-group">
	Address
	<input type="text" name="address" id="address" class="form-control"  value="<%=address %>"/>
</div>
<div class="form-group">
	Mobile No
	<input type="text" name="mobile" id="mobile" class="form-control" value="<%=mobile %>"/>
</div>
<div class="form-group">
	Join Date
	<input type="date" name="jdate" id="jdate" class="form-control"  value="<%=jdate%>"/>
</div>
<div class="form-group">
	Aadhar No
	<input type="text" name="adhar" id="adhar" class="form-control" value="<%=adhar %>"  />
</div>
<div class="form-group">
	Pan Card No
	<input type="text" name="pan" id="pan" class="form-control" value="<%=pan %>"  />
</div>
<div class="form-group">	
	<br>
	<input type="submit" name="btnprofile" class="btn btn-primary float-end" value="Update Profile"/>
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
			jdate:{
				required:true
			},			
			adhar:{
				required:true,
				pattern:/^\d{12}$/
			},
			pan:{
				required:true
			}
			
		},
		messages:{
			name:{
				required:"Name is required",
				pattern:"Name allows only chars and spaces"
			},
			address:{
				required:"Address is required"
			},
			mobile:{
				required:"Mobile No is required",
				pattern:"Mobile No allows 10 digits"
			},			
			jdate:{
				required:"Join Date No is required"
			},
			adhar:{
				required:"Aadhar No is required",
				pattern:"Aadhar No allows 12 digits"
			},
			pan:{
				required:"Pan Card No is required"
			},

		}
	});
});
</script>	