<%@page import="com.mobile.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%
if(request.getParameter("id")!=null){
	session.setAttribute("item_id", request.getParameter("id"));
	response.sendRedirect("addcart.jsp");
}

%>