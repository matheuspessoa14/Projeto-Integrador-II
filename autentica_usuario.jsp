<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

  // Recebendo os dados do formulário e armazenando em variáveis
  String email = request.getParameter("email");
  String senha = request.getParameter("senha");

  // Mensagem de sucesso ou erro
  String mensagem = "";
  String destino = "login.jsp";

  // Conexão com o banco de dados MySQL
  String url = "jdbc:mysql://localhost/login_usuario"; // URL do banco de dados
  String user = "root"; // nome do usuário do banco
  String password = ""; // senha do banco

  Connection conexao = null;

  try {
    // Conectar ao banco de dados
    Class.forName("com.mysql.cj.jdbc.Driver");
    conexao = DriverManager.getConnection(url, user, password);

    String sql = "select email, senha from cadastros where email=? and senha=?";
    PreparedStatement ps = conexao.prepareStatement(sql);
    ps.setString(1, email);
    ps.setString(2, senha);

    ResultSet rs = ps.executeQuery();
    if (!rs.isBeforeFirst()) {
      mensagem = "E-mail ou senha inválido";
    } else {
      destino = "home.html";
    }

  } catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    mensagem = "Erro ao conectar ao banco de dados ou inserir os dados.";
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
  response.sendRedirect(destino);
%>