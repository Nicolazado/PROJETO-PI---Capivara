<%-- 
    Document   : excluir
    Created on : 28 de out. de 2024, 14:26:46
    Author     : Mommys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Validar Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="4; URL='../index.html'"/>
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
                Logar🍂
            </h1> 
        </div>
        <div class="form">

        </div>

    </header>

    <main style="background-position: center; height: 700px">

        <div class="texto">
            <% String u, s;
                Connection conn;
                ResultSet resultado;
                /*Recebe o usuário e senha digitados
                 no formulário*/ u = request.getParameter("usuario");
                s = request.getParameter("senha");
                /*Conectar com o banco de dados*/ Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
                /* Busca o usuario e senha digitado, na tabela iusers do BD*/ PreparedStatement st = conn.prepareStatement("SELECT * FROM users WHERE usuario=? AND senha=?");
                st.setString(1, u);
                st.setString(2, s);
                resultado = st.executeQuery();
                /*executa o
                 select*/ if (resultado.next()) {
                    /*se encontrou o ususario*/
                    response.sendRedirect("logado.jsp?nome=" + resultado.getString("nome"));
                } else {
                    out.print("Usuário e/ou senha incorretos ");
                }


            %>    
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro and Larissa Tamires © 2024</P>
    </footer>
</body>

</html>
