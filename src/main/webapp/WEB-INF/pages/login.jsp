<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Login</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/register.css">
    <link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/shop-homepage.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
 
</head>
<body>
 
   <jsp:include page="_menu.jsp" />
 
   <div class="container" style="width: 25%">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Login</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form:form class="form-horizontal" modelAttribute="customerForm" method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<form:input type="text" class="form-control" name="userName" id="username"  placeholder="Enter your Username" path="name"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<form:input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password" path="password"/>
								</div>
							</div>
						</div>
					
						<div class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Login</button>
							<button type="reset" class="btn btn-primary btn-lg btn-block login-button">Reset</button>
						</div>						
					</form:form>
					<span class="error-message">${error }</span>
					<c:if test="${param.error == 'true'}">
        			    <div style="color: red; margin: 10px 0px;">
 
               			Login Failed!!!<br /> Reason :
               			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
 
           				</div>
       				</c:if>
				</div>
				
			</div>
       				
		</div>
   <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
   <script src="webjars/bootstrap/3.2.0/js/bootstrap.js"></script>
</body>
</html>