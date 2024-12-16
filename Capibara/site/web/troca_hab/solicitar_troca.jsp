
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <body>
    <head>
        <title>Solicitar Troca de Habilidades</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../tabelas.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
    </head>
    <header>
        <div>
            <a href="../index.html" class="home"><img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png" alt="logo"></a>
        </div>
        <div class="titulo">
            <h1 style="color: #6C4E31">Troca de Habilidades 🍂</h1>
        </div>
    </header>

    <nav>
        <a href="../users/perfil.jsp" class="home">PERFIL</a>
        <a href="../suas_hab/suas_habilidades.jsp" class="garanta_sua">SUAS HABILIDADES</a>
        <a href="troca_habilidades.jsp" class="salve_capi">TROCA DE HABILIDADES</a>
    </nav>

    <main style="background-image: url('../Folha.gif');background-position: center; height: 700px; background-size: 100% 100%;">
        <div class="texto">


            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
                PreparedStatement st;
                String horario = request.getParameter("horario");
                st = conecta.prepareStatement("Select * FROM suas_habilidades WHERE horario=?");
                st.setString(1, horario);
                ResultSet resultado = st.executeQuery();
            %>

            <table style="margin-bottom: 50px">
                <caption>Habilidades Disponíveis para Troca</caption>
                <tr>
                    <th>Habilidade</th>
                    <th>Usuário</th>
                    <th>Horário</th>
                    <th>Ação</th>
                </tr>
                <%
                    // Exibir as habilidades e usuários
                    while (resultado.next()) {
                %>

                <tr>
                    <td><%= resultado.getString("nome_hab")%></td>
                    <td><%= resultado.getString("usuario")%></td>
                    <td><%= resultado.getString("horario")%></td>
                    <td>
                        <!-- Link para solicitar a troca de habilidade -->
                        <a class="tab" href="realizar_troca.jsp?habilidade=<%= resultado.getString("nome_hab")%>&usuario=<%= resultado.getString("usuario")%>&horario=<%= resultado.getString("horario")%>">
                            Trocar Habilidades
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
