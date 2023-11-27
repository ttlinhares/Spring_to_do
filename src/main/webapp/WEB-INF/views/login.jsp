<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Tarefas</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<c:if test="${not empty mensagem}">
			<div class="alert alert-info" style="text-align: center;">
				<span>${mensagem}</span>
			</div>
		</c:if>

    <h1>Lista de Tarefas</h1>

    <table class="table table-hover">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Descrição</th>
            <th scope="col">Data de Conclusão</th>
            <th scope="col">Concluído</th>
            <th scope="col">Ações</th>

        </tr>
        <c:forEach var="tarefa" items="${tarefas}">
        <tbody>
            <tr>
                <td scope="row">${tarefa.id}</td>
                <td scope="row">${tarefa.descricao}</td>
                <td scope="row"> <fmt:parseDate value="${tarefa.dataConclusao}" var="convertido" pattern="yyyy-MM-dd'T'HH:mm" />
                <fmt:formatDate value="${convertido}" pattern="dd/MM/yyyy HH:mm" />
                </td>
                <td scope="row">
                <input type="checkbox" name="concluido${tarefa.id}" ${tarefa.concluido ? 'checked' : ''} />
                </td>
                <td scope="row">
                <a href="/todo-app/editar/${tarefa.id}"><button class="btn btn-secondary">Editar</button></a>
                <a href="/todo-app/excluir/${tarefa.id}"><button class="btn btn-danger">Excluir</button></a>

                </td>
            </tr>
        </tbody>
        </c:forEach>
    </table>

    <a href="/todo-app/cadastratarefa">Adicionar Tarefa</a>
    <a href="/todo-app/logout">Sair</a>
</body>
</html>
