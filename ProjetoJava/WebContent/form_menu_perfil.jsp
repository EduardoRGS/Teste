<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no", name="viesport"/>
		
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
		<title>JSP Page</title>
		<script type="text/javascript">
			function confimarExclusao(idMenu, nome, idPerfil){
				if(confirm('Deseja realmente desvincular o menu '+nome+'?')){
					location.href='gerenciar_menu_perfil.do?acao=desvincular&idMenu='+idMenu+'&idPerfil='+idPerfil;
				}
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
		
			<%@include file="banner.jsp" %>
			<%@include file="menu.jsp" %>
			
			<h1>Gerenciar Perfil</h1>
			
			<form action="gerenciar_menu_perfil.do" method="POST">
			
				<input type="hidden" name="idPerfil" value="${perfilv.idPerfil}"/>
				
				<div class="row">
					<div class="form-group col-sm-6">
						<label for="perfil" class="control-label">${perfilv.nome}</label>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-sm-6">
						<label for="menu" class="control-label">Menus</label>
							<select name="idMenu" required="" id="idMenu" class="form-control">
								<option value="">Selecione o Menu</option>
									<c:forEach items="${perfilv.naoMenus}" var="m">
										<option value="${m.idMenu}">${m.nome}</option>
									</c:forEach>
							</select>
					</div>
				</div>
				
				<div class="row">
					<span style="fontsize: 10px">
						<button class="btn btn-success">Vincular</button>
						<a href="listar_Perfil.jsp" class="btn btn-warning">Voltar</a>
					</span>
				</div>
				
			</form>
			
			<table class="table table-hover table-striped table-bordered display" id="listarMenu">
			
			
				<thead>
				<tr>
					<th>ID</th>
					<th>Nome Menu</th>
					<th>Link</th>
					<th>Icone</th>
					<th>Exibir</th>
					<th>Desvincular</th>
				</tr>
				</thead>
				
				<tfoot>
				<tr>
					<th>ID</th>
					<th>Nome Menu</th>
					<th>Link</th>
					<th>Icone</th>
					<th>Exibir</th>
					<th>Desvincular</th>
				</tr>
				</tfoot>
				
				<jsp:useBean class="model.MenuDAO" id="mDAO"/>
				
				<tbody>
				
					<c:forEach var="m" items="${perfilv.menus}">
					<tr>
						<td>${m.idMenu}</td>
						<td>${m.nome}</td>
						<td>${m.link}</td>
						<td>${m.icone}</td>
						<td>
							<c:if test="${m.exibir==1}">
								Sim
							</c:if>
							<c:if test="${m.exibir==2}">
								N�o
							</c:if>
						
						</td>
						
						<td>
							
							<button class="btn btn-danger" onclick="confimarExclusao(${m.idMenu},'${m.nome}', ${perfilv.idPerfil})">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
	  							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							</button>
							
						</td>
					</tr>
					</c:forEach>
				
				</tbody>
			</table>
				
				<script type="text/javascript" src="datatables/jquery.js"></script>
				<script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
				<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
				<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
				<script type="text/javascript">
					$(document).ready(function() {
						$("#listarMenu").DataTable({
							"bJQueryUI": true,
							"oLanguage":{
								"sProcessing":"Processando...",
								"sLengthMenu":"Mostrar _MENU_registros",
								"sZeroRecords": "N�o foram encontrados resultados",
								"sInfo": "Mostrar de _START_ at� _END_ de _TOTAL_ registros",
								"sInfoEmpty":"Mostrando de 0 ate 0 de resgistros",
								"sInfoFiltered":"",
								"sInfoPostFix":"",
								"sSearch": "Pesquisar",
								"sUrl":"",
								"oPaginate":{
									"sFirst":"Primeiro",
									"sPrevious":"Anterior",
									"sNext":"Pr�ximo",
									"sLast":"�ltimo"
								}
							}
						});
					});
				</script>
		</div>
	</body>
</html>