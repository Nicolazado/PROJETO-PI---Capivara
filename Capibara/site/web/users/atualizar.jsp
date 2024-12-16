

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Alterar Usuário</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="3; URL='perfil.jsp'"/>
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
               Alterar Usuário
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
    <main style="background-position: center; height: 700px">

        <div class="texto">
            <%
                // Declarar as variáveis
                Connection conecta;
                PreparedStatement st;
                String n, u, s, usuarioAtual;

                // Receber os dados digitados no formulário
                n = request.getParameter("nome");
                u = request.getParameter("usuario");
                s = request.getParameter("senha");
                try {
                    //Conectar com o banco de dados
                    Class.forName("com.mysql.cj.jdbc.Driver"); //aponta para a biblioteca JDBC
                    conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
                    // Enviar os dados recebidos para a tabela do banco de dados
                    st = conecta.prepareStatement("UPDATE users SET nome=?, senha=? WHERE usuario=?");
                    st.setString(1, n);
                    st.setString(2, s);
                    st.setString(3, u);
                    

                    st.executeUpdate(); //Eexecuta o UPDATE na tabela do BD
                    // Informar o usuário que os dados foram gravados
                    out.print("Usuario alterado com sucesso");
                } catch (SQLException erro) {
                    out.print("Erro = " + erro.getMessage());
                }
            %>  
        </div>
    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro and Larissa Tamires © 2024</P>
    </footer>
</body>

</html>
