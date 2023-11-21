<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de tarefas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <br>
    <br>
    <c:if test="${not empty mensagem}">
        <div class="alert alert-info" style="text-align: center;">
            <span>${mensagem}</span>
        </div>
    </c:if>

    <header class="container" style="justify-content: center; display: flex; margin-top: 150px;">
        <h1><i class="bi bi-list-task" style="background-color: rgb(238, 238, 238); border-radius: 5px; padding: 5px;">Lista de Tarefas</i></h1>
    </header>

    <main class="container" style="justify-content: center; display: flex; text-align: center;">
        <form:form action="cadastrausuario" modelAttribute="usuario" method="POST" style="align-items: center; justify-content: center; flex-direction: column; text-align: center;">
            <div class="input-group input-group-lg" style="padding-top: 10px;">
                <div class="input-group-prepend">
                    <span class="input-group-text">E-mail:</span>
                </div>
                <form:input path="email" type="text" class="form-control" aria-label="Usuário" aria-describedby="basic-addon1"/>
            </div>

            <div class="input-group input-group-lg" style="padding-top: 10px;">
                <div class="input-group-prepend">
                    <span class="input-group-text">Senha:</span>
                </div>
                <form:input path="senha" type="password" class="form-control" aria-label="Senha" aria-describedby="basic-addon1"/>
            </div>

            <button type="submit" style="width: 130px; margin-top: 10px;" class="btn btn-dark">Cadastrar</button>
        </form:form>
    </main>

    <footer class="container" style="justify-content: center; flex-direction: column; text-align: center;">
        <a href="/todo-app/welcome"><button class="btn btn-dark" style="width: 130px; margin: 10px;">Voltar</button></a>
        <h6>Miniprojeto Spring - 2023.2</h6>
    </footer>
</body>
</html>
