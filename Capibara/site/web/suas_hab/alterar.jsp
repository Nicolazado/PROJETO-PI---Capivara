
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Alterar Habilidade</title>
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
        <div class="logo">
            <img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png"
                 alt="logo">
        </div>
        <div class="saudacao">
            <h2 style="color:#6C4E31;">Alterar Habilidades</h2>
        </div>
    </header>
    <main style="background-image: url('../capiprof.png');background-position: center; height: 700px">
        <%
            /* Declaração de variáveis */
            String n;
            Connection conecta;
            PreparedStatement st;
            ResultSet resultado;
            /*Receber o id digitado no formulário*/
            n = request.getParameter("usuario");

            /* Conectar com o banco de dados... */
            Class.forName("com.mysql.cj.jdbc.Driver"); //aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
            /*Verificar se o produto com o id informado está na tabela do BD*/
            st = conecta.prepareStatement("SELECT * FROM suas_habilidades WHERE usuario=?");
            st.setString(1, n);
            //coloca o conteúdo da variável i no Select
            resultado = st.executeQuery(); //Executa o Select e armazena os dados do usuário
            /* Verifica se o usuário foi encontrado na tabela do Bando de dados */
            if (resultado.next()) {   //se foi encontrado
%>
        <div class="cads">
            <form method="post" action="atualizar.jsp">
                <p>
                    <label for="n">Nome da habilidade:</label>
                    <input id="n" type="text" name="nome_hab" maxlength="70" value="<%=request.getParameter("nome_hab")%>">
                </p>      
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="u">Usuário:</label>
                    <input id="u" type="text" name="usuario" maxlength="20" value="<%=request.getParameter("usuario")%>">
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="h">Horário:</label>
                    <select name="horario">
                        <option value='manha'>Manhã</option>
                        <option value='tarde'>Tarde</option>
                        <option value='noite'>Noite</option>
                    </select>
                </p>      
                <p>
                    <input class="sal" type="submit" value="Salvar Alteração">
                </p>            
            </form>         
        </div>
        <%
            } else { // Se não foi encontrado
                out.print("habilidade não cadastrada");
            }

        %>
    </main>
    <hr id="sla">
    <footer>
        <p>All rights reserved to Nicolas Ribeiro © 2024</p>
    </footer>
</body>

</html>
