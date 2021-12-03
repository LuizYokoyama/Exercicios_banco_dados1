CREATE TABLE UF (
 Sigla_UF CHAR(2) NOT NULL,
 Nome_UF VARCHAR(20) NOT NULL,
 CONSTRAINT PRK_UF PRIMARY KEY (Sigla_UF));
CREATE INDEX id_nome_uf ON UF(Nome_UF);
CREATE TABLE MUNICIPIO (
 Codigo_Municipio INTEGER NOT NULL,
 Nome_Municipio VARCHAR(80) NOT NULL,
 Sigla_UF CHAR(2) NOT NULL,
 CONSTRAINT PRK_MUNICIPIO PRIMARY KEY (Codigo_Municipio),
 CONSTRAINT FRK_MUNICIPIO_UF FOREIGN KEY (Sigla_UF) REFERENCES UF(Sigla_UF));
CREATE INDEX id_nome_municipio ON MUNICIPIO(Nome_Municipio);
CREATE TABLE BAIRRO (
 Codigo_Bairro INTEGER NOT NULL,
 Nome_Bairro VARCHAR(80) NOT NULL,
 Codigo_Municipio INTEGER NOT NULL,
 CONSTRAINT PRK_BAIRRO PRIMARY KEY (Codigo_Bairro),
 CONSTRAINT FRK_BAIRRO_MUNICIPIO FOREIGN KEY (Codigo_Municipio) REFERENCES MUNICIPIO(Codigo_Municipio));
CREATE INDEX id_nome_bairro ON BAIRRO(Nome_Bairro);
CREATE TABLE LOGRADOURO (
 Codigo_Logradouro INTEGER NOT NULL,
 Nome_Logradouro VARCHAR(80) NOT NULL,
 CEP VARCHAR(8) NOT NULL,
 Codigo_Bairro INTEGER NOT NULL,
 CONSTRAINT PRK_LOGRADOURO PRIMARY KEY (Codigo_Logradouro),
 CONSTRAINT FRK_LOGRADOURO_BAIRRO FOREIGN KEY (Codigo_Bairro) REFERENCES BAIRRO(Codigo_Bairro)); 
CREATE INDEX id_nome_Logradouro ON LOGRADOURO(Nome_Logradouro);
CREATE TABLE ENDERECO (
 Id_Endereco INTEGER NOT NULL,
 Quadra VARCHAR(20) NOT NULL,
 Lote VARCHAR(20) NOT NULL,
 Numero VARCHAR(20) NOT NULL,
 Complemento VARCHAR(255),
 Codigo_Logradouro INTEGER NOT NULL,
 CONSTRAINT PRK_ENDERECO PRIMARY KEY (id_Endereco),
 CONSTRAINT FRK_ENDERECO_LOGRADOURO FOREIGN KEY (Codigo_Logradouro) REFERENCES LOGRADOURO(Codigo_Logradouro));
CREATE TABLE TELEFONE (
 Id_Endereco INTEGER NOT NULL,
 Telefone VARCHAR(20) NOT NULL,
 CONSTRAINT PRK_TELEFONE PRIMARY KEY (id_Endereco, Telefone),
 CONSTRAINT FRK_TELEFONE_ENDERECO FOREIGN KEY (Id_Endereco) REFERENCES ENDERECO(Id_Endereco));
CREATE TABLE PESSOA (
 cpf VARCHAR(11) NOT NULL,
 nome VARCHAR(80) NOT NULL,
 nome_pai VARCHAR(80),
 data_nascimento DATE NOT NULL,
 nome_mae VARCHAR(80) NOT NULL,
 CONSTRAINT PRK_PESSOA PRIMARY KEY (CPF));
CREATE INDEX id_nome ON PESSOA(nome);
CREATE TABLE TIPODEENDERECO (
 Codigo_Tipo_End SMALLINT NOT NULL,
 Nome_Tipo_End VARCHAR(20) NOT NULL,
 CONSTRAINT PRK_TIPODEENDERECO PRIMARY KEY (Codigo_Tipo_End));
CREATE INDEX id_nome_tipo_end ON TIPODEENDERECO(Nome_Tipo_End); 
CREATE TABLE POSSUI (
 cpf VARCHAR(11) NOT NULL,
 Id_Endereco INTEGER NOT NULL,
 Codigo_Tipo_End SMALLINT NOT NULL,
 CONSTRAINT PRK_POSSUI PRIMARY KEY (cpf, Id_Endereco, Codigo_Tipo_End),
 CONSTRAINT FRK_POSSUI_CPF FOREIGN KEY (cpf) REFERENCES PESSOA(cpf),
 CONSTRAINT FRK_POSSUI_ENDERECO FOREIGN KEY (Id_Endereco) REFERENCES ENDERECO(Id_Endereco),
 CONSTRAINT FRK_POSSUI_TIPODEENDERECO FOREIGN KEY (Codigo_Tipo_End) REFERENCES TIPODEENDERECO(Codigo_Tipo_End));
CREATE TABLE DEPENDENTE (
 nome_dependente VARCHAR(80) NOT NULL,
 data_nascimento DATE NOT NULL,
 tipo_dependente VARCHAR(20) NOT NULL,
 cpf VARCHAR(11) NOT NULL,
 CONSTRAINT PRK_DEPENDENTE PRIMARY KEY (nome_dependente, data_nascimento, tipo_dependente, cpf),
 CONSTRAINT FRK_DEPENDENTE_CPF FOREIGN KEY (cpf) REFERENCES PESSOA(cpf));
																   
																   
																   