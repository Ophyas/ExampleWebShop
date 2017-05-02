<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
 
 
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/shoppingCart">Moja Košarica</a>
                    </li>
                    <security:authorize  access="hasAnyRole('ROLE_MANAGER','ROLE_CUSTOMER')">
	                    <li>
	                        <a href="${pageContext.request.contextPath}/orderList">Lista Narudžbi</a>
	                    </li>
                    </security:authorize>
                    <security:authorize  access="hasRole('ROLE_MANAGER')">
	                    <li>
	                        <a href="${pageContext.request.contextPath}/product">Napravi Proizvod</a>
	                    </li>
                    </security:authorize>
                    <li>
                    	<c:if test="${pageContext.request.userPrincipal.name != null}">
                    		<span class="navbar-text">
	        					&nbsp;Hello&nbsp;
	           					<a href="${pageContext.request.contextPath}/accountInfo">
	                				${pageContext.request.userPrincipal.name} </a>
	         						&nbsp;|&nbsp;
	           					<a href="${pageContext.request.contextPath}/logout">Logout</a>
 							</span>
        				</c:if>
        				<c:if test="${pageContext.request.userPrincipal.name == null}"> 
        				<span class="navbar-text">      				
            				<a href="${pageContext.request.contextPath}/login">Login</a>&nbsp;&nbsp;
            				<a href="${pageContext.request.contextPath}/register">Register</a>
            			</span>
       					</c:if>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>