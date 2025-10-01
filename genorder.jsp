<%@page import="com.mobile.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
DataAccess db=new DataAccess();
if(request.getParameter("user")!=null){
	String u=request.getParameter("user");
	session.setAttribute("user", u);
}
String user=session.getAttribute("user")+"";
String cdatetime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a").format(new Date());
ResultSet rs=db.getRows("select sum(total) from cart where UserName=?", user);
double ordertotal=0;
if(rs.next()){
	ordertotal=rs.getDouble(1);
}
String orderstatus="Pending";
int id=db.executeSqlId("Insert into Orders (OrderDateTime,UserName,OrderAmt,OrderStatus) values(?,?,?,?)",cdatetime,user,ordertotal,orderstatus);
rs=db.getRows("select * from cart where UserName=?", user);
while(rs.next()){
	db.executeSql("Insert into OrdersItems (OrderId,ProductId,ProductName,Price,Qty,Total) values(?,?,?,?,?,?)",id,rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
}
db.executeSql("delete from Cart where UserName=?",user);
response.sendRedirect("showorder.jsp?id="+id);
%>