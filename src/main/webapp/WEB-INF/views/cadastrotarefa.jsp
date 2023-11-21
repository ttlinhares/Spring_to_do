<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cadastro de Tarefa</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<div class="container mt-5">
		<c:if test="${not empty mensagem}">
			<div class="alert alert-info" style="text-align: center;">
				<span>${mensagem}</span>
			</div>
		</c:if>
		<h2>Cadastro de Tarefa</h2>
		<form:form action="cadastratarefa" modelAttribute="tarefa" method="POST" class="mt-4">
			<div class="form-group">
				<form:label path="descricao">Descrição:</form:label>
				<form:input path="descricao" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="dataConclusao">Data de Conclusão:</form:label>
				<form:input path="dataConclusao" type="datetime-local"
					class="form-control" />
			</div>

			<div class="form-group form-check">
				<form:checkbox path="concluido" class="form-check-input" />
				<form:label path="concluido" class="form-check-label">Concluído</form:label>
			</div>

			<button type="submit" class="btn btn-primary">Salvar</button>
			<a href="/todo-app/listar"></a>
		</form:form>
	</div>

</body>
</html>
