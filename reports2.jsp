<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<style>
a{
color:black;
}
</style>
<%

if(request.getParameter("btn1")!=null){	
	String sdate=request.getParameter("sdate");
	String edate=request.getParameter("edate");	
	
	session.setAttribute("cond","EDate between '"+sdate+"' and '"+edate+"'");
	session.setAttribute("title",sdate+" to "+edate);
	session.setAttribute("rpt","rptexpenses");
	out.println("<script>window.open('report2.jsp','__blank');</script>");
	
}
if(request.getParameter("btn2")!=null){	
	String sdate=request.getParameter("sdate");
	String edate=request.getParameter("edate");
	
	
	session.setAttribute("cond","TransDate between '"+sdate+"' and '"+edate+"'");
	session.setAttribute("title",sdate+" to "+edate);
	session.setAttribute("rpt","rptbank");
	out.println("<script>window.open('report2.jsp','__blank');</script>");
	
}
if(request.getParameter("btn3")!=null){	
	session.setAttribute("rpt","rptfeedback");
	out.println("<script>window.open('report2.jsp','__blank');</script>");
	
}
if(request.getParameter("btn4")!=null){	
	session.setAttribute("rpt","rptcustomers");
	out.println("<script>window.open('report2.jsp','__blank');</script>");
	
}
if(request.getParameter("btn5")!=null){	
	session.setAttribute("rpt","rptorders");
	out.println("<script>window.open('report2.jsp','__blank');</script>");
	
}
if(request.getParameter("btn6")!=null){	
	session.setAttribute("rpt","rptproducts");
	out.println("<script>window.open('report2.jsp','__blank');</script>");
	
}
%>

<!-- Display Report links list -->
<div class="container">
<h2>Select Report to display</h2>
<ul class="list-group">
<li class="list-group-item active"><a style="color:white" href="#">Reports</a></li>

<li class="list-group-item">
<form method="post">	
	From <input type="date" name="sdate"/> To <input type="date" name="edate"/> &nbsp; &nbsp;
    <input type="submit" name="btn1" value="Expenses Report"/>

</form>
</li>
<li class="list-group-item">
<form method="post">	
	From <input type="date" name="sdate"/> To <input type="date" name="edate"/> &nbsp; &nbsp;
    <input type="submit" name="btn2" value="Bank Transaction Report"/>

</form>
</li>
<li class="list-group-item">
<form method="post">	
    <input type="submit" name="btn3" value="Feedback List Report"/>
</form>
</li>
<li class="list-group-item">
<form method="post">	
    <input type="submit" name="btn4" value="Members List Report"/>
</form>
</li>
<li class="list-group-item">
<form method="post">	
    <input type="submit" name="btn5" value="Orders History"/>
</form>
</li>
<li class="list-group-item">
<form method="post">	
    <input type="submit" name="btn6" value="Products List"/>
</form>
</li>

</ul>
</div>
<%@include file="footer.jsp" %>
