<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
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

<title>Kreiranje Proizvoda</title>
 
</head>
<body>
 
   <jsp:include page="_menu.jsp" />
 
   <div class="page-title">Proizvod</div>
  
   <c:if test="${not empty errorMessage }">
     <div class="error-message">
         ${errorMessage}
     </div>
   </c:if>
 
   <form:form modelAttribute="productForm" method="POST" enctype="multipart/form-data">
       <table style="text-align:left; margin-left: 20px;" >
           <tr>
               <td>Kod Proizvoda: </td>
               <td style="color:red;">
                  <c:if test="${not empty productForm.code}">
                       <form:hidden path="code"/>
                       ${productForm.code}
                  </c:if>
                  <c:if test="${empty productForm.code}">
                       <form:input path="code" />
                       <form:hidden path="newProduct" />
                  </c:if>
               </td>
               <td><form:errors path="code" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Naziv: </td>
               <td><form:input path="name" /></td>
               <td><form:errors path="name" class="error-message" /></td>
           </tr>
           
           <tr>
               <td>Kategorija: </td>
               <td><form:select multiple="false" path="category">
               		   <option value="Prirucnici">Prirucnici</option>
					   <option value="Knjige">Knjige</option>
					   <option value="Skripte">Skripte</option>
               </form:select></td>
               <td><form:errors path="category" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Cijena: </td>
               <td><form:input path="price" /></td>
               <td><form:errors path="price" class="error-message" /></td>
           </tr>
           <tr>
               <td>Slika: </td>
               <td>
               <img src="${pageContext.request.contextPath}/productImage?code=${productForm.code}" width="100"/></td>
               <td> </td>
           </tr>
           <tr>
               <td>Upload Slike</td>
               <td><form:input type="file" path="fileData"/></td>
               <td> </td>
           </tr>
 
 
           <tr>
               <td>&nbsp;</td>
               <td><input type="submit" value="Submit" style="margin: 0,5,5,0;" /> <input type="reset"
                   value="Reset" style="margin: 0,5,0,0;" /></td>
           </tr>
       </table>
   </form:form>
 
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
   <script src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>