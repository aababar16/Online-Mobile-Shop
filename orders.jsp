<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>

<%
if(request.getParameter("did")!=null){
	String did=request.getParameter("did");
	db.executeSql("delete from Orders where Id=?",did);
	msg="Order is cancelled succesfully...";
}
%>
<div class="container">

<h1 id="heading">Orders History</h1>
<br>
<table id="tb" class="table table-bordered">
	<thead>
	<tr class="bg-primary text-white">
		<td>Order No</td>
		<td>Order Date Time</td>
		<td>UserName</td>
		<td>Order Amount</td>
		<td>OrderStatus</td>				
		<td>Actions</td>		
	</tr>
	</thead>
	<tbody>
	<%
	ResultSet rs=db.getRows("select * from Orders where UserName=?", session.getAttribute("user"));
	while(rs.next()){
	%>	
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td class="text-nowrap">		
		<a href="showorder.jsp?id=<%=rs.getString(1) %>"  class="btn btn-info">View Order</a>
		<a href="#" onclick="confirm_delete(<%=rs.getString(1) %>);" class="btn btn-danger">Cancel</a>
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