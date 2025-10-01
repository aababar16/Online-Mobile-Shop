<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<div class="row">
<div class="col-3">
	<div class="list-group">
	  <a href="#" class="list-group-item list-group-item-action active">Categories</a>
	  <a href="?cid=All" class="list-group-item list-group-item-action">All Products</a>
	
	<%
	ResultSet rs=db.getRows("select * from Category");
	while(rs.next()){
	%>	
	  <a href="?cid=<%=rs.getString(1) %>" class="list-group-item list-group-item-action"><%=rs.getString(2) %></a>
	
	<%
	}
	%>	
	</div>	
</div>

<div class="col-9">
<div class="row">
	<%
	
	ResultSet rs2=db.getRows("select * from Vw_Product");
	if(request.getParameter("cid")!=null){
		if(request.getParameter("cid").equals("All"))
			rs2=db.getRows("select * from Vw_Product");
		else
			rs2=db.getRows("select * from Vw_Product where CategoryId=?",request.getParameter("cid"));
	}	
	while(rs2.next()){
	%>	
<div class="col-4">	
<div class="card mb-3">
  <h5 class="card-header"><%=rs2.getString(2) %></h5>
  <img src="product_image/<%=rs2.getString(7) %>" width="100%" height="200" alt="NA"/>    
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><strong>Price:</strong> Rs. <%=rs2.getString(6) %> </li>
    <li class="list-group-item"><strong>Unit:</strong> <%=rs2.getString(5) %> </li>
    <li class="list-group-item"><strong>Category:</strong> <%=rs2.getString(4) %> </li>        

  </ul>
  <div class="card-body">
  	<%
  	if(session.getAttribute("user")!=null){
  	%>
  	<a href="addcart2.jsp?id=<%=rs2.getString(1) %>" class="btn btn-primary">Add To Cart</a>
  	<%
  	}else{
  	%>
  	<a href="login.jsp?id=<%=rs2.getString(1) %>" class="btn btn-primary">Add To Cart</a>
	<%
  	}
	%>    
  </div>  
</div>
</div>
<%
	}
%>
</div>	

</div>
</div>



<%@ include file="footer.jsp" %>