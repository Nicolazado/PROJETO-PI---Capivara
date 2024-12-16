<%-- 
    Document   : cadastro_usuarios
    Created on : 16 de set. de 2024, 10:29:50
    Author     : evandro.cteruel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Cadastro de Ususários</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="2; URL='../index.html'"/>
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
               Cadastro de Usuário
        </div>
        <div class="form">

        </div>

    </header>


    <main style="background-position: center; height: 700px">

        <div class="texto">
            <%
                Connection conn;
                PreparedStatement st;
                String n, s, u;
                //Receber os dados digitados no formulário de cadastro
                n = request.getParameter("nome");
                u = request.getParameter("usuario");
                s = request.getParameter("senha");
                //Conectar com o banco de dados
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
                    //Salvar os dados recebido na tabela users do BD
                    st = conn.prepareStatement("INSERT INTO users VALUES(?,?,?)");
                    st.setString(1, n);
                    st.setString(2, u);
                    st.setString(3, s);
                    st.executeUpdate(); //Executa o INSERT na tabela
                    out.print("Usuário cadastrado com sucesso");
                } catch (SQLException erro) {
                    if (erro.getMessage().contains("Duplicate entry")) {
                        out.print("Este Usuário já está cadastrado");
                    } else {
                        out.print("Entre em contato com o ADM");
                    }
                }
            %>
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro and Larissa Tamires © 2024</P>
    </footer>
</body>

</html>