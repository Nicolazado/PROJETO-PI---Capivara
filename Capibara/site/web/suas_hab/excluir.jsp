<%-- 
    Document   : excluir
    Created on : 28 de out. de 2024, 14:26:46
    Author     : Mommys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Excluir Habilidade</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="2; URL='suas_habilidades.jsp'"/>
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../tabelas.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
    </head>
    <header>
        <div >
            <img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png"
                 alt="logo">
        </div>

        <div class="titulo">
            <h1 style="color: #6C4E31">
                Excluir Habilidade
            </h1> 
        </div>
        <div class="form">

        </div>

    </header>

    <nav>
        <a  href="../user/perfil.jsp" class="home">PERFIL</a>
        <a href="suas_habilidades.jsp" class="garanta_sua"> SUAS HABILIDADES</a>
          <a href="../troca_hab/troca_habilidades.jsp" class="salve_capi">TROCA DE HABILIDADES</a>
    </nav>
    <main style="background-position: center; height: 700px">

        <div class="texto">
               <%
            // Declarar as variáveis
            Connection conecta;
            PreparedStatement st;
            String n;
            // Receber o id digitado no formulário
            n = request.getParameter("usuario");
            //Conectar com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver"); //aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
            // Excluir o produto da tabela do banco de dados
            st = conecta.prepareStatement("DELETE from suas_habilidades WHERE usuario=?");
            st.setString(1, n);
            int status = st.executeUpdate(); //Executa o DELETE na tabela do BD
            if(status==1){
                out.print("Habilidade Excluída com sucesso");
            }
          %>  
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro & Larissa Tamires © 2024</P>
    </footer>
</body>

</html>
