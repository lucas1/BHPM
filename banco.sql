-- tabela de cadastro de usuários
CREATE TABLE usuario (
  usu_id INT NOT NULL,
  usu_nome VARCHAR(100) NOT NULL,
  usu_email VARCHAR(120) NOT NULL,
  usu_data TIMESTAMP NOT NULL,
  PRIMARY KEY(usu_id)
);
