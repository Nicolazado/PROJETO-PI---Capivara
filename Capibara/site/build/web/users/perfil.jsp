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
        <title>Seu Perfil</title>
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
                Seu Perfil🍂
            </h1> 
        </div>
        <div class="form">

        </div>

    </header>

    <nav>
        <a  href="perfil.jsp" class="home">PERFIL</a>
        <a href="../suas_hab/suas_habilidades.jsp" class="garanta_sua"> SUAS HABILIDADES</a>
        <a href="../troca_hab/troca_habilidades.jsp" class="salve_capi">TROCA DE HABILIDADES</a>
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
                st = conecta.prepareStatement("SELECT * FROM users");
                resultado = st.executeQuery(); //Executa o Select e armazena os dados do usuário
                /* percorre a variável resultado exibindo cada linha de produto */
                out.print("<table >");
                out.print("<caption>Relatório de Usuários</caption>");
                out.print("<tr><th> Nome </th><th> Usuário </th><th> Senha </th><th>Exclusão</th><th>Alteração</th></tr>");
                while (resultado.next()) {
                    out.print("<tr><td>" + resultado.getString("nome") + "</td><td>" + resultado.getString("usuario") + "</td><td>" + resultado.getString("senha") + "</td>");
                    out.print("<td> <a class='tab'  href=excluir.jsp?usuario=" + resultado.getString("usuario") + "> Excluir </a> </td>");
                    out.print("<td> <a class='tab'  href=alterar.jsp?usuario=" + resultado.getString("usuario") + "> Alterar </a> </td> </tr>");

                }
                out.print("<tr><td colspan='5'> <a class='tab' href=cadastrese.html> Cadastrar </td></tr>");
                out.print("</table>");
            %>
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro & Larissa Tamires © 2024</P>
    </footer>
</body>

</html>