CREATE DATABASE login_usuario;

drop table if exists cadastros;

-- Tabela de Cadastro (dados permanentes do usuário)
CREATE TABLE cadastros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(90) NOT NULL UNIQUE,
    senha VARCHAR(90) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('M', 'F', 'O') NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
