

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Alterar Habilidade</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="3; URL='suas_habilidades.jsp'"/>
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
                Alterar Habilidade
            </h1> 
        </div>
        <div class="form">

        </div>

    </header>

    <nav>
        <a  href="../users/perfil.jsp" class="home">PERFIL</a>
        <a href="suas_habilidades.jsp" class="garanta_sua"> SUAS HABILIDADES</a>
        <a href="../troca_hab/troca_habilidades.jsp" class="salve_capi">TROCA DE HABILIDADES</a>
    </nav>
    <main style="background-image: url('../capiprof.png');background-position: center; height: 700px">

        <div class="texto">
            <%
                // Declarar as variáveis
                Connection conecta;
                PreparedStatement st;
                String n, u, h;

                // Receber os dados digitados no formulário
                n = request.getParameter("nome_hab");
                u = request.getParameter("usuario");
                h = request.getParameter("horario");

                try {
                    // Conectar com o banco de dados
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Aponta para a biblioteca JDBC
                    conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");

                    // Preparar o comando SQL para atualizar os dados
                    st = conecta.prepareStatement("UPDATE suas_habilidades SET nome_hab=?, horario=? WHERE usuario=?");
                    st.setString(1, n);
                    st.setString(2, h);
                    st.setString(3, u);
                    // Executar o UPDATE na tabela do BD
                    int rowsAffected = st.executeUpdate();

                    // Informar o usuário sobre o sucesso ou falha
                    if (rowsAffected > 0) {
                        out.print("Habilidade Alterada com sucesso.");
                    } else {
                        out.print("Erro: Nenhuma Habilidade encontrada para alterar, verifique se o usuario esta correto.");
                    }

                } catch (SQLException erro) {
                    out.print("Erro ao atualizar a habilidade: " + erro.getMessage());
                }
            %>  
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro and Larissa Tamires © 2024</P>
    </footer>
</body>

</html>
