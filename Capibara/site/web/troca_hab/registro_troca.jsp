<%-- 
    Document   : perfil
    Created on : 28 de out. de 2024, 09:01:24
    Author     : nicolas.sribeiro1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Registro de Trocas</title> <!-- Habilidades ja cadastradas -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../tabelas.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">

    </head>
    <header>
        <div >
            <a href="../index.html" class="home"><img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png"></a>
            alt="logo">
        </div>

        <div class="titulo">
            <h1 style="color: #6C4E31">
                Registro de Trocas de Hab.🍂
            </h1> 
        </div>
        <div class="form">

        </div>

    </header>
    <nav>
        <a href="../users/perfil.jsp" class="home">PERFIL</a>
        <a href="../suas_hab/suas_habilidades.jsp" class="garanta_sua"> SUAS HABILIDADES</a>
        <a href="troca_habilidades.jsp" class="salve_capi">TROCA DE HABILIDADES</a>
    </nav>
    <main style="background-image: url('../Folha.gif');background-position: center; height: 700px; background-size: 100% 100%;">

        <div class="texto">
            <%
                /* Declaração de variáveis */
                Connection conecta;
                PreparedStatement st;
                ResultSet resultado;

                /* Conectar com o banco de dados... */
                Class.forName("com.mysql.cj.jdbc.Driver"); //aponta para a biblioteca JDBC
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
                /*Verificar se o produto com o id informado está na tabela do BD*/
                st = conecta.prepareStatement("SELECT * FROM troca_habilidades");
                resultado = st.executeQuery(); //Executa o Select e armazena os dados do usuário
                /* percorre a variável resultado exibindo cada linha de produto */
                out.print("<table>");
                out.print("<caption>Trocas de Hab. Registradas</caption>");
                out.print("<tr><th> Nome da habilidade</th><th> Usuário Solicitante </th><th>Usuário Ofertante</th><th> Horário</th></tr>");
                while (resultado.next()) {
                    out.print("<tr><td>" + resultado.getString("habilidade") + "</td><td>" + resultado.getString("usu_solicitante") + "</td><td>" + resultado.getString("usu_ofertante") + "</td><td>" + resultado.getString("horario") + "</td>");
                }
                out.print("<tr><td colspan='5'> <a class='tab' href=troca_habilidades.jsp> Registrar nova troca </td></tr>");
                out.print("</table>");
            %>
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro & Larissa Tamires © 2024</P>
    </footer>
</body>

</html>