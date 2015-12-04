/*
***************************************************
************/
/* Criando o Database Exemplo
*/
/*Script_01
*/
/*
***************************************************
************/
CREATE DATABASE Exemplo
GO
/*
***************************************************
************/
/* Estabelecendo uma Conexão com o Database Exemplo
*/
/*
***************************************************
************/
USE Exemplo
GO
/*
***************************************************
***********************/
/* Criando as tabelas do database SYSAMPLE
*/
/*
***************************************************
***********************/
CREATE TABLE TipoEnd
(
  Cod_TipoEnd int identity not null,
  Nome_TipoEnd varchar(30) not null,
  Constraint PK_TipoEnd Primary Key(Cod_TipoEnd),
  Constraint UQ_TipoEnd Unique(Nome_TipoEnd)
)
GO
CREATE TABLE Estado
(
  Sigla_Est char(02) not null,
  Nome_Est varchar(100) not null,
  Constraint PK_Est Primary Key(Sigla_Est),
  Constraint UQ_Est Unique(Nome_Est)
)
GO
CREATE TABLE Cidade
(
  Cod_Cid int Identity Not Null,
  Sigla_Est char(02) Not Null,
  Nome_Cid varchar(100) Not Null,
  Constraint PK_Cid Primary Key(Cod_Cid),
  Constraint FK_Cid Foreign Key(Sigla_Est)
  References Estado(Sigla_Est),
  Constraint UQ_Cid Unique(Sigla_Est,Nome_Cid)
)
GO
CREATE TABLE TipoCli
(
  Cod_TipoCli int identity not null,
  Nome_TipoCli varchar(100) not null,
  Constraint PK_TipoCli Primary key(Cod_TipoCli),
  Constraint UQ_TipoCli Unique(Nome_TipoCli)
)
GO
CREATE TABLE Cliente
(
  Cod_Cli int Identity not null,
  Cod_TipoCli int not null,
  Nome_Cli varchar(100) not null,
  Data_CadCli smalldatetime not null Default Getdate(),
  Renda_Cli decimal(10,2) not null Default 0,
  Sexo_Cli char(01) not null Default 'F',
  Constraint PK_Cli Primary Key(Cod_Cli),
  Constraint FK_Cli Foreign
  Key(Cod_TipoCli)References TipoCli(Cod_TipoCli),
  Constraint CH_Cli1 Check(Renda_Cli >=0),
  Constraint CH_Cli2 Check(Sexo_Cli IN('F','M'))
)
GO
CREATE TABLE Conjuge
(
  Cod_Cli int not null,
  Nome_Conj char(30) not null,
  Renda_Conj decimal(10,2) not null Default 0,
  Sexo_Conj char(01) not null Default 'M',
  Constraint PK_Conj Primary Key(Cod_Cli),
  Constraint FK_Conj Foreign Key(Cod_Cli)
  References Cliente(Cod_Cli),
  Constraint CH_Conj1 Check(Renda_Conj >=0),
  Constraint CH_Conj2 Check(Sexo_Conj IN ('F','M'))
)
GO
CREATE TABLE Endereco
(
  Cod_End int identity not null,
  Cod_TipoEnd int not null,
  Cod_Cid int not null,
  Cod_Cli int not null,
  Nome_Rua varchar(100) not null,
  Nome_Bairro varchar(100) not null,
  Compl_End varchar(100) null,
  Constraint PK_End Primary Key(Cod_End),
  Constraint FK_End1 Foreign Key(Cod_TipoEnd)
  References TipoEnd(Cod_TipoEnd),
  Constraint FK_End2 Foreign Key(Cod_Cid)
  References Cidade(Cod_Cid),
  Constraint FK_End3 Foreign Key(Cod_Cli)
  References Cliente(Cod_Cli)
)
GO
CREATE TABLE Credito
(
  Num_Lanc int identity not null,
  Cod_Cli int not null,
  Cred_Cli decimal(10,2) not null,
  Data_CredCli smalldatetime not null,
  Constraint PK_Cred Primary Key(Num_Lanc),
  Constraint FK_Cred Foreign Key(Cod_Cli)
  References Cliente(Cod_Cli),
  Constraint CH_Cred Check(Cred_Cli > 0)
)
GO
CREATE TABLE Fone
(
  Num_Lanc int identity not null,
  Cod_Cli int not null,
  Num_Fone char(10) not null,
  Num_DDD char(05) not null Default '011',
  Constraint PK_Fone Primary Key(Num_Lanc),
  Constraint FK_Fone Foreign Key(Cod_Cli)
  References Cliente(Cod_Cli)
)
GO
CREATE TABLE EMail
(
  Num_Lanc int identity not null,
  Cod_Cli int not null,
  EMail_Cli varchar(255) not null,
  Constraint PK_Email Primary Key(Num_Lanc),
  Constraint FK_Emails Foreign Key(Cod_Cli)
  References Cliente(Cod_Cli)
)
GO
CREATE TABLE StatusPedido
(
  Cod_Sta smallint identity not null,
  Sta_Ped varchar(100) not null,
  Constraint PK_StatusPed Primary Key(Cod_Sta),
  Constraint UQ_StatusPed Unique(Sta_Ped)
)
GO
CREATE TABLE Funcionario
(
  Cod_Func int Identity not null,
  Nome_Func varchar(100) not null,
  Data_CadFunc smalldatetime not null Default Getdate(),
  Sexo_Func char(01) not null Default 'F',
  Sal_Func decimal(10,2) not null Default 200,
  End_Func varchar(100) not null,
  Constraint PK_Func Primary Key(Cod_Func),
  Constraint CH_Func1 Check(Data_CadFunc >= Getdate()),
  Constraint CH_Func2 Check(Sexo_Func IN ('F','M')),
  Constraint CH_Func3 Check(Sal_Func >=0)
)
GO
CREATE TABLE Bonus
(
  Num_Lanc int identity not null,
  Cod_Func int not null,
  Data_Bonus smalldatetime not null default Getdate(),
  Val_Bonus decimal(10,2) not null,
  Constraint PK_Bonus Primary Key(Num_Lanc),
  Constraint FK_Bonus Foreign Key(Cod_Func)
  References Funcionario(Cod_Func),
  Constraint CH_Bonus1 Check(Data_Bonus >= Getdate()),
  Constraint CH_Bonus2 Check(Val_Bonus > 0)
)
GO
CREATE TABLE Pontuacao
(
  Num_Lanc int identity not null,
  Cod_Func int not null,
  Data_Pto smalldatetime not null default Getdate(),
  Pto_Func decimal(4,2) not null,
  Constraint PK_Pto Primary Key(Num_Lanc),
  Constraint FK_Pto Foreign Key(Cod_Func)
  References Funcionario(Cod_Func),
  Constraint CH_Pto1 Check(Data_Pto >= Getdate()),
  Constraint CH_Pto2 Check(Pto_Func > 0)
)
GO
CREATE TABLE Historico
(
  Num_Lanc int identity not null,
  Cod_Func int not null,
  Data_Hist smalldatetime not null Default Getdate(),
  Sal_Ant decimal(10,2) not null,
  Sal_Atual decimal(10,2) not null,
  Constraint PK_Hist Primary Key(Num_Lanc),
  Constraint FK_Hist Foreign Key(Cod_Func)
  References Funcionario(Cod_Func),
  Constraint CH_Hist1 Check(Data_Hist >= Getdate()),
  Constraint CH_Hist2 Check(Sal_Ant >= 0),
  Constraint CH_Hist3 Check(Sal_Ant > 0)
)
GO
CREATE TABLE Dependente
(
  Cod_Dep int identity not null,
  Cod_Func int not null,
  Nome_Dep varchar(100) not null,
  Data_NascDep smalldatetime not null,
  Sexo_Dep char(01) not null Default 'F',
  Constraint PK_Dep Primary Key(Cod_Dep),
  Constraint FK_Dep Foreign Key(Cod_Func)References
  Funcionario(Cod_Func),
  Constraint CH_Dep Check(Sexo_Dep IN ('F','M'))
)
GO
CREATE TABLE Pedido
(
  Num_Ped int identity not null,
  Cod_Cli int not null,
  Cod_Func int not null,
  Cod_Sta smallint not null,
  Data_Ped smalldatetime not null Default Getdate(),
  Val_Ped decimal(10,2) not null Default 0,
  Constraint PK_Pedido Primary Key(Num_Ped),
  Constraint FK_Pedido1 Foreign Key(Cod_Cli)
  References Cliente(Cod_Cli),
  Constraint FK_Pedido2 Foreign Key(Cod_Cli)
  References Funcionario(Cod_Func),
  Constraint CH_Pedido1 Check(Data_Ped >= getdate()),
  Constraint CH_Pedido2 Check(Val_Ped >=0)
)
GO
CREATE TABLE Parcela
(
  Num_Par smallint not null,
  Num_Ped int not null,
  Data_Venc smalldatetime not null Default getdate(),
  Val_Venc decimal(10,2) not null,
  Data_Pgto smalldatetime null,
  Val_Pgto as CASE
    WHEN Data_Pgto < Data_Venc THEN
      Val_Venc * 0.9
    WHEN Data_Pgto = Data_Venc THEN
      Val_Venc
    WHEN Data_Pgto > Data_Venc THEN
      Val_Venc * 1.1
  END,
  Constraint PK_Parcela Primary
  key(Num_Par,Num_Ped),
  Constraint FK_Parcela Foreign
  Key(Num_Ped)References Pedido(Num_Ped),
  Constraint CH_Parcela1 Check(Data_Venc >= getdate()),
  Constraint CH_Parcela2 Check(Val_Venc >= 0),
)
GO
CREATE TABLE TipoProd
(
  Cod_TipoProd int identity not null,
  Nome_TipoProd varchar(100) not null,
  Constraint PK_TipoProd Primary Key(Cod_TipoProd),
  Constraint UQ_TipoProd Unique(Nome_TipoProd)
)
GO
CREATE TABLE Produto
(
  Cod_Prod int identity not null,
  Cod_TipoProd int not null,
  Nome_Prod varchar(100) not null,
  Qtd_EstqProd int not null Default 0,
  Val_UnitProd decimal(10,2) not null,
  Val_Total AS Qtd_EstqProd * Val_UnitProd,
  Constraint PK_Prod Primary Key(Cod_Prod),
  Constraint FK_Prod Foreign Key(Cod_TipoProd)
  References TipoProd(Cod_TipoProd),
  Constraint UQ_Prod Unique(Nome_Prod),
  Constraint CH_Prod1 Check(Qtd_EstqProd >= 0),
  Constraint CH_Prod2 Check(Val_UnitProd > 0)
)
GO
CREATE TABLE Itens
(
  Num_Ped int not null,
  Cod_Prod int not null,
  Qtd_Vend int not null,
  Val_Vend decimal(10,2) not null,
  Constraint PK_Itens Primary
  Key(Num_Ped,Cod_Prod),
  Constraint FK_Itens1 Foreign Key(Num_Ped)
  References Pedido(Num_Ped),
  Constraint FK_Itens2 Foreign Key(Cod_Prod)
  References Produto(Cod_Prod),
  Constraint CH_Itens1 Check(Qtd_Vend > 0),
  Constraint CH_Itens2 Check(Val_Vend > 0)
)
GO
/*
***************************************************
******************************/
/* Verificando a Criação da Tabelas do Database
SYSAMPLES */
/*
***************************************************
******************************/
SELECT * FROM Information_Schema.Tables
WHERE Table_Type = 'Base Table'
/*
***************************************************
******************************/