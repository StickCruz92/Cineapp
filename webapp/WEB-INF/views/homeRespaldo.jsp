<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<spring:url value="/resources" var="urlPublic" />
<link rel="stylesheet" href="${urlPublic}/bootstrap/css/bootstrap.min.css">

<title>Bienvenidos a Cineapp</title>
</head>
<body>

	<%--
	<ol>
		<c:forEach items="${ peliculas }" var="pelicula">
			<li>${pelicula }</li>
		</c:forEach>
	</ol>
	--%>
	<div class="panel panel-default">
		<div class="panel-heading">Tabla de peliculas</div>
		<div class="panel-body">
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Id</th>
						<th>Titulo</th>
						<th>Duración</th>
						<th>Clasificación</th>
						<th>Genero</th>
						<th>Imagen</th>
						<th>Fecha de Estreno</th>
						<th>Estatus</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ peliculas }" var="pelicula">
						<tr>
							<td>${pelicula.id }</td>
							<td>${pelicula.titulo }</td>
							<td>${pelicula.duracion }min.</td>
							<td>${pelicula.clasificacion }</td>
							<td>${pelicula.genero }</td>
							<td><img alt="${pelicula.imagen }" src="${urlPublic}/images/${pelicula.imagen}" width="80" height="100"></td>
							<td><fmt:formatDate value="${pelicula.fechaEstreno }" pattern="dd-mm-yyyy"/></td>
							<td>
							  <c:choose>
							     <c:when test="${pelicula.estatus=='Activa'}">
							      <span class="label label-success">ACTIVA</span>
							     </c:when>
							     <c:otherwise>
							        <span class="label label-danger">INACTIVA</span>
							     </c:otherwise>
							  </c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>