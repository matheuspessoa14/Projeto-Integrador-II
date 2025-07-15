<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login | AgendaUp</title>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script src="js/login.js" defer></script> 
</head>

<body>
  <header>
    <div class="logo">AgendaUp</div>
    <nav>
      <a href="#" class="login-btn">Sobre Nós</a>
      <a href="#" class="login-btn">Consultoria</a>
      <a href="#" class="login-btn">Suporte</a>
      <a href="login.jsp" class="login-btn">Login</a>
    </nav>
  </header>

  <main>
    <form name="form1" action="autentica_usuario.jsp" class="form-container login-form" method="POST" onsubmit="return validarCamposLogin()">
      <div class="icon">
        <img src="Imagem/Logo.PNG" alt="Logo AgendaUp">
      </div>
      <label for="usuario">USUÁRIO:</label>
      <input type="email" placeholder="E-mail" name="email" >

      <label for="senha">SENHA:</label>
      <input type="password" placeholder="Senha" name="senha" >
      <p id="mensagem"></p>

      <div class="form-options">
        <a href="#">Esqueceu a Senha?</a>
        <a href="cadastro.jsp">Cadastrar-se</a>
      </div>

      <button type="submit" class="submit-btn">ENTRAR</button>
    </form>
  </main>

  <footer>
    <div class="footer-links">
      <a href="#">Sobre Nós</a>
      <a href="#">Serviços</a>
      <a href="#">Consultoria</a>
      <a href="#">Suporte</a>
      <a href="#">Conheça o Sistema</a>
      <a href="#">Sistema Aplicado</a>
    </div>
    <div class="social">
      <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
      <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
      <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
    </div>
    <p>AgendaUp @ 2025. All rights reserved.</p>
  </footer>

  <script>
    // Mensagem de Sucesso ou Erro
    <%
        String mensagem = (String) session.getAttribute("mensagem");
    %>
        let msg = "<%= mensagem == null ? "" : mensagem %>";
      if (msg != "") {
        document.getElementById("mensagem").innerHTML = msg;
      }
    <%
      // Limpa mensagem da sessÃ£o
      if (mensagem != null) {
        session.removeAttribute("mensagem");
      }
    %>
  </script>

</body>

</html>
