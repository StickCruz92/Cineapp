<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Listado de imagenes del banner</title>
    <spring:url value="/resources" var="urlPublic" />
	 <spring:url value="/generos" var="urlGeneros" />
    <link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
    
  </head>

  <body>

    <jsp:include page="../includes/menu.jsp" />

    <div class="container theme-showcase" role="main">

      <h3>Listado de generos</h3>
      
      <c:if test="${msg !=null }">        
        	<div class='alert alert-success' role='alert'>${msg}</div>
      </c:if>
      
      <a href="${urlGeneros}/create" class="btn btn-success" role="button" title="Nuevo Genero" >Nuevo</a><br><br>

      <div class="table-responsive">
        <table class="table table-hover table-striped table-bordered">
            <tr>
                <th>Id</th>
                <th>Nombre</th>                           
                <th>Descripci�n</th>              
                <th>Estatus</th>             
            </tr>
            
            <c:forEach items="${generos}" var="genero">            
	            <tr>
	                <td>${genero.id}</td>
	                <td>${genero.nombre}</td>
	                <td>${genero.descripcion}</td>
                   <c:choose>
								<c:when test="${genero.estatus eq 'Activo'}">
									<td><span class="label label-success">${genero.estatus}</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-danger">${genero.estatus}</span></td>
								</c:otherwise>
					</c:choose>	                
	             
	                <td>
	                    <a href="${urlGeneros}/edit/${genero.id}" class="btn btn-success btn-sm" role="button" title="Edit" ><span class="glyphicon glyphicon-pencil"></span></a>
	                    <a href="${urlGeneros}/delete/${genero.id}" onclick='return confirm("�Estas seguro?")' class="btn btn-danger btn-sm" role="button" title="Eliminar" ><span class="glyphicon glyphicon-trash"></span></a>
	                </td>
            	</tr>
            </c:forEach>
                 
        </table>
      </div>  
      <hr class="featurette-divider">

      <jsp:include page="../includes/footer.jsp" />

    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
    <script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>     
  </body>
</html>
