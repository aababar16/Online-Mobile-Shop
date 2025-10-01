<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@ include file="header.jsp" %>
<%
String path=request.getRealPath("/assets/products/"); // / means root folder and uploads
%>  
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%=path%>" />
</jsp:useBean>   
<%
String id="[auto]";
String name="";
String brand="";
String price="";
String fname="";
String btnval="Save";

if (MultipartFormDataRequest.isMultipartFormData(request))
{
   // Uses MultipartFormDataRequest to parse the HTTP request.
   MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
   
	if(mrequest.getParameter("btnsave")!=null)
	{
		id=mrequest.getParameter("id");
		name=mrequest.getParameter("name");
		brand=mrequest.getParameter("brand");
		price=mrequest.getParameter("price");
	
		//upload file to server
				
				Hashtable files = mrequest.getFiles();		
		        if ( (files != null) && (!files.isEmpty()) )
		        {
		            UploadFile file = (UploadFile) files.get("file");
		            fname=file.getFileName();
		            
		            upBean.store(mrequest, "file");            
		        }       
	if(mrequest.getParameter("btnsave").equals("Save")){
		
		db.executeSql("Insert into Product (ProductName,brand,Price,ProductImage) values(?,?,?,?)", name,brand,price,fname);
	
		msg="New Product is Added Successfully";	
	
	}else{
		if(fname!=null && !fname.equals("")){
	
		db.executeSql("update Product set ProductName=?,brand=?,Price=?,ProductImage=? where ProductId=?", name,brand,price,fname,id);
		}else{
			db.executeSql("update Product set ProductName=?,brand=?,Price=? where ProductId=?", name,brand,price,id);
		}
		msg="Product is Updated Successfully";
	}
	
	}	
}
else{
if(request.getParameter("did")!=null){
		String r=request.getParameter("did");
		db.executeSql("delete from Product where Id=?", r);
		msg="Product Information is Deleted...";
	}
	if(request.getParameter("eid")!=null){
		String r=request.getParameter("eid");
		ResultSet rs=db.getRows("select * from Product where Id=?",r);
		rs.next();
		
		id=rs.getString(1);
		name=rs.getString(2);
		brand=rs.getString(3);
		price=rs.getString(4);		
		fname=rs.getString(5);				
		btnval="Update";
	}
	
}
%>
<div class="container">

<div class="card">
<div class="card-header bg-primary text-white">
	<h4 class="text-white">Product Entry Form</h4>
</div>	
<div class="card-body">
<form method="post" id="form1" enctype="multipart/form-data" >
<table class="table table-bordered">
	<tr>
		<td>Product ID</td>
		<td><input type="text" name="id" id="id"  class="form-control" value="<%=id %>" placeholder="Product Id"   readonly />
		
		</td>
	</tr>
	<tr>
		<td>Product Name</td>
		<td><input type="text" name="name" id="name" class="form-control" value="<%=name %>" placeholder="Product Name" autofocus />		
		</td>
	</tr>
	<tr>
		<td>Product Brand</td>
		<td>
		<select class="form-select" id="brand" name="brand">
		<option value="">-- Select Brand --</option>
		<%
		ResultSet rs=db.getRows("select * from brand");
		while(rs.next()){
		%>
		<option <%=brand.equals(rs.getString("Id"))?"selected":""%> value="<%=rs.getString("Id") %>"><%=rs.getString("BrandName")%></option>
		<%
		}
		%>
	</select>			
		</td>
	</tr>
	<tr>
		<td>Product Price</td>
		<td><input type="text" name="price" id="price" class="form-control" value="<%=price %>" placeholder="Product Price" />		
		</td>
	</tr>	
	<tr>
		<td>Product Image</td>
		<td>
			<img src="assets/products/<%=fname%>" width="60" height="60" alt="NA" class="rounded"/>
			<input type="file" name="file" id="file" class="form-control"  />
		
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input type="submit" name="btnsave" value="<%=btnval %>"  class="btn btn-success"/>
			
			<a href="product.jsp" class="btn btn-secondary">Reset</a>			
		</td>
	</tr>
</table>
</form>
</div></div>
</div>
<%@ include file="footer.jsp" %>
<script>	
$(function(){
	$("#form1").validate({
		rules:{
			name:{
				required:true
			},
			price:{
				required:true,
				pattern:/^\d+(\.\d{2})?$/
			},
			brand:{
				required:true
			}
			
		},
		messages:{
			name:{
				required:"Name is required"
			},
			price:{
				required:"Price required",
				pattern:"Invalid Price"
			},
			brand:{
				required:"Please select brandegory"
			}

		}
	});
});
</script>	