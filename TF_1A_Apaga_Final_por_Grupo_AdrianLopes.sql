-- --------  << TF1 - Acompanhamento psicopedagogico >>  ----------
--
--             SCRIPT APAGA (DDL)
--
--  Data Criacao ...........: 18/04/2022
--  Autor(es) ..............: Adrian Soares, Amanda Nobre, Antonio Carvalho, Artur Vieira
--  Banco de Dados .........: MySQL 8.0
--  Base de Dados (nome) ...: TF_1A_adrianlopes
--
--  Ultimas Alteracoes:
--    27/04/2022 => Alteracao do nome da base de dados
--    27/04/2022 => Adicao do Drop user
--    28/04/2022 => Alteracao do nome da base de dados, adicao do Drop role e modificação do Drop user
--
--  PROJETO => 01 Base de Dados
--         	=> 33 Tabelas
--          => 03 Papéis
--          => 09 Usuarios
--
-- ---------------------------------------------------------

USE TF_1A_adrianlopes;

DROP TABLE acontece;
DROP TABLE SESSAO;
DROP TABLE condicoesPsicologicas;
DROP TABLE doencaGravidez;
DROP TABLE medicamentoGravidez;
DROP TABLE GRAVIDEZ;
DROP TABLE DOENCACRIANCA;
DROP TABLE SONO;
DROP TABLE CONTROLEESFINCTERES;
DROP TABLE DESENVOLVIMENTOLINGUISTICO;
DROP TABLE doencaAoNascer;
DROP TABLE PARTO;
DROP TABLE DESENVOLVIMENTOPSICOMOTOR;
DROP TABLE CONTRATO;
DROP TABLE possui;
DROP TABLE medicamentoCrianca;
DROP TABLE problema;
DROP TABLE conhecimento;
DROP TABLE dificuldade;
DROP TABLE gerada;
DROP TABLE CRIANCA;
DROP TABLE unise;
DROP TABLE IRMAO;
DROP TABLE ESCOLA;
DROP TABLE telefone;
DROP TABLE telefoneProg;
DROP TABLE RESPONSAVEL;
DROP TABLE PROGENITOR;
DROP TABLE PARENTE;
DROP TABLE PACOTE;
DROP TABLE habilidadesTrabalhadas;
DROP TABLE TESTE;
DROP TABLE PSICOPEDAGOGA;

DROP USER amanda;
DROP USER antonio;
DROP USER adrian;
DROP ROLE superuser;
DROP USER joanamarques;
DROP USER camilabraga;
DROP USER joaocarlos;
DROP ROLE psicopedagogo;
DROP USER mariaclara;
DROP USER felipecastro;
DROP USER rogeriovargas;
DROP ROLE responsavel;
