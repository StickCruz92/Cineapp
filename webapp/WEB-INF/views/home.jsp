<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>CineSite | Bienvenido</title>
	<spring:url value="/resources" var="urlPublic" />
	<spring:url value="/" var="urlRoot" />	
		
	<link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">		
	<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
	
	</head>

<body>

	<jsp:include page="includes/menu.jsp"></jsp:include>
	
	<div class="container theme-showcase" role="main">

		<!-- Carousel
    ================================================== -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
			
				<c:forEach items="${banners}" var="banner" varStatus="loop">
	        	  <c:choose>
		       		<c:when test="${loop.index==0}">
		       			<li data-target="#myCarousel" data-slide-to="${loop.index}" class="active"></li>
		        		</c:when>
		        		<c:otherwise>
			         	<li data-target="#myCarousel" data-slide-to="${loop.index}"></li>
			         </c:otherwise>
		          </c:choose>
		        </c:forEach>
		        			 
			</ol>
			
			<!-- Image Size 1140 x 250 -->
			<div class="carousel-inner" role="listbox">
			
				<c:forEach items="${banners}" var="banner" varStatus="loop">
	        	  	<c:choose>
		        		<c:when test="${loop.index==0}">
		        			<div class="item active">         
			            	<img src="${urlPublic}/images/${banner.archivo}" alt="${banner.titulo}" title="${banner.titulo}" >
			         	</div>
		        		</c:when>        	
			         <c:otherwise>
			         	<div class="item">         
			            	<img src="${urlPublic}/images/${banner.archivo}" alt="${banner.titulo}" title="${banner.titulo}" >
			         	</div>
			         </c:otherwise>
		         	</c:choose>
	        	</c:forEach> 
						   
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"	data-slide="prev"> 
				<span	class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
				<span	class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->

		<div class="row page-header">
			<div class="col-lg-12">
				<h2 class="text text-center"><span class="label label-success">EN CARTELERA</span></h2>
				<form class="form-inline" action="${urlRoot}search" method="POST">
					<div class="form-group">
						<label for="fecha">Fecha: </label> 						
						<select id="fecha" name="fecha" class="form-control">
							<c:forEach var="fecha" items="${fechas}">							
								<c:choose>
								     <c:when test="${fechaBusqueda eq fecha}" >
								         <option value="${fecha}" selected>${fecha}</option>	
								     </c:when>
								     <c:otherwise>
								        <option value="${fecha}">${fecha}</option>	
								     </c:otherwise>
								</c:choose>																
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">Filtrar</button>
				</form>
			</div>
		</div>

		<!-- Marketing messaging -->
		<div class="container marketing">
			<!-- Columns of text below the carousel -->
			<div class="row">
				<c:forEach var="pelicula" items="${peliculas}">
					<div class="col-xs-12 col-sm-6 col-md-3">
						<img class="img-rounded" src="${urlPublic}/images/${pelicula.imagen}" alt="Generic placeholder image" width="150" height="200">
						<h4>${pelicula.titulo}</h4>
						<h4>
							<span class="label label-default">${pelicula.clasificacion}</span> 
							<span	class="label label-default">${pelicula.duracion} min</span> 
							<!--<span class="label label-default">${pelicula.idGenero}</span>-->
                           <c:forEach items="${generos}" var="genero">  
                             <c:if test = "${genero.id == pelicula.idGenero}">
                                 <span class="label label-default">${genero.nombre}</span>
						     </c:if>
						   </c:forEach>
							
							
						</h4>
						<p>
							<a class="btn btn-sm btn-primary" href="${urlRoot}detail/${pelicula.id}/${fechaBusqueda}" role="button">Consulta Horarios &raquo;</a>							
						</p>
					</div>
				</c:forEach>				
			</div>
			
			<div class="page-header">
				<h2 class="text text-center"><span class="label label-success">Noticias y novedades</span></h2>
			</div>

			<div class="row">

				<div class="col-sm-12 blog-main">
				
					<c:forEach var="noticia" items="${noticias}">  
						<div class="blog-post">              
		              <h3 class="blog-post-title">${noticia.titulo}</h3>
		              
		              <p class="blog-post-meta"><span class="label label-danger">Publicado: <fmt:formatDate pattern="dd-MM-yyyy" value="${noticia.fecha}" /></span></p>             
		              
		              ${noticia.detalle}
		              
		              <hr>
		            </div>
					</c:forEach>		
					
				</div>				
			</div>			

		</div><!-- /.container -->

		<jsp:include page="includes/footer.jsp"></jsp:include>		

	</div> <!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>