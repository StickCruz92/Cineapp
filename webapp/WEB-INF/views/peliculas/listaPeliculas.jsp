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
	<title>Listado de Peliculas 2</title>
	<spring:url value="/resources" var="urlPublic" />
	<spring:url value="/peliculas" var="urlPeliculas" />
	
	<link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">	
	<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
	
	</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>
	
	<div class="container theme-showcase" role="main">

		<h3>Listado de Peliculas 2</h3>
      
        <c:if test="${msg !=null }">        
        		<div class='alert alert-success' role='alert'>${msg}</div>
        </c:if>	
              
        <a href="${urlPeliculas}/create" class="btn btn-success" role="button" title="Nueva Pelicula" >Nueva</a><br><br>        
      
        <div class="table-responsive">
	        <table class="table table-hover table-striped table-bordered">
	          <tr>
	              <th>Titulo</th>
	              <th>Genero</th>
	              <th>Clasificacion</th>
	              <th>Duracion</th>
	              <th>Fecha Estreno</th>
	              <th>Estatus</th>
	              <th>Opciones</th>
	          </tr>
	
				<c:forEach var="pelicula" items="${peliculas.content}">
					<tr>
						<td>${pelicula.titulo}</td>
						<!--<td>${pelicula.idGenero}</td>-->
						<c:forEach items="${generos}" var="genero">  
                            <c:if test = "${genero.id == pelicula.idGenero}">
                            <td>${genero.nombre}</td>
						   </c:if>
						</c:forEach>
						<td>${pelicula.clasificacion}</td>
						<td>${pelicula.duracion} min.</td>
						<td><fmt:formatDate pattern="dd-MM-yyyy"
								value="${pelicula.fechaEstreno}" /></td>
						<c:choose>
							<c:when test="${pelicula.estatus eq 'Activa'}">
								<td><span class="label label-success">${pelicula.estatus}</span></td>
							</c:when>
							<c:otherwise>
								<td><span class="label label-danger">${pelicula.estatus}</span></td>
							</c:otherwise>
						</c:choose>
						<td>
							<a href="${urlPeliculas}/edit/${pelicula.id}" class="btn btn-success btn-sm" role="button" title="Edit"><span class="glyphicon glyphicon-pencil"></span></a>
							<a href="${urlPeliculas}/delete/${pelicula.id}" onclick='return confirm("�Estas seguro?")' class="btn btn-danger btn-sm" role="button" title="Eliminar"><span class="glyphicon glyphicon-trash"></span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		Total Pelculas: ${totalElements} - Page ${currentPage} of ${totalPages}
		
		<nav aria-label="">
		  <ul class="pager">
		  
		 <c:if test = "${peliculas.number > 0}">
		   	   <li><a href="${urlPeliculas}/indexPaginate?page=${(peliculas.number + 1) - 1}">Anterior</a></li>
		 </c:if>
		    
		<c:forEach begin="1" end="${totalPages}" var="i">

		<c:choose>
	        <c:when test = "${i != currentPage}">
			   	   <a href="${urlPeliculas}/indexPaginate?page=${i}">${i}</a>
			</c:when>
            <c:otherwise>
                   <span>${i}</span>
            </c:otherwise>
         </c:choose>
	             
	    </c:forEach>
	    
		<c:if test = "${peliculas.number + 1 < totalPages}">
		<li><a href="${urlPeliculas}/indexPaginate?page=${(peliculas.number + 1) + 1}">Siguiente</a></li>
		 </c:if>
		     

		  </ul>
		</nav>

      <hr class="featurette-divider">

      <jsp:include page="../includes/footer.jsp"></jsp:include>		

	</div> <!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>