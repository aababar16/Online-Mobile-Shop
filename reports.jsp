<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<style>
a{
color:black;
}
</style>
<%

if(request.getParameter("btn1")!=null){
	String gg=request.getParameter("gid");
	if(!gg.trim().equals("")){
		String ss[]=gg.split(":");
		session.setAttribute("cond","GroupId="+ss[0]);
		session.setAttribute("title","Members of Bachat Group "+ss[1]);
		session.setAttribute("rpt","rptmembers");
		out.println("<script>window.open('report2.jsp','__blank');</script>");
	}
}

%>

<!-- Display Report links list -->
<div class="container">
<h2>Select Report to display</h2>
<ul class="list-group">
<li class="list-group-item active"><a style="color:white" href="#">Reports</a></li>
<li class="list-group-item"><a target="__blank" href="report1.jsp?page=rptbachatgroup">Registered Bachat Group</a></li>
<li class="list-group-item"><a target="__blank" href="report1.jsp?page=rptfeedback">Users Feedback</a></li>

<li class="list-group-item">
<form method="post">
	<select id="gid" name="gid" style="width:300px">
	<option value="">--Select Bachat Gat--</option>		
		<%
		ResultSet rs=db.getRows("select * from Bachatgroup");
		
		while(rs.next()){
		%>
		<option value="<%=rs.getString("GroupId")+":"+rs.getString("BachatGroupName") %>"><%=rs.getString("BachatGroupName")%></option>
		<%
		}
		%>
	</select>	
    &nbsp;
    <input type="submit" name="btn1" value="Show Bachat Group Members Report"/>

</form>

</li>
</ul>
</div>
<%@include file="footer.jsp" %>
