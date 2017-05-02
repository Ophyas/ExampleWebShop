<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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

<title>Lista narudzbi</title>
 
 
</head>
<body>
 
   <jsp:include page="_menu.jsp" />
 
   <fmt:setLocale value="en_US" scope="session"/>
  
   <div class="page-title">Lista narudzbi</div>
 
   <div>Ukupno dosad: ${paginationResult.totalRecords}</div>
  
   <table border="1" style="width:100%">
       <tr>
           <th>Broj narudzbe</th>
           <th>Datum</th>
           <th>Ime kupca</th>
           <th>Adresa kupca</th>
           <th>Email</th>
           <th>Nacin placanja</th>
           <th>Iznos</th>
           <th>View</th>
       </tr>
       <c:forEach items="${paginationResult.list}" var="orderInfo">
          <c:if test="${orderInfo.customerName == username || username == 'Prodavac'}">
           <tr>
               <td>${orderInfo.orderNum}</td>
               <td>
                  <fmt:formatDate value="${orderInfo.orderDate}" pattern="dd-MM-yyyy HH:mm"/>
               </td>
               <td>${orderInfo.customerName}</td>
               <td>${orderInfo.customerAddress}</td>
               <td>${orderInfo.customerEmail}</td>
               <td>${orderInfo.methodOfPay}</td>
               <td style="color:red;">
                  <fmt:formatNumber value="${orderInfo.amount}" type="currency"/>
               </td>
               <td><a href="${pageContext.request.contextPath}/order?orderId=${orderInfo.id}">
                  View</a></td>
           </tr>
           </c:if>
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