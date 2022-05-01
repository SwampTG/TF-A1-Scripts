-- --------  << TF1 - Acompanhamento psicopedagogico >>  ----------
--
--             SCRIPT DE CRIACAO (DDL)
--
--  Data Criacao ...........: 16/04/2022
--  Autor(es) ..............: Adrian Soares, Amanda Nobre, Antonio Carvalho, Artur Vieira
--  Banco de Dados .........: MySQL 8.0
--  Base de Dados (nome) ...: TF_1A_adrianlopes
--
--  Ultimas Alteracoes:
--    16/04/2022 => Tabelas base
--    17/04/2022 => Adicao das constraints no CREATE
--               => ON DELETE e ON UPDATE para as FKs
--               => Especificacao da Engine para cada Tabela
--    27/04/2022 => Alteracao do nome da base de dados
--    28/04/2022 => Alteracao do nome da base de dados
--    30/04/2022 => Alteracao DATE para DATETIME (CONTRATO, SESSAO)
--
--  PROJETO => 01 Base de Dados
--         	=> 33 Tabelas
--          => 03 Papéis
--          => 09 Usuarios
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS TF_1A_adrianlopes;

USE TF_1A_adrianlopes;

CREATE TABLE PSICOPEDAGOGA (
    cpfMedica DECIMAL(11) NOT NULL,
    nomeCompleto varchar(100) NOT NULL,
    CONSTRAINT PSICOPEDAGOGA_PK PRIMARY KEY (cpfMedica)
) ENGINE=InnoDB;

CREATE TABLE TESTE (
    idTeste int NOT NULL auto_increment,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    CONSTRAINT TESTE_PK primary key (idTeste)
) ENGINE=InnoDB;

CREATE TABLE habilidadesTrabalhadas (
    idTeste int NOT NULL,
    habilidade VARCHAR(100) NOT NULL,
    CONSTRAINT habilidadesTrabalhadas_UK UNIQUE KEY(habilidade, idTeste),
    
    CONSTRAINT habilidadesTrabalhadas_TESTE_FK
		FOREIGN KEY (idTeste)
		REFERENCES TESTE (idTeste)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE PACOTE (
    idPacote int NOT NULL auto_increment,
    sessoesSemana INT NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    CONSTRAINT PACOTE_PK PRIMARY KEY (idPacote)
) ENGINE=InnoDB;

CREATE TABLE PARENTE (
    idParente int NOT NULL auto_increment,
    sexo char(1) NOT NULL,
    nomeCompleto varchar(100) NOT NULL,
    idade int NOT NULL,
    CONSTRAINT PARENTE_PK PRIMARY KEY(idParente)
) ENGINE=InnoDB;

CREATE TABLE PROGENITOR (
    idParente int NOT NULL,
    cpf DECIMAL(11),
    CONSTRAINT PROGENITOR_UK UNIQUE KEY (idParente),
    CONSTRAINT PROGENITOR_PARENTE_FK FOREIGN KEY (idParente) 
		REFERENCES PARENTE(idParente)
        ON DELETE restrict
        ON UPDATE restrict
) ENGINE=InnoDB;

CREATE TABLE RESPONSAVEL (
    idParente int NOT NULL,
    cpf DECIMAL(11) NOT NULL,
    parentesco varchar(30) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT RESPONSAVEL_UK UNIQUE KEY (idParente),
    
    CONSTRAINT RESPONSAVEL_PARENTE_FK FOREIGN KEY (idParente) 
		REFERENCES PARENTE(idParente)
        ON DELETE restrict
        ON UPDATE restrict
) ENGINE=InnoDB;

CREATE TABLE telefoneProg (
    idParente int NOT NULL,
    telefone DECIMAL(11) NOT NULL,
    CONSTRAINT telefoneProg_UK UNIQUE KEY (idParente, telefone),
    CONSTRAINT telefoneProg_PROGENITOR_FK FOREIGN KEY (idParente) 
		REFERENCES PROGENITOR(idParente)
        ON DELETE cascade
        ON UPDATE cascade
) ENGINE=InnoDB;

CREATE TABLE telefone (
	idParente int NOT NULL,
    telefone varchar(15) NOT NULL,
    CONSTRAINT telefone_UK UNIQUE KEY (idParente, telefone),
    CONSTRAINT telefone_RESPONSAVEL_FK FOREIGN KEY (idParente) 
		REFERENCES RESPONSAVEL(idParente)
        ON DELETE cascade
        ON UPDATE cascade
) ENGINE=InnoDB;

CREATE TABLE ESCOLA (
    idEscola int NOT NULL auto_increment,
    nomeEscola varchar(100) NOT NULL,
    CONSTRAINT ESCOLA_PK PRIMARY KEY (idEscola)
) ENGINE=InnoDB;

CREATE TABLE IRMAO (
    idParente int NOT NULL,
    idEscola int,
    serie VARCHAR(20),
    turma VARCHAR(2),
    turno VARCHAR(11),
    professor VARCHAR(100),
    CONSTRAINT IRMAO_UK UNIQUE KEY (idParente),
    
    CONSTRAINT IRMAO_PARENTE_FK 
		FOREIGN KEY (idParente)
        REFERENCES PARENTE(idParente)
        ON DELETE RESTRICT
        ON UPDATE restrict,
        
	CONSTRAINT IRMAO_ESCOLA_FK 
		FOREIGN KEY (idEscola)
        REFERENCES ESCOLA(idEscola)
        ON DELETE RESTRICT
        ON UPDATE restrict
) ENGINE=InnoDB;

CREATE TABLE unise (
    idPai int NOT NULL,
    idMae int NOT NULL,
    parentesco varchar(50),
    estadoCivil varchar(50) NOT NULL,
    CONSTRAINT unise_PK PRIMARY KEY (idPai, idMae),
    
    CONSTRAINT unise_PROGENITORpai_FK 
		FOREIGN KEY (idPai)
        REFERENCES PROGENITOR(idParente)
        ON DELETE RESTRICT
        ON UPDATE restrict,
        
	CONSTRAINT unise_PROGENITORmae_FK 
		FOREIGN KEY (idMae)
        REFERENCES PROGENITOR(idParente)
        ON DELETE RESTRICT
        ON UPDATE restrict
) ENGINE=InnoDB;

CREATE TABLE CRIANCA (
    idCrianca int NOT NULL auto_increment,
    idEscola int NOT NULL,
	idResponsavel int NOT NULL,
    nomeCompleto varchar(100) NOT NULL,
	gostaProfessor BOOLEAN NOT NULL,
	recebeAjuda varchar(100),
	tempoEscola int NOT NULL,
	parenteMaisUnido varchar(100) NOT NULL,
	relacionamentoCasa varchar(100) NOT NULL,
    cuidadosoPertence BOOLEAN NOT NULL,
	prefereBrincarSozinho BOOLEAN NOT NULL,
    naturalidade varchar(50) NOT NULL,
    reacaoAoContrariado varchar(300) NOT NULL,
    infoAdicional varchar(300),
    atendimentoExterior varchar(300),
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(2) NOT NULL,
    turno VARCHAR(11) NOT NULL,
    professor VARCHAR(100) NOT NULL,
	dataNascimento DATE NOT NULL,
    cep DECIMAL(8) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    bairro varchar(50) NOT NULL,
    complemento VARCHAR(50),
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    CONSTRAINT CRIANCA_PK PRIMARY KEY (idCrianca),
    
    CONSTRAINT CRIANCA_ESCOLA_FK
		FOREIGN KEY (idEscola)
		REFERENCES ESCOLA (idEscola)
        ON DELETE RESTRICT
        ON UPDATE restrict,
 
	CONSTRAINT CRIANCA_RESPONSAVEL_FK
		FOREIGN KEY (idResponsavel)
		REFERENCES RESPONSAVEL (idParente)
        ON DELETE RESTRICT
        ON UPDATE restrict
) ENGINE=InnoDB;

CREATE TABLE gerada (
    idParente int,
    idCrianca int,
    idadeAoTerFilho DECIMAL(2),
    ausente BOOLEAN,
    CONSTRAINT gerada_PK PRIMARY KEY (idParente, idCrianca),
    
    CONSTRAINT gerada_PROGENITOR_FK
		FOREIGN KEY (idParente)
		REFERENCES PROGENITOR (idParente)
        ON DELETE RESTRICT
        ON UPDATE restrict,
 
	CONSTRAINT gerada_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE RESTRICT
        ON UPDATE restrict
) ENGINE=InnoDB;

CREATE TABLE dificuldade (
    idCrianca int NOT NULL,
    dificuldade varchar(100) NOT NULL,
    CONSTRAINT dificuldade_UK UNIQUE KEY(idCrianca, dificuldade),
    
    CONSTRAINT dificuldade_CRIANCA_FK 
		FOREIGN KEY (idCrianca)
        REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE conhecimento (
    idCrianca int NOT NULL,
    conhecimento varchar(300) NOT NULL,
    CONSTRAINT conhecimento_UK UNIQUE KEY(idCrianca, conhecimento),
    
    CONSTRAINT conhecimento_CRIANCA_FK 
		FOREIGN KEY (idCrianca)
        REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE problema (
    idCrianca int NOT NULL,
    problema VARCHAR(50) NOT NULL,
    CONSTRAINT problema_UK UNIQUE KEY(idCrianca, problema),
    
    CONSTRAINT problema_CRIANCA_FK 
		FOREIGN KEY (idCrianca)
        REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE medicamentoCrianca (
    idCrianca int NOT NULL,
    medicamento VARCHAR(40) NOT NULL,
    CONSTRAINT medicamentoCrianca_UK UNIQUE KEY(idCrianca, medicamento),
    
    CONSTRAINT medicamentoCrianca_CRIANCA_FK 
		FOREIGN KEY (idCrianca)
        REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE possui (
	idCrianca int NOT NULL,
    idParente int NOT NULL,
    mora BOOLEAN NOT NULL,
    CONSTRAINT possui_PK PRIMARY KEY (idCrianca, idParente),
    
    CONSTRAINT possui_CRIANCA_FK FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
	CONSTRAINT possui_PARENTE_FK FOREIGN KEY (idParente)
		REFERENCES PARENTE (idParente)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE CONTRATO (
    idContrato INT NOT NULL auto_increment,
    idParente int NOT NULL,
    idPacote int NOT NULL,
    dtAssinatura DATETIME NOT NULL,
    validadeMeses varchar(15),
    CONSTRAINT CONTRATO_PK primary key (idContrato),
    
    CONSTRAINT CONTRATO_PACOTE_FK
		FOREIGN KEY (idPacote)
		REFERENCES PACOTE (idPacote),
 
	CONSTRAINT CONTRATO_RESPONSAVEL_FK
		FOREIGN KEY (idParente)
		REFERENCES RESPONSAVEL (idParente)
) ENGINE=InnoDB;

CREATE TABLE DESENVOLVIMENTOPSICOMOTOR (
    idCrianca int NOT NULL,
    esbarraOutros BOOLEAN NOT NULL,
    deixaCairCoisas BOOLEAN NOT NULL,
    caiMuito BOOLEAN NOT NULL,
    idadeAndou int NOT NULL,
    idadeEngatinhou int NOT NULL,
    idadeSentou int NOT NULL,
    idadeSustenteuCabeca int NOT NULL,
    apgar INT NOT NULL,
    CONSTRAINT DESENVOLVIMENTOPSICOMOTOR_UK UNIQUE KEY (idCrianca),
    
    CONSTRAINT DESENVOLVIMENTOPSICOMOTOR_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE PARTO (
    idCrianca int NOT NULL,
    tipo varchar(50) NOT NULL,
    prematuro BOOLEAN NOT NULL,
    incubadora BOOLEAN NOT NULL,
    chorou BOOLEAN NOT NULL,
    peso DECIMAL(4,2) NOT NULL,
    CONSTRAINT PARTO_UK UNIQUE KEY (idCrianca),
    
    CONSTRAINT PARTO_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE doencaAoNascer (
    idCrianca int NOT NULL,
    doenca VARCHAR(40) NOT NULL,
    CONSTRAINT doencaAoNascer_UK UNIQUE KEY (idCrianca, doenca),
    
    CONSTRAINT doencaAoNascer_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES PARTO (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE DESENVOLVIMENTOLINGUISTICO (
    idCrianca int NOT NULL,
    compreendeOrdens BOOLEAN NOT NULL,
    idadeFala int NOT NULL,
    problemaFala varchar(100),
    CONSTRAINT DESENVOLVIMENTOLINGUISTICO_UK UNIQUE KEY (idCrianca),
    
    CONSTRAINT DESENVOLVIMENTOLINGUISTICO_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE CONTROLEESFINCTERES (
    idCrianca int NOT NULL,
    controleAnal BOOLEAN NOT NULL,
    controleVesical BOOLEAN NOT NULL,
    CONSTRAINT CONTROLEESFINCTERES_UK UNIQUE KEY (idCrianca),
    
    CONSTRAINT CONTROLEESFINCTERES_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE SONO (
    idCrianca int NOT NULL,
    camaIndividual BOOLEAN NOT NULL,
    horarioDeita TIME NOT NULL,
    horarioAcorda TIME NOT NULL,
    CONSTRAINT SONO_UK UNIQUE KEY (idCrianca),
    
    CONSTRAINT SONO_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE DOENCACRIANCA (
    idCrianca int NOT NULL,
    nome VARCHAR(20) NOT NULL,
    atual BOOLEAN NOT NULL,
    hereditaria BOOLEAN NOT NULL,
    CONSTRAINT DOENCACRIANCA_UK UNIQUE KEY (idCrianca, nome),
    
    CONSTRAINT DOENCACRIANCA_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;


CREATE TABLE GRAVIDEZ (
    idParente int NOT NULL,
    idCrianca int NOT NULL,
    bebeuFumou BOOLEAN NOT NULL,
    prenatal BOOLEAN NOT NULL,
    gravidezDesejada BOOLEAN NOT NULL,
    CONSTRAINT GRAVIDEZ_UK UNIQUE KEY (idParente, idCrianca),
    
    CONSTRAINT GRAVIDEZ_PROGENITOR_FK
		FOREIGN KEY (idParente)
		REFERENCES PROGENITOR (idParente)
        ON DELETE RESTRICT
        ON UPDATE restrict,
 
	CONSTRAINT GRAVIDEZ_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
        ON DELETE RESTRICT
        ON UPDATE restrict
) ENGINE=InnoDB;

CREATE TABLE medicamentoGravidez (
	idParente int NOT NULL,
    idCrianca INT NOT NULL,
    medicamento varchar(50) NOT NULL,
    CONSTRAINT medicamentoGravidez_UK 
		UNIQUE KEY (medicamento, idParente, idCrianca),
        
	CONSTRAINT medicamentoGravidez_GRAVIDEZ
		FOREIGN KEY (idParente, idCrianca)
        REFERENCES GRAVIDEZ(idParente, idCrianca)	    
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE doencaGravidez (
    idParente int NOT NULL,
    idCrianca INT NOT NULL,
    doenca varchar(50) NOT NULL,
	CONSTRAINT doencaGravidez_UK 
		UNIQUE KEY (doenca, idParente, idCrianca),
        
	CONSTRAINT doencaGravidez_GRAVIDEZ
		FOREIGN KEY (idParente, idCrianca)
        REFERENCES GRAVIDEZ(idParente, idCrianca)	
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE condicoesPsicologicas (
    idParente int NOT NULL,
    idCrianca INT NOT NULL,
    condicao varchar(50) NOT NULL,
    CONSTRAINT condicoesPsicologicas_UK 
		UNIQUE KEY (condicao, idParente, idCrianca),
        
	CONSTRAINT condicoesPsicologicas_GRAVIDEZ
		FOREIGN KEY (idParente, idCrianca)
        REFERENCES GRAVIDEZ(idParente, idCrianca)	
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE SESSAO (
    idSessao INT NOT NULL auto_increment,
    dataHoraSessao DATETIME NOT NULL,
	observacoes varchar(300),
    idCrianca int NOT NULL,
    cpfMedica DECIMAL(11) NOT NULL,
    
    CONSTRAINT SESSAO_PK PRIMARY KEY (idSessao),
    
    CONSTRAINT SESSAO_CRIANCA_FK
		FOREIGN KEY (idCrianca)
		REFERENCES CRIANCA (idCrianca)
		ON DELETE restrict
        ON UPDATE restrict,
 
	CONSTRAINT SESSAO_PSICOPEDAGOGA_FK
		FOREIGN KEY (cpfMedica)
		REFERENCES PSICOPEDAGOGA (cpfMedica)
        ON DELETE restrict
        ON UPDATE restrict
 
) ENGINE=InnoDB;

CREATE TABLE acontece (
    idTeste int NOT NULL,
    idSessao INT,
    resultado VARCHAR(100),	
    CONSTRAINT acontece_PK PRIMARY KEY (idSessao, idTeste),
    
    CONSTRAINT acontece_TESTE_FK
		FOREIGN KEY (idTeste)
		REFERENCES TESTE (idTeste)
        ON DELETE restrict
        ON UPDATE restrict,
 
	CONSTRAINT acontece_SESSAO_FK
		FOREIGN KEY (idSessao)
		REFERENCES SESSAO (idSessao)
        ON DELETE restrict
        ON UPDATE restrict
) ENGINE=InnoDB;