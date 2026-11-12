create database banco character set utf8mb4 collate utf8mb4_unicode_ci;
use banco;

CREATE TABLE Clientes(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) not null,
    CPF varchar(11) not null UNIQUE,
    data_de_nascimento date,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    senha varchar(255) not null,
    data_de_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Agencias(
    id_agencia int PRIMARY KEY AUTO_INCREMENT,
    numero_agencia varchar(25) NOT NULL UNIQUE,
    nome varchar(255)
);

CREATE TABLE Contas(
    id_conta int PRIMARY KEY AUTO_INCREMENT,
    cliente_id int NOT NULL,
    agencia_id int NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (agencia_id) REFERENCES Agencias(id_agencia),
    numero_conta varchar(15) NOT NULL UNIQUE,
    tipo ENUM('corrente', 'poupanca') NOT NULL,
    saldo DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    limite DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    status ENUM('ativa', 'bloqueada', 'encerrada') NOT NULL DEFAULT 'ativa',
    data_de_abertura DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE table Transacoes(
    id_transacoes BIGINT PRIMARY KEY AUTO_INCREMENT,
    conta_origem_id int NULL,
    conta_destino_id int NULL,
    FOREIGN KEY (conta_origem_id) REFERENCES Contas(id_conta),
    FOREIGN KEY (conta_destino_id) REFERENCES Contas(id_conta),
    tipo ENUM('deposito', 'saque', 'transferencia', 'pagamento', 'tarifa') NOT NULL,
    valor DECIMAL(15,2) NOT NULL CHECK (valor > 0),
    descricao varchar(255),
    data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP
);