<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<div class="container">
<br>
<h3 id="heading">Registered Customers List</h3>
<hr>
<br>
<br>
<table id="tb" class="table table-bordered">
	<thead>
	<tr class="bg-primary text-white">
		<td>UserId</td>
		<td>Name</td>
		<td>Address</td>
		<td>Mobile No</td>
		<td>Email ID</td>
		<td>Join Date</td>
		<td>Adhar No</td>
		<td>Pan No</td>							
	</tr>
	</thead>
	<tbody>
	<%
	ResultSet rs=db.getRows("select * from vw_users");
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td class="text-nowrap"><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>			
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>	
		<td><%=rs.getString(8) %></td>
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