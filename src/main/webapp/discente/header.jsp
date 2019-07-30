<header style="margin-bottom: 2%">
    <nav class="navbar navbar-expand-lg navbar-dark green darken-3">
        <!--Botão home-->
        <a class="navbar-brand" href="/OMT/home.jsp">IFAM - Sistema de Egressos</a>

        <!--Botão Menu tela pequena-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".barraPrincipal" aria-controls="barraPrincipal"
                aria-expanded="false" aria-label="Alternar navegação">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!--Conteúdo ajustável-->
        <div class="collapse navbar-collapse barraPrincipal">
            <!--Links-->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="" class="nav-link"><i class="fa fa-question-circle fa-lg mr-1"></i>Suporte</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link"><i class="fa fa-universal-access fa-lg mr-1"></i>Acessibilidade</a>
                </li>

                <li class="nav-item">
                    <a href="http://www2.ifam.edu.br" class="nav-link">
                        <img class="mr-1" height="25" width="20" src="/OMT/img/logoIF.png"/>Site do IFAM</a>
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle nav-link active"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user fa-lg mr-1"></i>Minha conta
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="notificacao.jsp"><i class="fa fa-bell fa-lg mr-1"></i>Notificações
                             <span class="badge badge-primary badge-pill">14</span>
                        </a>
                        <a class="dropdown-item" href="../discente/alterarPerfil.jsp"><i class="fa fa-user-edit fa-lg mr-1"></i>Meu perfil</a>
                        <a class="dropdown-item" href="../discente/curriculo.jsp"><i class="fa fa-address-card fa-lg mr-1"></i>Currículo</a>
                        <a class="dropdown-item" href="/OMT/LoginServlet" alt="Sair" ><i class="fa fa-sign-out-alt fa-lg mr-1"></i>Encerrar sessão</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>