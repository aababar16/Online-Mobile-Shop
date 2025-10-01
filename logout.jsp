<%
session.setAttribute("user", null);
session.setAttribute("utype", "");
session.invalidate(); //destroy session data
response.sendRedirect("login.jsp");
%>