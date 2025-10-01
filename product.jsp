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
String name="";
String brand="";
String price="";
String id="[auto]";
String fname="";

%>
<div class="container">

<h1 id="heading">Product List</h1>
<a href="addproduct.jsp" class="btn btn-success float-end">Add New Product</a>
<br>
<br>
<table id="tb" class="table table-bordered">
	<thead>
	<tr class="bg-primary text-white">
		<td>Product ID</td>
		<td>Product Name</td>
		<td>Product Brand</td>
		<td>Product Price</td>		
		<td>Image</td>
		<td>Actions</td>		
	</tr>
	</thead>
	<tbody>
	<%
	ResultSet rs=db.getRows("select * from Product");
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>		
		<td>
		<img src="<%=rs.getString(5) %>" width="60" height="60" alt="NA" class="rounded"/>
		</td>		
		<td class="text-nowrap">
		<a href="?eid=<%=rs.getString(1) %>" class="btn btn-info">Edit</a>
		<a href="#" onclick="confirm_delete(<%=rs.getString(1) %>);" class="btn btn-danger">Delete</a>
		</td>
	</tr>		
	<%
	}
	%>
	</tbody>
</table>
</div>

<%@ include file="footer.jsp" %>
<script>
	$(function(){
		$("#tb").DataTable();
	});
</script>	