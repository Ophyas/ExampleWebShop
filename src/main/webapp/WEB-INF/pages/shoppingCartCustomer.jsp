<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/MojCss.css" rel="stylesheet">

 
<title>Enter Customer Information</title>
 
</head>
<body style="padding-top: 80px;">
<jsp:include page="_menu.jsp" />

<form:form method="POST" modelAttribute="customerForm" action="${pageContext.request.contextPath}/shoppingCartCustomer" class="form-horizontal">
	<fieldset>
	
	<!-- Form Name -->
	<h3>Unos informacija za dostavu i plaćanje</h3>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="imeText">Ime</label>  
	  <div class="col-md-4">
	  <form:input id="imeText" type="text" placeholder="Unesite Vaše ime" class="form-control input-md" path="name" value="${username}" readonly="true"/>    
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="emailText">Email</label>  
	  <div class="col-md-4">
	  <form:input id="emailText" type="text" placeholder="Unesite Vaš email" class="form-control input-md" path="email"/>
	    
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="telText">Telefon / GSM</label>  
	  <div class="col-md-4">
	  <form:input id="telText" type="text" placeholder="Unesite Vaš telefon" class="form-control input-md" path="phone"/>
	    
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="adresaText">Adresa</label>  
	  <div class="col-md-4">
	  <form:input id="adresaText" type="text" placeholder="Unesite Vašu adresu" class="form-control input-md" path="address"/>
	    
	  </div>
	</div>
	
	<!-- Multiple Radios -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="payRadio">Odaberite način plaćanja</label>
	  <div class="col-md-4">
	  <div class="radio">
	    <label for="payRadio-0">
	      <form:radiobutton value="Gotovina" checked="checked" path="pay"/>
	      Gotovina
	    </label>
		</div>
	  <div class="radio">
	    <label for="payRadio-1">
	      <form:radiobutton value="Kartica" path="pay"/>
	      Kartica
	    </label>
		</div>
	  <div class="radio">
	    <label for="payRadio-2">
	      <form:radiobutton value="Paypal" path="pay"/>
	      Paypal
	    </label>
		</div>
	  </div>
	</div>
	
	<!-- Button (Double) -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="submit"></label>
	  <div class="col-md-8">
	    <input type="submit" value="Pošalji" class="btn btn-success">
	    <input type="reset" value="Reset" class="btn btn-danger">
	  </div>
	</div>
	
	</fieldset>
</form:form>
 
<%-- <div class="page-title" style="horizontal-align: center; text-align:center;">Enter Customer Information</div>
 
   <form:form method="POST" modelAttribute="customerForm"
       action="${pageContext.request.contextPath}/shoppingCartCustomer" style="horizontal-align: center; text-align:center;">
 
       <table>
           <tr>
               <td>Name *</td>
               <td><form:input path="name" /></td>
               <td><form:errors path="name" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Email *</td>
               <td><form:input path="email" /></td>
               <td><form:errors path="email" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Phone *</td>
               <td><form:input path="phone" /></td>
               <td><form:errors path="phone" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Address *</td>
               <td><form:input path="address" /></td>
               <td><form:errors path="address" class="error-message" /></td>
           </tr>
           
           <tr>
               <td>Paying method *</td>
               <td>
               <form:select multiple="false" path="pay">
               		   <option value="Pouzece">Pouzece</option>
					   <option value="Kartica">Kartica</option>
					   <option value="Paypal">Paypal</option>
               </form:select>
               </td>
               <td><form:errors path="pay" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>&nbsp;</td>
               <td><input type="submit" value="Submit" /> <input type="reset"
                   value="Reset" /></td>
           </tr>
       </table>
 
   </form:form> --%>
 
   <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
   <script src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>