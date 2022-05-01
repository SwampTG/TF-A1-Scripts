--  ------  << TF1 - Acompanhamento psicopedagogico >>  ----------
--
--             SCRIPT DE CONTROLE (DDL)
--
--  Data Criacao ...........: 25/04/2022
--  Autor(es) ..............: Adrian Soares, Amanda Nobre, Antonio Carvalho, Artur Vieira
--  Banco de Dados .........: MySQL 8.0
--  Base de Dados (nome) ...: TF_1A_adrianlopes
--
--  Ultimas Alteracoes:
--    28/04/2022 => Alteracao do nome da base de dados e criação de roles
--
--  PROJETO => 01 Base de Dados
--         	=> 33 Tabelas
--          => 03 Papéis
--          => 09 Usuarios
--
-- ---------------------------------------------------------

USE TF_1A_adrianlopes;

CREATE ROLE superuser;
GRANT ALL PRIVILEGES ON TF_1A_adrianlopes.* TO superuser;

CREATE USER amanda IDENTIFIED BY 'admin2022amanda';
CREATE USER antonio IDENTIFIED BY 'admin2022antonio';
CREATE USER adrian IDENTIFIED BY 'admin2022adrian';
GRANT superuser TO amanda, antonio, adrian;

CREATE ROLE psicopedagogo;
GRANT SELECT, INSERT, UPDATE, DELETE ON TF_1A_adrianlopes.* TO psicopedagogo;

CREATE USER joanamarques IDENTIFIED BY 'joanamarques2022';
CREATE USER camilabraga IDENTIFIED BY 'camilabraga2022';
CREATE USER joaocarlos IDENTIFIED BY 'joaocarlos2022';
GRANT psicopedagogo TO joanamarques, camilabraga, joaocarlos;

CREATE ROLE responsavel;
GRANT SELECT ON TF_1A_adrianlopes.* TO responsavel;

CREATE USER mariaclara IDENTIFIED BY 'mariaclararesp';
CREATE USER felipecastro IDENTIFIED BY 'felipecastroresp';
CREATE USER rogeriovargas IDENTIFIED BY 'rogeriovargasresp';
GRANT responsavel TO mariaclara, felipecastro, rogeriovargas;

FLUSH PRIVILEGES;