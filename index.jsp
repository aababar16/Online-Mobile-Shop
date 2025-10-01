<%@ include file="header.jsp" %>
<!-- Owl-carousel -->
<section id="banner-area">
    <div class="owl-carousel owl-theme">
        <div class="item">
            <img src="./assets/banner/Banner0.png" alt="Banner0">
        </div>
        <div class="item">
            <img src="./assets/banner/Banner1.png" alt="Banner1">
        </div>
        <div class="item">
            <img src="./assets/banner/Banner2.png" alt="Banner2">
        </div>
        <div class="item">
            <img src="./assets/banner/Banner3.png" alt="Banner3">
        </div>
    </div>
</section>
<!-- !Owl-carousel -->

<!-- Top Sale -->
<%
ResultSet rs2=db.getRows("select * from vw_product");
%>

<section id="top-sale">
    <div class="container py-5">
        <h4 class="font-size-20">Top Sale</h4>
        <hr>
        <!-- owl carousel -->
        <div class="owl-carousel owl-theme">
        	<%
        	while(rs2.next()){
        	%>            
                <div class="item py-2 border rounded-2 bg-light">
                    <div class="product">
                        <a href="product.jsp?id=<%=rs2.getString(1)%>">
                            <img src="<%=rs2.getString(5) %>" alt="product1" class="img-fluid">
                        </a>
                        <div class="text-center">
                            <h6>
                                <%=rs2.getString(2) %>
                            </h6>
                            <div class="rating text-warning font-size-12">
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="far fa-star"></i></span>
                            </div>
                            <div class="price py-2">
                                <span>Rs
                                    <%=rs2.getString(4) %>
                                </span>
                            </div>
                            <form method="POST" action="addcart.jsp">
                                <input type="hidden" name="item_id" value="<%=rs2.getString(1)%>">
                                <input type="hidden" name="user_id"
                                    value="<%=session.getAttribute("user")!=null?session.getAttribute("user")+"":"" %>">
                                <%
                                ResultSet rs3=db.getRows("select ProductId from Cart where UserName=? and ProductId=?", session.getAttribute("user")+"",rs2.getString(1));
                                if(rs3.next()){
                                %>    
                                <button type="submit" disabled class="btn btn-success font-size-12">In the Cart</button>
                                <%
                                }else{
                                %>
                                <button type="submit" name="top_sale_submit" class="btn btn-warning font-size-12">Add to Cart</button>
                                <%
                                }
                                %>                              
                            </form>
                        </div>
                    </div>
                </div>
            <%
            } // closing loop 
            %>
        </div>
        <!-- !owl carousel -->
    </div>
</section>
<!-- !Top Sale -->

<!-- Special Price -->
<%
rs2=db.getRows("select distinct BrandName from vw_product");
rs2.next();
ResultSet rs3=db.getRows("select count(*) from cart where UserName=?",session.getAttribute("user")+"");
%>
<section id="special-price">
    <div class="container">
        <h4 class="font-size-20">Special Price</h4>
        <div id="filters" class="button-group text-end  font-size-16">
            <button class="btn is-checked" data-filter="*">All Brand</button>
            <button class="btn" data-filter=".<%=rs2.getString(1)%>"><%=rs2.getString(1)%></button>            
        </div>

        <div class="product-filter">
            <%
            ResultSet rs4=db.getRows("select * from vw_product");
        	while(rs4.next()){
        	%> 
                <div class="product-filter-item border <%=rs4.getString(3) %>">
                    <div class="item py-2" style="width: 200px;">
                        <div class="product">
                            <a href="product.jsp?id=<%=rs4.getString(1) %>"><img
                                    src="<%=rs4.getString(5) %>" alt="product1" class="img-fluid"></a>
                            <div class="text-center">
                                <h6>
                                    <%=rs4.getString(2) %>
                                </h6>
                                <div class="rating text-warning font-size-12">
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="far fa-star"></i></span>
                                </div>
                                <div class="price py-2">
                                    <span>Rs
                                        <%=rs4.getString(4) %>
                                    </span>
                                </div>
                                <form method="POST" action="addcart.jsp">
                                <input type="hidden" name="item_id" value="<%=rs4.getString(1)%>">
                                <input type="hidden" name="user_id"
                                    value="<%=session.getAttribute("user")!=null?session.getAttribute("user")+"":"" %>">
                                <%
                                ResultSet rs5=db.getRows("select ProductId from Cart where UserName=? and ProductId=?", session.getAttribute("user")+"",rs4.getString(1));
                                if(rs5.next()){
                                %>    
                                <button type="submit" disabled class="btn btn-success font-size-12">In the Cart</button>
                                <%
                                }else{
                                %>
                                <button type="submit" name="top_sale_submit" class="btn btn-warning font-size-12">Add to Cart</button>
                                <%
                                }
                                %>                              
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</section>
<!-- !Special Price -->

<!-- Banner Ads  -->
<section id="banner_adds">
    <div class="container py-5 text-center">
        <img src="./assets/discount.jpg" alt="banner1" class="img-fluid px-3 py-2">
        <img src="./assets/freeship.jpg" alt="banner1" class="img-fluid px-3 py-2">
    </div>
</section>
<!-- !Banner Ads  -->

<!-- New Phones -->
<%
rs2=db.getRows("select * from vw_product");
%>
<section id="new-phones">
    <div class="container">
        <h4 class="font-size-20">New Phones</h4>
        <hr>
        <!-- owl carousel -->
        <div class="owl-carousel owl-theme">
            <%
            while(rs2.next()){
            %>
                <div class="item py-2 border rounded-2 bg-light">
                <div class="product">
                <a href="product.jsp?id=<%=rs2.getString(1) %>"><img
                                    src="<%=rs2.getString(5) %>" alt="product1" class="img-fluid"></a>
                            <div class="text-center">
                                <h6>
                                    <%=rs2.getString(2) %>
                                </h6>
                                <div class="rating text-warning font-size-12">
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="far fa-star"></i></span>
                                </div>
                                <div class="price py-2">
                                    <span>Rs
                                        <%=rs2.getString(4) %>
                                    </span>
                                </div>
                                <form method="POST" action="addcart.jsp">
                                <input type="hidden" name="item_id" value="<%=rs2.getString(1)%>">
                                <input type="hidden" name="user_id"
                                    value="<%=session.getAttribute("user")!=null?session.getAttribute("user")+"":"" %>">
                                <%
                                ResultSet rs5=db.getRows("select ProductId from Cart where UserName=? and ProductId=?", session.getAttribute("user")+"",rs2.getString(1));
                                if(rs5.next()){
                                %>    
                                <button type="submit" disabled class="btn btn-success font-size-12">In the Cart</button>
                                <%
                                }else{
                                %>
                                <button type="submit" name="top_sale_submit" class="btn btn-warning font-size-12">Add to Cart</button>
                                <%
                                }
                                %>                              
                            </form>                    
                        </div>
                    </div>
                </div>
            <%} %>
        </div>
        <!-- !owl carousel -->
    </div>
</section>
<!-- !New Phones -->
<!-- Blogs -->
<section id="blogs">
    <div class="container py-4">
        <h4 class="font-size-20">CHUỖI MỚI DEAL KHỦNG</h4>
        <hr>

        <div class="owl-carousel owl-theme">
            <div class="item">
                <div class="card border-1 me-5">
                    <h5 class="card-title font-size-16 text-dark text-center mt-1">Táo xịn tết sang - Lì xì 2023 chỉ vàng</h5>
                    <img src="./assets/blog/blog1.jpg" class="card-img-top">
                    <p class="card-text font-size-14 text-black-50 px-2">Từ ngày 16/12/-31/01 Táo xịn tết sang giảm đến
                        11 triệu khi mua iPhone hoặc MacBook tại Topzone, mua iPad giảm 7 triệu, cùng nhiều khuyến mãi
                        hấp dẫn.</p>
                    <a href="#" class="color-second text-start ps-2 mb-2">Xem ngay</a>
                </div>
            </div>
            <div class="item">
                <div class="card border-1 me-5">
                    <h5 class="card-title font-size-16 text-dark text-center mt-1">GIÁNG SINH GIẢM ĐỈNH 50%</h5>
                    <img src="./assets/blog/blog2.jpg" class="card-img-top">
                    <p class="card-text font-size-14 text-black-50 px-2">SALE SỐC HÀNG LOẠT ĐẾN 50% - DUY NHẤT TỪ 19
                        -25/12. MUA NGAY TẠI AVASPORT</p>
                    <a href="#" class="color-second text-start ps-2 mb-2">Xem ngay</a>
                </div>
            </div>
            <div class="item">
                <div class="card border-1 me-5">
                    <h5 class="card-title font-size-16 text-dark text-center mt-1">Mùa giáng sinh, sinh lực phải sung giảm đến 30%</h5>
                    <img src="./assets/blog/blog3.jpg" class="card-img-top">
                    <p class="card-text font-size-14 text-black-50 px-2">Từ ngày 01/12 đến 31/12 mua Yến sào Win'snest
                        khuyến mãi mua 1 tặng 1. Hàng loạt sản phẩm giảm ngay từ 5% đến 30%</p>
                    <a href="#" class="color-second text-start ps-2 mb-2">Xem ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- !Blogs -->
       

<%@ include file="footer.jsp" %>