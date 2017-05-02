<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Potvrda narudžbe</title>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/MojCss.css" rel="stylesheet">

 
</head>
<body style="padding-top: 80px; padding-left: 10px; text-align:center;">
  <jsp:include page="_menu.jsp" />
  <fmt:setLocale value="en_US" scope="session"/>
  
  <form class="form-horizontal">
	<fieldset>
	
	<!-- Form Name -->
	<h2 style="padding-top: 20px;">Informacije o kupcu:</h2>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Ime: ${myCart.customerInfo.name}</label>  
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Email: ${myCart.customerInfo.email}</label>  
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Telefon: ${myCart.customerInfo.phone}</label>  
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Adresa: ${myCart.customerInfo.address}</label>  
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Nacin placanja: ${myCart.customerInfo.pay}</label>  
	</div>
	
	</fieldset>	
</form>
<form class="form-horizontal">
	<fieldset>
	
	<!-- Form Name -->
	<h2 style="padding-top: 30px;">Sadrzaj kosarice:</h2>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Kolicina artikala: ${myCart.quantityTotal}</label>  
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Ukupno s postarinom: <fmt:formatNumber value="${myCart.shippingTotal}" type="currency"/></label>  
	</div>
	
	</fieldset>
</form>

     <div class="right">
      <div class="row">
		<div class="form-horizontal">

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
                   		<c:forEach items="${myCart.cartLines}" var="cartLineInfo">
      					<tr>
			              <td class="col-sm-8 col-md-6" style="width: 400px;">
			              	<div class="media">
			                  <a class="thumbnail pull-left" href="#"> <img class="media-object" src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" style="width: 72px; height: 72px;"> </a>                  	
			              	</div>
			              </td>
			              <td class="col-sm-1 col-md-1 text-center"><strong>${cartLineInfo.quantity}</strong></td>
			              <td class="col-sm-1 col-md-1 text-center"><strong><fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/></strong></td>
			              <td class="col-sm-1 col-md-1 text-center"><strong><fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/></strong></td>
			              <td class="col-sm-1 col-md-1">
			              </td>
			             </tr>
			         </c:forEach>	 	
            </tbody>
                 <tfoot>
			<form:form method="POST" id="myPaymentForm" action="${pageContext.request.contextPath}/shoppingCartConfirmation">                   
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        	<a href="${pageContext.request.contextPath}/shoppingCartCustomer">
	                      		<button type="button" class="btn btn-default">
	                          		<span class="glyphicon glyphicon-user"></span> Izmjeni informacije o kupcu
	                      		</button>
	                    	</a>
	                    </td>
                        <td>
                        <a href="${pageContext.request.contextPath}/shoppingCart">
	                      <button type="button" class="btn btn-default">
	                          <span class="glyphicon glyphicon-shopping-cart"></span> Izmjeni sadržaj košarice
	                      </button>
	                    </a>	                    
                        </td>
                        <td>
                        <c:if test="${myCart.customerInfo.pay != 'Paypal'}">
                        	<security:authorize  access="hasAnyRole('ROLE_MANAGER','ROLE_CUSTOMER')">
                        		<button type="submit" class="btn btn-info" value="Platite s ${myCart.customerInfo.pay}">
	                          		Platite s ${myCart.customerInfo.pay} <span class="glyphicon glyphicon-refresh"></span>
	                      		</button>
		                 	</security:authorize>
		                 </c:if>    
		                 <c:if test="${myCart.customerInfo.pay == 'Paypal'}">
                        	<security:authorize  access="hasAnyRole('ROLE_MANAGER','ROLE_CUSTOMER')">
                        		<div id="paypal-button"></div> 
		                 	</security:authorize>
		                 </c:if>                    
                         </td>
                    </tr>
               </form:form>
               			         
                </tfoot>               
          </table>
        </div>
    </div>
  </div>
  
<%--   <form method="POST" action="${initParam['posturl']}">
  	<input type="hidden" name="upload" value="1" />
  	<input type="hidden" name="return" value="${initParam['returnurl']}" />
  	<input type="hidden" name="cmd" value="_cart" />
  	<input type="hidden" name="business" value="${initParam['business']}" />
  	
  	<input type="hidden" name="item_name1" value="Product 1" />
  	<input type="hidden" name="item_number_1" value="p1" />
  	<input type="hidden" name="amount_1" value="2" />
  	<input type="hidden" name="quantity_1" value="3" />
  	
  	<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"> 	
  	
  </form> --%>
			                    			                  
  
 
<%--   <div class="page-title">Potvrda narudžbe</div>
 
 
 
  <div class="customer-info-container" style="horizontal-align: center;">
      <h3>Informacije o kupcu:</h3>
      <ul>
          <li>Ime: ${myCart.customerInfo.name}</li>
          <li>Email: ${myCart.customerInfo.email}</li>
          <li>Telefon: ${myCart.customerInfo.phone}</li>
          <li>Adresa za dostavu: ${myCart.customerInfo.address}</li>
          <li>Način plaćanja: ${myCart.customerInfo.pay}</li>
      </ul>
      <h3>Sadržaj košarice:</h3>
      <ul>
          <li>Količina: ${myCart.quantityTotal}</li>
          <li>Ukupno:
          <span class="total">
            <fmt:formatNumber value="${myCart.amountTotal}" type="currency"/>
          </span></li>
      </ul>
  </div>
 
  <form method="POST"
      action="${pageContext.request.contextPath}/shoppingCartConfirmation">
 
      <!-- Edit Cart -->
      <a class="navi-item"
          href="${pageContext.request.contextPath}/shoppingCart">Izmjeni sadržaj košarice</a>
 
      <!-- Edit Customer Info -->
      <a class="navi-item"
          href="${pageContext.request.contextPath}/shoppingCartCustomer">Izmjeni informacije o kupcu</a>
 
      <!-- Send/Save -->
      <input type="submit" value="Pay with ${myCart.customerInfo.pay}" class="button-send-sc" />
  </form>
 
  <div class="container">
 
      <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
          <div class="product-preview-container">
              <ul>
                  <li><img class="product-image"
                      src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" /></li>
                  <li>Code: ${cartLineInfo.productInfo.code} <input
                      type="hidden" name="code" value="${cartLineInfo.productInfo.code}" />
                  </li>
                  <li>Ime: ${cartLineInfo.productInfo.name}</li>
                  <li>Kategorija: ${cartLineInfo.productInfo.category}</li>
                  <li>Cijena: <span class="price">
                     <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                  </span>
                  </li>
                  <li>Količina: ${cartLineInfo.quantity}</li>
                  <li>Ukupno:
                    <span class="subtotal">
                       <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                    </span>
                  </li>
              </ul>
          </div>
      </c:forEach>
 
  </div> --%>
 <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
 <script src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 <script src="https://www.paypalobjects.com/api/checkout.js"></script>
 <script>
    paypal.Button.render({
    
        env: 'sandbox', // Optional: specify 'sandbox' environment
    
        client: {
            sandbox:    'AWU-tWVRX2ub45WiC4C-i-dJqbAwZ72srIgYlwuJTALR0qdF-YPDzz5E3ogeaBJCfwt9G8kXpPiRtqUK',
        },

        payment: function() {
        
            var env    = this.props.env;
            var client = this.props.client;
        
            return paypal.rest.payment.create(env, client, {
                transactions: [
                    {
                        amount: { total: '${myCart.shippingTotal}', currency: 'USD' }
                    }
                ]
            });
        },

        commit: true, // Optional: show a 'Pay Now' button in the checkout flow

        onAuthorize: function(data, actions) {
        
        	document.forms["myPaymentForm"].submit();
        
            return actions.payment.execute().then(function() {
            	document.forms["myPaymentForm"].submit();
            });
        }

    }, '#paypal-button');
</script> 
</body>
</html>