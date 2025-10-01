<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<div class="container">
<br>
<h3 id="heading">Users Feedback</h3>
<hr>
<br>
<br>
<table id="tb" class="table table-bordered">
	<thead>
	<tr class="bg-primary text-white">
		<td>Id</td>
		<td>Date/time</td>
		<td>Message</td>
		<td>Name</td>
		<td>Email ID</td>	
		<td>Subject</td>					
	</tr>
	</thead>
	<tbody>
	<%
	ResultSet rs=db.getRows("select * from Feedback");
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td class="text-nowrap"><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>			
		<td><%=rs.getString(6) %></td>	
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