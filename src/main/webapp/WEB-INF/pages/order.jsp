<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="${pageContext.request.contextPath}/shop-homepage.css" rel="stylesheet">

	<title>Product List</title>
 
 
</head>
<body>
 
   <jsp:include page="_menu.jsp" />
    
   <fmt:setLocale value="en_US" scope="session"/>
 
   <div class="page-title">Podaci o narudžbi</div>
 
   <div class="customer-info-container">
       <h3>Informacije o kupcu:</h3>
       <ul>
           <li>Ime: ${orderInfo.customerName}</li>
           <li>Email: ${orderInfo.customerEmail}</li>
           <li>Telefon: ${orderInfo.customerPhone}</li>
           <li>Adresa: ${orderInfo.customerAddress}</li>         
       </ul>
       <h3>Kupio:</h3>
       <ul>
           <li>Ukupno:
           <span class="total">
           <fmt:formatNumber value="${orderInfo.amount}" type="currency"/>
           </span></li>
           <li>Način plaćanja: ${orderInfo.methodOfPay}</li>
       </ul>
   </div>
    
   <br/>
    
   <table border="1" style="width:100%">
       <tr>
           <th>Kod Proizvoda</th>
           <th>Ime Proizvoda</th>
           <th>Kategorija Proizvoda</th>
           <th>Kolicina</th>
           <th>Cijena</th>
           <th>Ukupno</th>
       </tr>
       <c:forEach items="${orderInfo.details}" var="orderDetailInfo">
           <tr>
               <td>${orderDetailInfo.productCode}</td>
               <td>${orderDetailInfo.productName}</td>
               <td>${orderDetailInfo.productCategory}</td>
               <td>${orderDetailInfo.quanity}</td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.price}" type="currency"/>
               </td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.amount}" type="currency"/>
               </td>  
           </tr>
       </c:forEach>
   </table>
   <c:if test="${paginationResult.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationResult.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="orderList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
          </c:forEach>
            
       </div>
   </c:if>
 
 
 		<jsp:include page="_footer.jsp" />
 
   <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
   <script src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>