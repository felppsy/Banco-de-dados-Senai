create database FELIPE;
use felipe;

create table estado(
sgEstado CHAR(2) NOT NULL PRIMARY KEY,
nmEstado VARCHAR(50) NOT NULL
);

create table cidade(
cdCidade INT NOT NULL PRIMARY KEY,
nmCidade VARCHAR(50) NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY (sgEstado) references estado(sgEstado)
); 

create table bairro(
cdBairro  INT NOT NULL PRIMARY KEY,
nmBairro VARCHAR(50) NOT NULL,
cdCidade INT NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY (cdCidade) references cidade(cdCidade),
FOREIGN KEY (sgEstado) references estado(sgEstado)
); 

create table faixaImovel(
cdFaixa INT NOT NULL PRIMARY KEY,
nmFaixa VARCHAR(50) NOT NULL,
vlMinimo DECIMAL (8,2) NOT NULL,
vlMaximo DECIMAL (8,2) NOT NULL
);

create table vendedor(
cdVendedor INT NOT NULL PRIMARY KEY,
nmVendedor VARCHAR(50) NOT NULL,
nmEndereco VARCHAR(50) NOT NULL,
nrCPF NUMERIC(11,0) NOT NULL,
cdCidade INT NOT NULL,
cdBairro INT NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY (cdCidade) references cidade(cdCidade),
FOREIGN KEY (cdBairro) references bairro(cdBairro),
FOREIGN KEY (sgEstado) references estado(sgEstado),
telefone NUMERIC(11,0) NOT NULL,
dataNASC date not null
);

create table compradores(
cdComprador  INT NOT NULL PRIMARY KEY,
nmComprador VARCHAR(50) NOT NULL,
nmEnderecoComprador VARCHAR(50) NOT NULL,
nrCPFComprador NUMERIC (11,0) NOT NULL,
cdCidade INT NOT NULL,
cdBairro INT NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY (cdCidade) references cidade(cdCidade),
FOREIGN KEY (cdBairro) references bairro(cdBairro),
FOREIGN KEY (sgEstado) references estado(sgEstado),
telComprador NUMERIC (11,0) NOT NULL
);

create table imovel(
cdImovel INT NOT NULL PRIMARY KEY,
cdVendedor INT NOT NULL,
cdBairro INT NOT NULL,
cdCidade INT NOT NULL,
sgEstado char(2) NOT NULL,
FOREIGN KEY (cdVendedor) references vendedor(cdVendedor),
FOREIGN KEY (cdCidade) references cidade(cdCidade),
FOREIGN KEY (cdBairro) references bairro(cdBairro),
FOREIGN KEY (sgEstado) references estado(sgEstado),
nmEndereco VARCHAR(50) NOT NULL,
nrAreautil DECIMAL(8,2) NOT NULL,
nrAreatotal DECIMAL(8,2) NOT NULL,
vlPreco NUMERIC(9,2) NOT NULL,
stVendido BOOLEAN NOT NULL,
dataLancto DATE NOT NULL,
cdOferta INT NOT NULL
);

create table oferta(
cdOferta INT NOT NULL PRIMARY KEY,
cdImovel INT NOT NULL,
cdComprador INT NOT NULL, 
FOREIGN KEY (cdImovel) references Imovel(cdImovel),
FOREIGN KEY (cdComprador) references Compradores(cdComprador),
vlOferta NUMERIC(8,0) NOT NULL,
dtOferta DATE NOT NULL
);

alter table imovel
add foreign key (cdOferta)
references oferta (cdOferta);

alter table imovel 
modify column cdOferta int null;
