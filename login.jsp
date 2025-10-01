<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<%
if(request.getParameter("id")!=null){
	session.setAttribute("id",request.getParameter("id") );
}
if(request.getParameter("btnlogin")!=null){
	String user=request.getParameter("emailid");
	String pass=request.getParameter("pass");
	ResultSet rs=db.getRows("select * from Users where EmailID=? and Password=?", user,pass);
	if(rs.next()){
		session.setAttribute("user", user);
		session.setAttribute("utype", rs.getString("UserType"));
		System.out.println(rs.getString("UserType"));
		String uid=rs.getString(1);
		session.setAttribute("userid",uid);
		if(rs.getString("UserType").equals("Admin")){
			response.sendRedirect("admin.jsp");
		}else if(rs.getString("UserType").equals("Customer")){
			rs=db.getRows("select * from Profile where UserId=?", uid);
			if(rs.next()){				
				session.setAttribute("membername",rs.getString("Name"));
				}
			if(session.getAttribute("id")!=null){
				String id=session.getAttribute("id")+"";
				session.removeAttribute("id");
				response.sendRedirect("addcart2.jsp?id="+id);
				
			}else{
			response.sendRedirect("customer.jsp");
			}
			
		}
	}else{
		msg="Login is Failed.. try again..";
	}
}

%>

<!-- start login -->
<section class="login">
    <div class="main py-3">
        <!-- log in -->
        <form method="POST" class="form" id="sign-in">            
                <h3 class="heading">Sign in</h3>
                <p class="desc">Log in to enjoy exclusive offers for you!</p>
                <div class="row" style="width: 400px;">
                    <div class="col">
                        <div class="form-group">
                            <label for="emailid" class="form-label">Username (*)</label>
                            <input id="emailid" name="emailid" type="text" rules="required|min:3|max:10"
                                placeholder="EmailID/UserName" class="form-control">
                            <span class="form-message"></span>
                        </div>

                        <div class="form-group">
                            <label for="pass" class="form-label">Password (*)</label>
                            <input id="pass" name="pass" type="password" rules="required|min:3"
                                placeholder="Password" class="form-control">
                            <span class="form-message"></span>
                        </div>
                    </div>
                </div>

                <button class="form-submit" type="submit" name="btnlogin" value="Sign in">Sign in</button>
                <p class="desc">Don't have an account? <a href="./register.jsp">Sign up</a></p>
            
        </form>

    </div>
</section>
<!-- !start login -->

