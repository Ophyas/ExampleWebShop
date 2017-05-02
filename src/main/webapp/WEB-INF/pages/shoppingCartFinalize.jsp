<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
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

 
<title>Zavrsena kupovina</title>
 
 
</head>
<body>
 
   <jsp:include page="_menu.jsp" />
  
   <div class="container" style="horizontal-align: center; text-align:center;">
       <h2>Zahvaljujemo se na kupovini</h2>
       <h4>Za reklamacije: Vas broj narudzbe je (${lastOrderedCart.orderNum})</h4>
   </div>
 
</body>
</html>