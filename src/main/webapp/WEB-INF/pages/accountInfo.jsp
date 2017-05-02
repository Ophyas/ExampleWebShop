<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link href="${pageContext.request.contextPath}/shop-homepage.css" rel="stylesheet">

	<title>Account Info</title>
</head>
<body>
   <jsp:include page="_menu.jsp" />
 
   <div class="container">
      <h1>Account Info</h1>
      <ul>
          <li>User Name: ${pageContext.request.userPrincipal.name}</li>
          <li>Role:
              <ul>
                  <c:forEach items="${userDetails.authorities}" var="auth">
                      <li>${auth.authority }</li>
                  </c:forEach>
              </ul>
          </li>
      </ul>
   </div>
   
   <div class="container">
	   <hr>
   </div>
 
   <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
   <script src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>