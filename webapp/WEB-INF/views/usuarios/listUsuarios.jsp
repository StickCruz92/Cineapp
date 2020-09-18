<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Listado de usuarias</title>
	<spring:url value="/resources" var="urlPublic" />
	<spring:url value="/usuarios" var="urlUsuarios" />

	<link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">	
	<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">

</head>
<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>
	
	<div class="container theme-showcase" role="main">

	<h3>Listado de Usuarios</h3>
	
	 <c:if test="${msg !=null }">        
        		<div class='alert alert-success' role='alert'>${msg}</div>
        </c:if>	
              
        <a href="${urlUsuarios}/create" class="btn btn-success" role="button" title="Nuevo Usuario" >Nueva usuario</a><br><br>   
	
	        <div class="table-responsive">
	        <table class="table table-hover table-striped table-bordered">
	          <tr>
	              <th>Cuenta</th>
	              <th>Correo electronico</th>
	              <th>Telefono</th>
	              <th>Activa</th>
	          </tr>
	
			   <c:forEach var="usuario" items="${usuarios}">
					<tr>
						<td>${usuario.cuenta}</td>
						<td>${usuario.email}</td>
						<td>${usuario.telefono}</td>
						<c:choose>
							<c:when test="${usuario.activo eq 1}">
								<td><span class="label label-success">Activa</span></td>
							</c:when>
							<c:otherwise>
								<td><span class="label label-danger">Desactivado</span></td>
							</c:otherwise>
						</c:choose>
						<td>
							<a href="${urlUsuarios}/edit/${usuario.id}" class="btn btn-success btn-sm" role="button" title="Edit"><span class="glyphicon glyphicon-pencil"></span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
	

	 </div>
	 
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