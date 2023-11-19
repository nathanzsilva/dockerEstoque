go
create database  EstoqueNV;
go
USE EstoqueNV
go
CREATE TABLE Corredor (
    codigo INT IDENTITY(1,1) PRIMARY KEY,
    descricao VARCHAR(200)
);
go
CREATE TABLE Local (
    codigo INT IDENTITY(1,1) PRIMARY KEY,
    descricao VARCHAR(200)
);
go
CREATE TABLE Andar (
    codigo INT IDENTITY(1,1) PRIMARY KEY,
    descricao VARCHAR(200)
);
go
CREATE TABLE Locacao (
    codigo INT IDENTITY(1,1) PRIMARY KEY,
    CorredorCodigo INT,
    LocalCodigo INT,
    AndarCodigo INT,
    isAtivo BIT,
    FOREIGN KEY (CorredorCodigo) REFERENCES Corredor(codigo),
    FOREIGN KEY (LocalCodigo) REFERENCES tabLocal(codigo),
    FOREIGN KEY (AndarCodigo) REFERENCES Andar(codigo)
);
go
create table Usuario(
codigo int primary key identity(1,1),
nome varchar(150) not null,
email varchar(150) not null,
senha varchar(50) not null,
cargoCodigo int not null,
)
go
create table Cargo(
codigo int primary key identity(1,1),
descricao varchar(100) not null
)
go
CREATE TABLE Produtos (
    codigo INT IDENTITY(1,1) PRIMARY KEY,
    nomeProduto VARCHAR(200),
    valor DECIMAL(17,2),
    Quantidade INT,
    DataVencimento DATETIME,
    LocacaoCodigo INT, -- Renomeando para evitar conflito de nome
    FOREIGN KEY (LocacaoCodigo) REFERENCES tabLocacao(codigo)
);
go
create table ProdutosBaixa(
codigo int primary key identity(1,1),
usuarioCodigo int not null,
produtoCodigo int not null,
constraint FK_USUARIO_PRODUTOBAIXA foreign key(usuarioCodigo) references Usuario(codigo),
constraint FK_PRODUTO_PRODUTOBAIXA foreign key(usuarioCodigo) references Usuario(codigo),
)