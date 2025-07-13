<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro | AgendaUp</title>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
    <form name="form2" action="atualiza_cadastro.jsp" class="form-container Cadastro-form" method="POST" onsubmit="return true">
      <div class="icon">
        <img src="Imagem/Logo.PNG" alt="Logo AgendaUp">
      </div>
      <input type="text" placeholder="Nome Completo" name="nome" required>
      <input type="tel" id="cpf" name="cpf" placeholder="Digite seu CPF" maxlength="11"
        oninput="this.value = this.value.replace(/[^0-9]/g, '')" required>
      <span id="cpf-error" style="color: red; font-size: 0.8rem;"></span>
      <input type="email" placeholder="E-mail" name="email" required>
      <input type="password" placeholder="Senha" name="senha" required>

      <label>Data de Nascimento:</label>
      <div class="dob">
        <select id="dia" name="dia"></select>
        <select id="mes" name="mes"></select>
        <select id="ano" name="ano"></select>
      </div>

      <label>Gênero:</label>
      <div class="gender-options">
        <label class="gender-box">
          F
          <input type="radio" name="genero" value="F">
        </label>
        <label class="gender-box">
          M
          <input type="radio" name="genero" value="M">
        </label>
        <label class="gender-box">
          Outros
          <input type="radio" name="genero" value="O">
        </label>
      </div>

      <p id="mensagem"></p>

      <button type="submit" class="submit-btn">CADASTRA-SE</button>
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
    const diaSelect = document.getElementById("dia");
    for (let d = 1; d <= 31; d++) {
      const option = document.createElement("option");
      option.value = d;
      option.textContent = d;
      diaSelect.appendChild(option);
    }

    const meses = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];
    const mesSelect = document.getElementById("mes");
    meses.forEach((mes, index) => {
      const option = document.createElement("option");
      option.value = index + 1;
      option.textContent = mes;
      mesSelect.appendChild(option);
    });

    const anoSelect = document.getElementById("ano");
    for (let a = 2025; a >= 1900; a--) {
      const option = document.createElement("option");
      option.value = a;
      option.textContent = a;
      anoSelect.appendChild(option);
    }
  </script>

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