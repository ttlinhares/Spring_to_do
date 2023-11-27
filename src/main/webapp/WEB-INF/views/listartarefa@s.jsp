<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de tarefas</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>

<body>
	<c:if test="${not empty mensagem}">
		<div class="alert alert-info" style="text-align: center;">
			<span>${mensagem}</span>
		</div>
	</c:if>
	<header class="container"
		style="justify-content: center; display: flex; margin-top: 150px;">
		<h1>
			<i class="bi bi-list-task"
				style="background-color: rgb(238, 238, 238); border-radius: 5px; padding: 5px;">Listar
				Tarefas</i>
		</h1>
	</header>

	<main class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Descrição</th>
					<th scope="col">Data Conclusão</th>
					<th scope="col">Concluído</th>
					<th scope="col">Editar</th>
					<th scope="col">Excluir</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tarefas}" var="tarefa">
					<tr>
						<th scope="row">${tarefa.id}</th>
						<td>${tarefa.descricao}</td>
<td>${tarefa.dataConclusao.format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))}</td>
						<td><input type="checkbox" name="concluido"
							${tarefa.concluido ? 'checked' : ''} disabled></td>
						<td><a href="/editar-tarefa/${tarefa.id}"
							class="btn btn-dark">Editar</a></td>
						<td>
							<form action="/excluir-tarefa" method="post">
								<input type="hidden" name="tarefaId" value="${tarefa.id}">
								<button type="submit" class="btn btn-danger">Excluir</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>

	<footer class="container"
		style="justify-content: center; flex-direction: column; text-align: center;">
		<a href="/todo-app/cadastratarefa" class="btn btn-dark"
			style="width: 130px; margin: 10px;">Cadastrar</a> <a
			href="/todo-app/welcome" class="btn btn-dark"
			style="width: 130px; margin: 10px;">Voltar</a> <a
			href="/todo-app/welcome" class="btn btn-dark"
			style="width: 130px; margin: 10px;">Sair</a>
		<h6>Miniprojeto Spring - 2023.2</h6>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
