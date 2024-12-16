
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Alterar Usuário</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
        <style>

            div.cads> form > p > input.sal{
                color: #6C4E31;
                background-color: #FFDBB5;
                border-radius: 10px;
                align-self: center;
                margin: 0;
                width: 30%;
                height: 40px;
            }
            div.friend > img {
                width: 100%;
                height: 600px;
                flex: 70%;
            }
            main {
                width: 100%;
                height: 800px;
                display:flex;
                justify-content: center;

            }
            div.cads > form {

                flex: 30%;
            }
            form > p > label {
                color:  #FFDBB5;
            }
        </style>

    </head>
    <header>
        <div >
            <a href="../index.html" class="home"><img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png"></a>
            alt="logo">
        </div>
        <div class="saudacao">
            <h1 style="color:#6C4E31;">Alterar Usuário</h1>
        </div>
    </header>
    <main>
        <%
            /* Declaração de variáveis */
            String u;
            Connection conecta;
            PreparedStatement st;
            ResultSet resultado;
            /*Receber o id digitado no formulário*/
            u = request.getParameter("usuario");
            /* Conectar com o banco de dados... */
            Class.forName("com.mysql.cj.jdbc.Driver"); //aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
            /*Verificar se o produto com o id informado está na tabela do BD*/
            st = conecta.prepareStatement("SELECT * FROM users WHERE usuario=?");
            st.setString(1, u); //coloca o conteúdo da variável i no Select
            resultado = st.executeQuery(); //Executa o Select e armazena os dados do usuário
            /* Verifica se o usuário foi encontrado na tabela do Bando de dados */
            if (resultado.next()) {   //se foi encontrado
        %>
        <div class="cads">
            <form method="post" action="atualizar.jsp">
                <p>
                    <label for="n">Nome</label>
                    <input id="n" type="text" name="nome" maxlength="70" size="70" value="<%= resultado.getString("nome")%>"  >
                </p>
                <p>
                    <label for="u">Usuario</label>
                    <input id="u" type="text"  name="usuario" maxlength="30" size="30" value="<%= resultado.getString("usuario")%>" readonly required>
                </p>            
                <p>
                    <label for="s">Senha</label>
                    <input id="s" type="text"  name="senha" maxlength="30" size="30" value="<%= resultado.getString("senha")%>">
                </p>                   
                <p>
                    <input type="submit" value="Salvar Alteração">                
                </p>
            </form>         
        </div>
        <%
            } else { // Se não foi encontrado
                out.print("Usuário não cadastrado");
            }

        %>
        <div class="friend">
            <img src="https://media3.giphy.com/media/OgUorGH0Z75b3unoPA/giphy.gif?cid=6c09b9521hco2t9hz4dcvqofdldhhtujdc3u92ax1kvvv6ph&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=s" alt="cap friend"/>
        </div>

    </main>
    <hr id="sla">
    <footer>
        <p>All rights reserved to Nicolas Ribeiro and Larissa Tamires © 2024</p>
    </footer>
</body>

</html>
