<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">

 
<title>Kosarica</title>
 
</head>
<body style="padding-top: 80px;">  
   <jsp:include page="_menu.jsp" /> 
   <fmt:setLocale value="en_US" scope="session"/>
   
      <c:if test="${empty cartForm or empty cartForm.cartLines}">
       <h2 style="horizontal-align: center; text-align:center;">Prazna kosarica!</h2>
       <div style="horizontal-align: center; text-align:center;">
         <a href="${pageContext.request.contextPath}/">
	        <button type="button" class="btn btn-default">
	           <span class="glyphicon glyphicon-shopping-cart"></span> Nastavi kupovinu
	        </button>
         </a>
       </div>     
      </c:if>
      
      <c:if test="${not empty cartForm and not empty cartForm.cartLines}">
            <div class="container">
			    <div class="row">
			        <div class="col-sm-12 col-md-10 col-md-offset-1">
			            <table class="table table-hover">
			                <thead>
			                    <tr>
			                        <th>Proizvod</th>
			                        <th>Kolicina</th>
			                        <th class="text-center">Cijena</th>
			                        <th class="text-center">Ukupno</th>
			                        <th> </th>
			                    </tr>
			                </thead>
			               <tbody>
      	<form:form method="POST" modelAttribute="cartForm" action="${pageContext.request.contextPath}/shoppingCart">
    	 <c:forEach items="${cartForm.cartLines}" var="cartLineInfo" varStatus="varStatus">
      		<tr>
              <td class="col-sm-8 col-md-6">
              	<div class="media">
                  <a class="thumbnail pull-left" href="#"> <img class="media-object" src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" style="width: 72px; height: 72px;"> </a>
                  	<div class="media-body">
                      <h4 class="media-heading"><a href="#">${cartLineInfo.productInfo.name}</a></h4>
                      <h5 class="media-heading"> from <a href="#">${cartLineInfo.productInfo.category}</a></h5>
                      <span>Code: </span><span class="text-success"><strong>${cartLineInfo.productInfo.code} <form:hidden
                               path="cartLines[${varStatus.index}].productInfo.code" /></strong></span>
                  </div>
              	</div>
              </td>
              <td class="col-sm-1 col-md-1" style="text-align: center">
              	<form:input type="text" class="form-control" id="exampleInputEmail1" path="cartLines[${varStatus.index}].quantity"/> 
              </td>
              <td class="col-sm-1 col-md-1 text-center"><strong><fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/></strong></td>
              <td class="col-sm-1 col-md-1 text-center"><strong><fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/></strong></td>
              <td class="col-sm-1 col-md-1">
	              <a href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
	    			<button type="button" class="btn btn-danger" value="Delete">
		                  <span class="glyphicon glyphicon-remove"></span> Remove
		            </button>
				  </a>
              </td>
             </tr>
         </c:forEach>
            </tbody>
                 <tfoot>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal<br>Estimated shipping</h5><h3>Total</h3></td>
                        <td class="text-right"><h5><strong><fmt:formatNumber value="${myCart.amountTotal}" type="currency"/><br>$3.95</strong></h5><h3><fmt:formatNumber value="${myCart.shippingTotal}" type="currency"/></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        	<button type="submit" class="btn btn-info" value="Update Quantity">
	                          	Update Quantity <span class="glyphicon glyphicon-refresh"></span>
	                      	</button>
	                    </td>
                        <td>
                        <a href="${pageContext.request.contextPath}/">
	                      <button type="button" class="btn btn-default">
	                          <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
	                      </button>
	                    </a>
                        </td>
                        <td>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                        	<security:authorize  access="hasAnyRole('ROLE_MANAGER','ROLE_CUSTOMER')">
                      			<a href="${pageContext.request.contextPath}/shoppingCartCustomer">
	                     			 <button type="button" class="btn btn-success">
	                          			Checkout <span class="glyphicon glyphicon-play"></span>
	                      			 </button>
		                 		</a>
		                 	</security:authorize>
		                 </c:if>
                         <c:if test="${pageContext.request.userPrincipal.name == null}"> 
                      		<a href="${pageContext.request.contextPath}/register">
                      	  		<button type="button" class="btn btn-default">
	                          		<span class="glyphicon glyphicon-user"></span> Login/Register
	                      		</button>
	                    	</a>
                      	 </c:if>
                         </td>
                    </tr>
                </tfoot>
          </table>
        </div>
    </div>
  </div>
 </form:form>			                    			                    
 </c:if>
 
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
   <script src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>