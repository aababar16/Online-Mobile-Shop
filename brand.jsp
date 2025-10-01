<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>

<%
String id="[auto]";
String name="";
String comp="";
String head="";
String btnval="Save";

if(request.getParameter("btn")!=null){
	id=request.getParameter("id");
	name=request.getParameter("name");
	comp=request.getParameter("comp");
	head=request.getParameter("head");
	
	
	if(request.getParameter("btn").equals("Save")){
		db.executeSql("insert into Brand (BrandName,Company,HeadQuarter) values(?,?,?)", name,comp,head);
		msg="Brand Information is saved successfully...";
	}else{
		db.executeSql("update Brand set BrandName=?,Company=?,HeadQuarter=? where Id=?", name,comp,head,id);
		msg="Brand Information is updated successfully...";
	}
}else{
	if(request.getParameter("did")!=null){
		String r=request.getParameter("did");
		db.executeSql("delete from Brand where Id=?",r);
		msg="Brand Information is Deleted...";
	}
	if(request.getParameter("eid")!=null){
		String r=request.getParameter("eid");
		ResultSet rs=db.getRows("select * from Brand where Id=?", r);
		if(rs.next()){
			id=rs.getString(1);
			name=rs.getString(2);	
			comp=rs.getString(3);
			head=rs.getString(4);
			btnval="Update";
		}
		
	}
}
%>

<div class="container">

<div class="card">
<div class="card-header bg-primary text-white">
	<h4 class="text-white">Brand Entry Form</h4>
</div>	
<div class="card-body">
<form method="post" id="form1" >
<table class="table table-bordered">
	<tr>
		<td>Brand ID</td>
		<td><input type="text" name="id" id="id"  class="form-control" value="<%=id%>" placeholder="Brand Id"   readonly />
		
		</td>
	</tr>
	<tr>
		<td>Brand Name</td>
		<td><input type="text" name="name" id="name" class="form-control" value="<%=name%>" placeholder="Brand Name" autofocus />		
		</td>
	</tr>
	<tr>
		<td>Company Name</td>
		<td><input type="text" name="comp" id="comp" class="form-control" value="<%=comp%>" placeholder="Brand Name" autofocus />		
		</td>
	</tr>	
	<tr>
		<td>Head Quarter</td>
		<td><input type="text" name="head" id="head" class="form-control" value="<%=head%>" placeholder="Brand Name" autofocus />		
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input type="submit" name="btn" value="<%=btnval %>"  class="btn btn-success"/>
			
			<a href="Brand.jsp" class="btn btn-secondary">Reset</a>			
		</td>
	</tr>
</table>
</form>
</div>
</div>

<h2 id="heading">Brand List</h2>
<hr>
<table id="tb" class="table table-bordered">
	<thead>
	<tr class="bg-primary text-white">
		<td>Brand ID</td>
		<td>Brand Name</td>
		<td>Company Name</td>
		<td>Head Quarter</td>
		<td>Actions</td>		
	</tr>
	</thead>
	<tbody>
	<%
	ResultSet rs=db.getRows("select * from Brand");
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
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
<script>	
$(function(){
	$("#form1").validate({
		rules:{
			name:{
				required:true
			}
		},
		messages:{
			name:{
				required:"Brand Name is required"
			}
		}
	});
});
</script>	