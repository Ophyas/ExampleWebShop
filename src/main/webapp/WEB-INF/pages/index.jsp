<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/shop-homepage.css" rel="stylesheet">

    <title>Dobrodošli u Algebra Book Shop</title>



</head>

<body>
   <jsp:include page="_menu.jsp" />

    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Example Book Shop</p>
                <div class="list-group">
                    <a href="${pageContext.request.contextPath}/?category=Prirucnici" class="list-group-item">Prirucnici</a>
                    <a href="${pageContext.request.contextPath}/?category=Knjige" class="list-group-item">Knjige</a>
                    <a href="${pageContext.request.contextPath}/?category=Skripte" class="list-group-item">Skripte</a>
                    <a href="${pageContext.request.contextPath}/?category=All" class="list-group-item">Sve</a>
                </div>
            </div>

            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="http://arthuryao.com/Blog/wp-content/uploads/2014/12/books_300.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://www.arthousecrouchend.co.uk/wp-content/uploads/2015/02/book-swap1-e1422892909308-800x300.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://betterscreenwriting.com/wp-content/uploads/2016/11/How-to-Adapt-A-Book-to-A-Screenplay-800x300.jpg" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
					<c:forEach items="${paginationProducts.list}" var="prodInfo">
						<div class="col-sm-4 col-lg-4 col-md-4">
	                        <div class="thumbnail" >
	                            <img src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" alt="" style="width: 100px; height: 125px;">
	                            <div class="caption">	                                
	                                <h4>${prodInfo.name}</h4>
	                                <p class="pull-right" ><a href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">
					                       Kupi</a></p>
	                                <h4><fmt:formatNumber value="${prodInfo.price}" type="currency"/></h4>	                                
			                       <p>
			                       <security:authorize  access="hasRole('ROLE_MANAGER')">
					                 <a style="color:red;"
					                     href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
					                       Izmjeni proizvod</a>
					               </security:authorize>
					               </p>
	                            </div>
	                            <div class="ratings">
	                                <p class="pull-right">15 reviews</p>
	                                <p>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                </p>
	                            </div>
	                        </div>
	                    </div>					 
				   </c:forEach>		
				       <div class="testc">
	  			<c:if test="${paginationProducts.totalPages > 1}">
	      <div class="page-navigator">
	         <c:forEach items="${paginationProducts.navigationPages}" var = "page">
	             <c:if test="${page != -1 }">
	               <a href="${pageContext.request.contextPath}/?page=${page}&category=All" class="nav-item">${page}</a>
	             </c:if>
	             <c:if test="${page == -1 }">
	               <span class="nav-item"> ... </span>
	             </c:if>
	         </c:forEach>
	         
	      </div>
	  </c:if>
	  </div>			   			   				   					                                                           
            </div> 				   
        </div>       
    </div>
 
    <!-- /.container

    <div class="container">

        <hr>

		<jsp:include page="_footer.jsp" />

    </div>
    <!-- /.container -->

   <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
   <script src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</body>

</html>
