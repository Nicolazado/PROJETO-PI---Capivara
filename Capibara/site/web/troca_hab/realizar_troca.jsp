<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>

    <head>
        <title>Confirmar Troca de Habilidades</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../tabelas.css">

    </head>

    <body>

        <header>
            <div>
                <a href="../index.html" class="home"><img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png" alt="logo"></a>
            </div>
            <div class="titulo">
                <h1 style="color: #6C4E31">Confirmar Solicitação de Troca</h1>
            </div>
        </header>

        <nav>
            <a href="../users/perfil.jsp" class="home">PERFIL</a>
            <a href="../suas_hab/suas_habilidades.jsp" class="garanta_sua">SUAS HABILIDADES</a>
            <a href="troca_habilidades.jsp" class="salve_capi">TROCA DE HABILIDADES</a>
        </nav>

        <main style="background-image: url('../Folha.gif');background-position: center; height: 700px; background-size: 100% 100%;">



            <%
                // Recuperar o usuário logado da sessão
                String usuarioSolicitante = (String) session.getAttribute("usuario");  // Usuário logado
                if (usuarioSolicitante == null) {
                    usuarioSolicitante = "admin";  // Caso não tenha usuário logado, coloca o valor padrão
                }

                // Recuperar o usuário ofertante da URL (passado da página anterior solicitar_troca.jsp)
                String usuarioOfertante = request.getParameter("usuario");

                // Recuperar a habilidade oferecida
                String habilidade = request.getParameter("habilidade");

                // Variável para armazenar o horário da habilidade
                String horario = "";

                // Conectar ao banco de dados
                try {
                    // Carregar o driver do MySQL
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");

                    // Buscar o horário para o usuarioSolicitante e a habilidade selecionada na tabela 'suas_habilidades'
                    String sqlHorario = "SELECT horario FROM suas_habilidades WHERE usuario = ? AND nome_hab = ?";
                    PreparedStatement pstHorario = conecta.prepareStatement(sqlHorario);
                    pstHorario.setString(1, usuarioSolicitante);  // Usuário logado
                    pstHorario.setString(2, habilidade);  // Habilidade selecionada

                    ResultSet rs = pstHorario.executeQuery();

                    if (rs.next()) {
                        horario = rs.getString("horario");  // Recupera o horário da tabela
                    }

                    // Preparar a consulta SQL para inserir na tabela 'troca_habilidades'
                    String sql = "INSERT INTO troca_habilidades (usu_solicitante, usu_ofertante, habilidade, horario) VALUES (?, ?, ?, ?)";
                    PreparedStatement st = conecta.prepareStatement(sql);

                    // Definir os parâmetros para o SQL
                    st.setString(1, usuarioSolicitante);  // Usuário que está solicitando a troca
                    st.setString(2, usuarioOfertante);    // Usuário que está oferecendo a troca
                    st.setString(3, habilidade);          // Habilidade selecionada
                    st.setString(4, horario);             // Horário da habilidade, conforme obtido na tabela 'suas_habilidades'

                    // Executar a inserção no banco
                    int rowsAffected = st.executeUpdate();

                    if (rowsAffected > 0) {
            %>
            <p style="color: #FFDBB5;">Troca de habilidade realizada com sucesso!</p>
            <%
            } else {
            %>
            <p style="color: #FFDBB5;">Ocorreu um erro ao realizar a troca.</p>
            <%
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            %>
            <p style="color: red;">Erro: <%= e.getMessage()%></p>
            <%
                }
            %>

            <p><a style="color:#FFDBB5"; href="troca_habilidades.jsp">Voltar para a lista de Trocas de Habilidades</a></p>
        </main>

    </body>

</html>