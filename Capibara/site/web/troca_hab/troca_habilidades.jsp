
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Troca de Habilidades</title> <!-- Habilidades ja cadastradas -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../tabelas.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">


        <style>


            form {
                font-family: Arial, sans-serif;
                margin: 25px;
                padding: 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;

            }

            form label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                font-size: 16px;
            }

            form input[type="text"],
            form select {
                width: 100%;
                padding: 15px;
                margin-bottom: 20px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            form button {
                padding: 15px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                background-color:#FFDBB5;
                color: #6C4E31;
                cursor: pointer;
                width: 100%;
            }


        </style>
    </head>
    <header>
        <div >
            <a href="../index.html" class="home"><img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png"></a>
            alt="logo">
        </div>

        <div class="titulo">
            <h1 style="color: #6C4E31">
                Troca de Habilidades 🍂
            </h1> 
        </div>
        <div class="form">

        </div>

    </header>
    <nav>
        <a  href="../users/perfil.jsp">PERFIL</a>
        <a href="../suas_hab/suas_habilidades.jsp"> SUAS HABILIDADES</a>
        <a href="troca_habilidades.jsp">TROCA DE HABILIDADES</a>
        <a href="registro_troca.jsp">REGISTRO DE TROCA DE HABILIDADE</a>
    </nav>
    <main style="background-image: url('../Folha.gif');background-position: center; height: 700px; background-size: 100% 100%;">

        <div class="texto">

            <form method="GET" action="troca_habilidades.jsp">
                <label style="color: #FFDBB5" for="habilidade">Habilidade:</label>
                <input type="text" id="habilidade" name="habilidade" placeholder="Digite a habilidade">

                <label style="color: #FFDBB5" for="horario">Horário:</label>
                <select id="horario" name="horario">
                    <option value="">Todos</option>
                    <option value="manhã">Manhã</option>
                    <option value="tarde">Tarde</option>
                    <option value="noite">Noite</option>    
                </select>

                <button type="submit">Buscar</button>
            </form>

            <%
                // Parâmetros recebidos do formulário
                String habilidade = request.getParameter("habilidade");
                String horario = request.getParameter("horario");

                // Conexão com o banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");

                // Construção da consulta SQL com filtros
                String sql = "SELECT * FROM suas_habilidades WHERE 1=1";

                if (habilidade != null && !habilidade.isEmpty()) {
                    sql += " AND nome_hab LIKE ?";
                }
                if (horario != null && !horario.isEmpty()) {
                    sql += " AND horario = ?";
                }

                PreparedStatement st = conecta.prepareStatement(sql);

                int paramIndex = 1; // Índice para os parâmetros
                if (habilidade != null && !habilidade.isEmpty()) {
                    st.setString(paramIndex++, "%" + habilidade + "%");
                }
                if (horario != null && !horario.isEmpty()) {
                    st.setString(paramIndex++, horario);
                }

                // Executa a consulta
                ResultSet resultado = st.executeQuery();
            %>

            <table style="margin-bottom: 50px">
                <tr>
                    <th>Habilidade</th>
                    <th>Usuário</th>
                    <th>Horário</th>
                    <th>Ação</th>
                </tr>
                <%
                    // Itera pelos resultados da consulta
                    while (resultado.next()) {
                %>
                <tr>
                    <td><%= resultado.getString("nome_hab")%></td>
                    <td><%= resultado.getString("usuario")%></td>
                    <td><%= resultado.getString("horario")%></td>
                    <td>
                        <!-- Link para conectar habilidades -->
                        <a class="tab" href="solicitar_troca.jsp?habilidade=<%=resultado.getString("nome_hab")%>&usuario=<%= resultado.getString("usuario")%>&horario=<%= resultado.getString("horario")%>">
                            Solicitar Troca
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro & Larissa Tamires © 2024</P>
    </footer>

</body>

</html>


