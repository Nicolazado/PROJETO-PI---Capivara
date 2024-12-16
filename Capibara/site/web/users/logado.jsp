
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <body>

    <head>
        <title>Logado</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
        <style>

            .container {
                position: absolute; /* Posiciona a lista fixamente */
                top: 20px;       /* Distância do topo */
                right: 20px;     /* Fixa no lado direito */
                width: 400px;
                margin: 50px auto;
                background-color: #A67B5B;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                transition: height 0.3s ease, width 0.3s ease;
                overflow: hidden;
            }
            #taskList {
                max-height: 200px; /* Ajuste conforme necessário */
                overflow-y: auto;  /* Adiciona scroll se necessário */
            }
            #minimizeButton {

                background-color: transparent;
                border: none;
                color: white;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 4px;
                position: absolute;
                top: 2px;
                right: 10px;
            }
            h2 {
                text-align: center;
                color: #FFDBB5;
            }
            input[type="text"] {
                width: 90%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            ul li {
                padding: 10px;
                background-color:#6C4E31;
                color: #FFDBB5;
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 4px;

            }
            ul li span {
                flex-grow: 1;
                color: #FFDBB5;/* Garantir cor visível */
            }
            ul li button {
                background-color: #FFDBB5;
                border: none;
                color: black;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 4px;
                margin-left: 10px;
            }
            ul li button:hover {
                background-color: #A67B5B;
                color: white;
            }
        </style>
    </head>
    <header>
        <div >
            <a href="../index.html" class="home"><img class="logo" src="https://images.vexels.com/media/users/3/318410/isolated/preview/eba4aa0cd5cf829edb21df16da01a6a4-cute-capybara-playing-with-a-butterfly.png"></a>
            alt="logo">
        </div>

        <div class="saudacao">
            <p style="color: #6C4E31">
                Seja Bem-Vindo(a), <%= request.getParameter("nome")%>🍂
            </p> 
        </div>
        <div class="container" id="todoContainer">
            <h2>Minha To-Do List</h2>
            <button id="minimizeButton" onclick="toggleMinimize()">Minimizar</button>
            <input type="text" id="taskInput" placeholder="Digite uma nova tarefa">
            <ul id="taskList"></ul>
        </div>

        <script>
            let isMinimized = false;

            function toggleMinimize() {
                const container = document.getElementById('todoContainer');
                const input = document.getElementById('taskInput');
                const taskList = document.getElementById('taskList');
                const minimizeButton = document.getElementById('minimizeButton');

                if (isMinimized) {
                    // Expande a To-Do List
                    input.classList.remove('hidden');
                    taskList.classList.remove('hidden');
                    minimizeButton.textContent = "Minimizar";
                    container.style.height = 'auto';  // Ajusta a altura de acordo com o conteúdo
                    container.style.padding = '20px'; // Restaura o padding original
                    isMinimized = false;
                } else {
                    // Minimiza a To-Do List
                    input.classList.add('hidden');
                    taskList.classList.add('hidden');
                    minimizeButton.textContent = "Expandir";
                    container.style.height = '50px';  // Define altura fixa para minimizar
                    container.style.padding = '10px'; // Diminui o padding ao minimizar
                    isMinimized = true;
                }
            }
            const taskInput = document.getElementById('taskInput');
            const taskList = document.getElementById('taskList');

            taskInput.addEventListener('keypress', function (event) {
                if (event.key === 'Enter') {
                    addTask();
                }
            });

            function addTask() {
                const taskText = taskInput.value.trim();
                if (taskText !== "") {
                    const listItem = document.createElement('li');

                    // Adiciona o texto da tarefa e o botão de remover
                    const taskSpan = document.createElement('span');
                    taskSpan.textContent = taskText;
                    taskSpan.style.color = '#FFDBB5'; // Garantir visibilidade do texto

                    const removeButton = document.createElement('button');
                    removeButton.textContent = 'Remover';
                    removeButton.onclick = function () {
                        taskList.removeChild(listItem);
                    };

                    // Anexa o span e o botão ao li
                    listItem.appendChild(taskSpan);
                    listItem.appendChild(removeButton);

                    // Adiciona o li à lista de tarefas
                    taskList.appendChild(listItem);

                    // Limpa o campo de entrada
                    taskInput.value = "";
                }
            }
        </script>
    </header>

    <nav>
        <a  href="perfil.jsp" class="home">PERFIL</a>
        <a href="../suas_hab/suas_habilidades.jsp" class="garanta_sua"> SUAS HABILIDADES</a>
        <a href="../troca_hab/troca_habilidades.jsp" class="salve_capi">TROCA DE HABILIDADES</a>
    </nav>
    <main>
        <div class="video">

        </div>
        <div class="texto">
            <h2 style="margin: 15px; font-size: 70px; color: #FFDBB5;" class="salve">Sobre Nós</h2>
            <p>
                Mantendo o jeito Senac de inovar, adaptar, aprender e ensinar, apresentamos o Capiva Conecta, uma plataforma que amplia o aprendizado além de nossas salas de aula. Com base no princípio "Uma mão lava a outra", o Capiva Conecta oferece um espaço onde todos podem compartilhar seus conhecimentos e habilidades, criando uma verdadeira rede de aprendizado colaborativo. <br><br>

                Aqui, você pode oferecer suas expertises e, em troca, aprender novas habilidades com outros participantes. É uma oportunidade de crescimento mútuo, onde cada interação enriquece não apenas quem ensina, mas também quem aprende. Acreditamos que o aprendizado é uma via de mão dupla e que todos têm algo valioso a compartilhar. <br><br>

                Venha fazer parte do Capiva Conecta! Juntos, podemos transformar a maneira como aprendemos e ensinamos, criando uma comunidade vibrante e cheia de oportunidades. Vamos unir nossas forças e construir um futuro de aprendizado compartilhado, onde cada um contribui e se beneficia dessa troca de saberes.

            </p>

            <button id="butt" onclick="location.href = 'https://pt.wikipedia.org/wiki/Capivara'">Saiba Mais</button>
        </div>


    </main>

    <footer>
        <P>All rights reserved to Nicolas Ribeiro & Larissa Tamires © 2024</P>
    </footer>
</body>

</html>