-- --------  << TF1 - Acompanhamento psicopedagogico >>  ----------
--
--             SCRIPT POPULA (DML)
--
--  Data Criacao ...........: 16/04/2022
--  Autor(es) ..............: Adrian Soares, Amanda Nobre, Antonio Carvalho, Artur Vieira
--  Banco de Dados .........: MySQL 8.0
--  Base de Dados (nome) ...: TF_1A_adrianlopes
--
--  Ultimas Alteracoes:
--    27/04/2022 => Alteracao do nome da base de dados
--    28/04/2022 => Alteracao do nome da base de dados
--
--  PROJETO => 01 Base de Dados
--         	=> 33 Tabelas
--          => 03 Papéis
--          => 09 Usuarios
--
-- ---------------------------------------------------------

USE TF_1A_adrianlopes;

INSERT INTO PSICOPEDAGOGA VALUES
(05894033829, 'Joana Marques Souza'),
(05739374902, 'Camila Braga Lopes'),
(18495839503, 'João Carlos Freitas Vieira'),
(03857028402, 'Pedro Cabral Lorenzo'),
(15738295493, 'Diana Martins Ferreira');

INSERT INTO TESTE VALUES
(null, 'CÓPIA','Capacidade de leitura e interpretação de texto'),
(null, 'AVALIAÇÃO MATEMÁTICA','Capacidade de realizar contas matemáticas'),
(null, 'COORDENAÇÃO GLOBAL','Capacidade de se locomover e coordenação manual'),
(null, 'EQUILIBRIO ESTATICO','Capacidade de se manter em uma mesma posição'),
(null, 'ORIENTAÇÃO ESPACIAL','Capacidade de se orientar');

INSERT INTO habilidadesTrabalhadas VALUES
(1,'Velocidade de leitura'),
(2,'Escrita de numerais'),
(3,'Andar pela sala'),
(4,'Ficar parado com os braços ao longo do corpo de olhos fechados'),
(5,'Noção de espaço');

INSERT INTO PACOTE VALUES
(null, 3, 199.90),
(null, 4, 299.50),
(null, 1, 100.00),
(null, 7, 499.50),
(null, 2, 150.00);

INSERT INTO PARENTE VALUES
(null, 'F','Maria Clara Lima Costa', 40),
(null, 'M', 'Felipe Castro Ribeiro', 46),
(null, 'M', 'Caio Castro Costa', 10),
(null, 'F', 'Laís Castro Costa', 12),
(null, 'F', 'Raquel De Sousa Aguiár', 39),
(null, 'M', 'Rogério Vargas Caitano', 40),
(null, 'F', 'Fernanda de Sousa Caitano', 8),
(null, 'M', 'Gabriel de Chagas Barreto', 50),
(null, 'F', 'Maria Matos Ramos', 49),
(null, 'M', 'João Soares Pereira', 38),
(null, 'F', 'Cristina Dutra Santos', 39),
(null, 'M', 'Rodrigo Dutra Pereira', 7),
(null, 'M', 'Fernando Vicente Jardim', 55),
(null, 'F', 'Veronica Lins Junqueira', 50),
(null, 'M', 'João Cleber Cavalari', 30);

INSERT INTO PROGENITOR VALUES
(1, 08573048391),
(2, 19438501850),
(5, 04858294820),
(6, 18471048493),
(8, 06847194732),
(9, 19931895031),
(10, 19482940284),
(11, 04739175849),
(13, 19759147264),
(14, 09471957274);

INSERT INTO RESPONSAVEL VALUES
(1, 08573048391, 'Mãe', 'mclima@hotmail.com'),
(6, 18471048493, 'Pai', 'caitanoroger@gmail.com'),
(8, 06847194732, 'Pai', 'gabrielgb@outlook.com'),
(11, 04739175849, 'Mãe', 'criscristina@gmail.com'),
(15, 10398548305, 'Irmão', 'cavalari42@gmail.com');
    
INSERT INTO telefoneProg VALUES
(2, 61058392058),
(5, 40847547205),
(9, 60385729435),
(10, 5094719385),
(13, 4295101592),
(14, 3918401840);

INSERT INTO telefone VALUES
(1, 61998274046),
(6, 62983048195),
(8, 4138573019),
(11, 6092840472),
(15, 32945720184);

INSERT INTO ESCOLA VALUES
(null, 'Leonardo da Vinci Taguatinga'),
(null, 'Sigma Águas Claras'),
(null, 'Galois Taguatinga'),
(null, 'Classe 104 Norte Samambaia'),
(null, 'Classe 102 Sul Ceilândia');

INSERT INTO IRMAO VALUES
(3, 1, 'Quarta Série', 'A', 'Matutino', 'Júlio Cesar Veras'),
(4, 2, 'Sétima Série', 'C', 'Vespertino', 'Camila josé Barreto'),
(7, 3, 'Segunda Série', 'B', 'Vespertino', 'Carlos Emanuel Darma'),
(12, 4, 'Primeira Série', 'E', 'Matutino', 'Daniel Garcia Sarnei'),
(15, null, null, null, null, null);

INSERT INTO unise VALUES
(1, 2, null,'Casados'),
(5, 6, null, 'Divorciados'),
(8, 9, 'Primos Terceiro Grau','Casados'),
(10, 11, null, 'Divorciados'),
(13, 14, null, 'Casados');

INSERT INTO CRIANCA VALUES
(null, 1, 1, 'Fernando Lima Ribeiro', 0, 'Mãe ajuda nos estudos', 2, 'Mãe', 'Tranquilo com todos os familiares', 1, 1, 'Brasileiro', 
'Primeiramento birrento e zangado, mas fica tranquilo logo depois', null, 'neurologista e Alergista', 'Quinta Série', 'A', 'Matutino', 'Julio Cesar Veras',
 '2012-01-19', 49384990, '105', 'Águas Claras', 'lote 4 apto 1204 A', 'DF', 'Brasília'),
(null, 2, 6, 'Giovana de Sousa Caitano', 1, 'Pai ajuda nos estudos', 3, 'Pai', 'Solitária e isolada', 1, 1, 'Brasileira', 'Tranquila', null, null,  
'Quarta Série', 'A', 'Matutino', 'Camila josé Barreto', '2011-05-08', 72093120, 'Castanheiras', 'Águas Lindas', 'casa 2', 'DF', 'Brasília'),
(null, 3, 8, 'Bruno Chagas Ramos',  1, 'Pai ajuda nos estudos', 1, 'Pai', 'Energético e desajeitado', 0, 0, 'Brasileira', 'Tende a ficar emburrado e calado'
, null, null, 'Terceira Série', 'B', 'Vespertino', 'Carlos Emanuel Darma', '2010-01-09', 94859010, 'Vicente primo', 'Taguatinga', 'lote 2 apto 101',
'DF', 'Brasília'),
(null, 4, 11, 'Vinicius Soares Santos', 0, null, 4, 'Pai', 'Energético e desajeitado', 1, 0, 'Brasileira', 'Tranquilo', null, null, 
'Quinta Série', 'E', 'Vespertino', 'Carlos Emanuel Darma', '2011-06-12', 04928473, 'Palmeiras', 'Lagoa Azul', 'casa 42', 'TO', 'Taguatinga'),
(null, 5, 15, 'Rafael Cavalari', 1, null, 2, 'Irmão', 'Calado mas gentil', 0, 1, 'Brasileira', 'Tranquilo', 'Psicólogo e neurologista', null, 
'sexta Série', 'C', 'Matutino', 'Virgínio Santo Coitadinho', '2009-08-20', 18743014, 'Guarulhos', 'São Agostin', 'lote 20 apto 205', 'SP', 'São Paulo');

INSERT INTO gerada VALUES
(1, 1, 30, 0),
(2, 1, 26, 0),
(5, 2, 35, 1),
(6, 2, 36, 0),
(8, 3, 40, 0),
(9, 3, 39, 0),
(10, 4, 25, 1),
(11, 4, 26,0),
(13, 5, 45, 1),
(14, 5, 40, 1);

INSERT INTO dificuldade VALUES
(1, 'Dificulade ded leitura de texto'),
(2, 'Dificulade de compreensão de texto'),
(3, 'Dificuldade motora'),
(4, 'Dificuldade de concentração'),
(5, 'Dificuldade de locomoção');

INSERT INTO conhecimento VALUES
(1, 'Matemática básica'),
(1, 'Leitura básica'),
(3, 'Fala básica'),
(4, 'Leitura básica'),
(4, 'Fala básica');

INSERT INTO problema VALUES
(1, 'Asma'),
(2, 'Deficiência auditiva'),
(3, 'Alergia Severa'),
(5, 'Câncer de pulmão'),
(5, 'Fibrose císetica');

INSERT INTO medicamentoCrianca VALUES
(1, 'Corticoide'),
(3, 'Corticoide'),
(3, 'Budesonida'),
(5, 'Antifibróticos'),
(5, 'Paclitaxel ');

INSERT INTO possui VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(2, 5, 0),
(2, 6, 1),
(2, 7, 1),
(3, 8, 1),
(3, 9, 1),
(4, 10, 0),
(4, 11, 1),
(4, 12, 1),
(5, 13, 0),
(5, 14, 0),
(5, 15, 1);

INSERT INTO CONTRATO VALUES
(null, 1, 1, '2022-04-18', 2),
(null, 6, 2,'2022-04-10', 5),
(null, 8, 3, '2022-04-13', 6),
(null, 11, 4, '2022-04-04', 8),
(null, 15, 5, '2022-04-02', 12);

INSERT INTO DESENVOLVIMENTOPSICOMOTOR VALUES
(1, 1, 0, 0, 3, 2, 2, 1, 6),
(2, 0, 1, 0, 2, 2, 2, 1, 5),
(3, 1, 0, 1, 4, 3, 3, 3, 3),
(4, 0, 0, 0, 3, 2, 2, 1, 8),
(5, 1, 1, 1, 5, 4, 4, 2, 3);

INSERT INTO PARTO VALUES
(1, 'Normal', 0, 0, 1, 3.2),
(2, 'Cesária', 1, 1, 0, 2.2),
(3, 'Cesária', 0, 0, 1, 3),
(4, 'Normal', 1, 1, 1, 2.1),
(5, 'Normal', 0, 1, 0, 2.5);

INSERT INTO doencaAoNascer VALUES
(1, 'Meningite'),
(2, 'Tétano'),
(2, 'Diarréia'),
(3, 'Hérnia umbilical'),
(4, 'Estrabismo');

INSERT INTO DESENVOLVIMENTOLINGUISTICO VALUES	
(1, 0, 3, null),
(2, 1, 4, 'Gaguismo'),
(3, 1, 3, 'Fala lenta'),
(4, 0, 2, null),
(5, 1, 5, 'Fala embolada');

INSERT INTO CONTROLEESFINCTERES VALUES
(1, 0, 1),
(2, 0, 0),
(3, 1, 1),
(4, 1, 0),
(5, 1, 1);

INSERT INTO SONO VALUES
(1, 0, '19:00:00', '05:00:00'),
(2, 1, '18:30:00', '06:30:00'),
(3, 1, '18:00:00', '05:30:00'),
(4, 0, '20:30:00', '06:30:00'),
(5, 1, '19:30:00', '07:00:00');

INSERT INTO DOENCACRIANCA VALUES
(1, 'Asma', 0, 1),
(1, 'Bronquite', 1, 0),
(3, 'Alergia Alimentar', 1, 1),
(3, 'Úlcera estomacal', 0, 1),
(4, 'Anemia', 1, 0);

INSERT INTO GRAVIDEZ VALUES
(1, 1, 1, 0, 0),
(5, 2, 0, 1, 1),
(9, 3, 0, 1, 0),
(11, 4, 0, 1, 1),
(14, 5, 1, 0, 1);

INSERT INTO medicamentoGravidez VALUES
(1, 1, 'Suplemento Ferro'),
(5, 2, 'Suplemento B12'),
(9, 3, 'Antibiótico'),
(11, 4, 'Multivitamínico'),
(14, 5, 'Corticoide');

INSERT INTO doencaGravidez VALUES
(1, 1, 'Anemia'),
(5, 2,  'Infecção urinária'),
(9, 3, 'Vaginose'),
(11, 4, 'pré-eclâmpsia'),
(14, 5, 'Asma');

INSERT INTO condicoesPsicologicas VALUES
(1, 1, 'Depressão'),
(5, 2,  'Asiedade'),
(9, 3, 'Esquizofrenia'),
(11, 4, 'Ansiedade'),
(14, 5, 'Depressão');

INSERT INTO SESSAO VALUES
(null, '2022-04-18', 'Sessão ocorreu sem nenhum imprevistos nem complicações', 1, 05894033829),
(null, '2022-03-10', 'Sessão acabada mais cedo, criança não responsiva', 2, 05739374902),
(null, '2022-01-03', 'Aplicados testes 4 e 5, resultados anotados', 3, 05894033829),
(null, '2022-01-20', 'Sessão ocorreu sem nenhum imprevistos nem complicações', 4, 15738295493),
(null, '2022-04-01', 'Aplicados testes 1 a 3, resultados anotados', 5, 18495839503);

INSERT INTO acontece VALUES
(1, 5, 'Leitura rápida'),
(2, 5, 'Conseguiu escrever de 1 a 9'),
(3, 5,'tropeceu uma vez sem cair, além disso andou pela sala normalmente'),
(4, 3, 'Conseguiu ficar em pé e parado sem cair'),
(5, 3, 'Identificou corretamento tudo que havia ao seu redor');