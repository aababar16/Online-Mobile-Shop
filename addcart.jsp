<%@page import="com.mobile.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%
DataAccess db=new DataAccess();
Object id=session.getAttribute("item_id");
if(id!=null){
	ResultSet rs=db.getRows("select * from Product where ProductId=?", id);
	rs.next();
	String pid=rs.getString(1);
	String pname=rs.getString(2);
	double price=rs.getDouble(4);
	int qty=1;
	double total=price*qty;
	String pimg=rs.getString(5);
	String user=session.getAttribute("user")+"";
	db.executeSql("Insert into cart (ProductId,ProductName,Price,Qty,Total,ProductImage,UserName) values(?,?,?,?,?,?,?)", pid,pname,price,qty,total,pimg,user);
	response.sendRedirect("cart.jsp");
}else{
	id=request.getParameter("item_id");
	if(id!=null){
		ResultSet rs=db.getRows("select * from Product where ProductId=?", id);
		rs.next();
		String pid=rs.getString(1);
		String pname=rs.getString(2);
		double price=rs.getDouble(4);
		int qty=1;
		double total=price*qty;
		String pimg=rs.getString(5);
		String user=session.getAttribute("user")+"";
		db.executeSql("Insert into cart (ProductId,ProductName,Price,Qty,Total,ProductImage,UserName) values(?,?,?,?,?,?,?)", pid,pname,price,qty,total,pimg,user);
		response.sendRedirect("cart.jsp");
	}
}
%>