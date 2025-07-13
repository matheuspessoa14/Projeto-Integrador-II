<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
  // Recebendo os dados do formulário e armazenando em variáveis
  String nome = request.getParameter("nome");
  String cpf = request.getParameter("cpf");
  String email = request.getParameter("email");
  String senha = request.getParameter("senha");
  String dia = request.getParameter("dia");
  String mes = request.getParameter("mes");
  String ano = request.getParameter("ano");
  String genero = request.getParameter("genero");

  // Montar string no formato 'YYYY-MM-DD' para colocar no banco
  String dataNascimento = ano + "-" + (mes.length() == 1 ? "0" + mes : mes) + "-" + (dia.length() == 1 ? "0" + dia : dia);

  // Mensagem de sucesso ou erro
  String mensagem = "";
  String destino = "cadastro.jsp";

  // Conexão com o banco de dados MySQL
  String url = "jdbc:mysql://localhost/login_usuario"; // URL do banco de dados
  String user = "root"; // nome do usuário do banco
  String password = ""; // senha do banco

  Connection conexao = null;

  try {
    // Conectar ao banco de dados
    Class.forName("com.mysql.cj.jdbc.Driver");
    conexao = DriverManager.getConnection(url, user, password);

    // VERIFICA SE CPF OU EMAIL JÁ EXISTEM
    String checkSql = "SELECT * FROM cadastros WHERE cpf = ? OR email = ?";
    PreparedStatement checkStmt = conexao.prepareStatement(checkSql);
    checkStmt.setString(1, cpf);
    checkStmt.setString(2, email);
    ResultSet rs = checkStmt.executeQuery();

    if (rs.next()) {
        // Já existe cadastro com o mesmo CPF ou email
        mensagem = "CPF ou E-mail já cadastrado.";
    } else {

      String sql = "INSERT INTO cadastros (nome_completo, cpf, email, senha, data_nascimento, genero) VALUES (?, ?, ?, ?, ?, ?)";;
      PreparedStatement ps = conexao.prepareStatement(sql);
      ps.setString(1, nome);
      ps.setString(2, cpf);
      ps.setString(3, email);
      ps.setString(4, senha);
      ps.setString(5, dataNascimento);
      ps.setString(6, genero);

      // Executar a inserção
      int rowsAffected = ps.executeUpdate();

      if (rowsAffected > 0) {
        mensagem = "Cadastrado realizado com sucesso!";
      } else {
        mensagem = "Erro ao cadastrar o usuário.";
      }
    }
  } catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    mensagem = "Erro ao conectar ao banco de dados ou inserir os dados." + e.getMessage();
  } finally {
    try {
      conexao.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
  // Redirecionar com a mensagem
  if (!mensagem.equals("")) {
    session.setAttribute("mensagem", mensagem);
  }
  response.sendRedirect("cadastro.jsp");
%>