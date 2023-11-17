<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <header class="container" style="justify-content: center; display: flex; margin-top: 150px;">
        <h1><i class="bi bi-list-task" style="background-color: rgb(238, 238, 238); border-radius: 5px; padding: 5px;">Listar Tarefas</i></h1>
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
				<!-- Supõe-se que as tarefas são passadas para a view -->
				<%-- for (Tarefa tarefa : tarefas) { --%>
					<tr>
						<th scope="row"><%-- tarefa.getId() --%></th>
						<td><%-- tarefa.getDescricao() --%></td>
						<td><%-- tarefa.getDataConclusao() --%></td>
						<td>
							<input type="checkbox" name="concluido" <%-- if(tarefa.getConcluido().equals("Sim")) out.print("checked"); --%> disabled>
						</td>
						<td><a href="/editar-tarefa/<%-- tarefa.getId() --%>" class="btn btn-dark">Editar</a></td>
						<td>
							<form action="/excluir-tarefa" method="post">
								<input type="hidden" name="tarefaId" value="<%-- tarefa.getId() --%>">
								<button type="submit" class="btn btn-danger">Excluir</button>
							</form>
						</td>
					</tr>
				<%-- } --%>
			</tbody>
		</table>
	</main>

    <footer class="container" style="justify-content: center; flex-direction: column; text-align: center;">
		<a href="/todo-app/cadastratarefa" class="btn btn-dark" style="width: 130px; margin: 10px;">Cadastrar</a>
        <a href="/todo-app/welcome" class="btn btn-dark" style="width: 130px; margin: 10px;">Voltar</a>
		<a href="/todo-app/welcome" class="btn btn-dark" style="width: 130px; margin: 10px;">Sair</a>
        <h6>Miniprojeto Spring - 2023.2</h6>
    </footer>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
