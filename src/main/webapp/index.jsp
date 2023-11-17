<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de tarefas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>

    <body>
        <header class="container">
            <h1>Olá Mundo, este é um projeto Spring MVC de uma lista de tarefas.</h1>
        </header>

        <main class="container">
            <br>
            <h2>Funcionalidades:</h2>

            <p>&#10004; Cadastro de Tarefas: Usuários inserem a descrição da atividade e a data limite.</p>
            <p>&#10004; Listagem de Tarefas: Mostrar todas as tarefas cadastradas com opções para editar e concluir cada tarefa.
            </p>
            <p>&#10004; Destacar tarefas atrasadas.</p>
            <p>&#10004; Edição de Tarefas: Permitir correções em tarefas cadastradas.</p>
            <p>&#10004; Concluir Tarefa: Remover tarefas concluídas da lista.</p>
            <br>
            <h3>Restrições de Segurança:</h3>

            <p>&#10004; Prevenção contra XSS Injection.</p>
            <p>&#10004; Prevenção contra CSRF em submissões de formulários.</p>


            <p>&#10004; Interface de Usuário: Uso do Bootstrap para templates de tela.</p>
        </main>

        <footer class="container" style="display: flex; flex-direction: column; text-align: center;">
            <p>Autor: Thiago Linhares <br>
                Instrutor: Thyago Maia<br>
                Curso: Sistemas para internet<br>
                Unipê 2023.2<br>
            </p>
            <a href="/todo-app/welcome"><button class="btn btn-dark" style="height: 60px; width: 100px;">Acessar</button></a>
            <br><br>
        </footer>

    </body>

    </html>
