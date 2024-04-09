CREATE USER Diogo WITH PASSWORD '123';

CREATE DATABASE ABDTrabalho
WITH
OWNER = postgres
ENCODING = 'UTF8'
CONNECTION LIMIT = -1;

CREATE TABLE paciente (
id_paciente SERIAL PRIMARY KEY,
codigo VARCHAR(10) UNIQUE NOT NULL,
nome VARCHAR(100) NOT NULL,
idade INTEGER NOT NULL
);

CREATE TABLE medico (
id_medico SERIAL PRIMARY KEY,
crm VARCHAR(10) UNIQUE NOT NULL,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE atende (
id_atende SERIAL PRIMARY KEY,
id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente),
id_medico INTEGER NOT NULL REFERENCES medico(id_medico),
data DATE NOT NULL
);

CREATE TABLE cirurgia (
id_cirurgia SERIAL PRIMARY KEY,
codigo VARCHAR(10) UNIQUE NOT NULL,
data DATE NOT NULL,
descricao VARCHAR(200) NOT NULL,
id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente)
);

create sequence sid_paciente;
create sequence sid_medico;
create sequence sid_atende;
create sequence sid_cirurgia;

insert into paciente values (nextval('sid_paciente'), '145','João', 12),
(nextval('sid_paciente'), '146','Maria', 38),
(nextval('sid_paciente'), '147','Antonio', 29),
(nextval('sid_paciente'), '148','Pedro', 21);

insert into medico values (nextval('sid_medico'), 'm1', 'Marcos', 'Oftalmologista'),
(nextval('sid_medico'), 'm2', 'Tereza', 'Clínico geral'),
(nextval('sid_medico'), 'm3', 'Paulo', 'Pediatra'),
(nextval('sid_medico'), 'm4', 'João', 'Clínico geral');

insert into atende values (nextval('sid_atende'), 1, 2, '09-02-2008'),
(nextval('sid_atende'), 1, 2, '26-03-2006'),
(nextval('sid_atende'), 2, 1, '11-09-2003'),
(nextval('sid_atende'), 3, 3, '13-10-2007'),
(nextval('sid_atende'), 2, 2, '08-05-2008');

insert into cirurgia values (nextval('sid_cirurgia'), 'c1', '01-01-2023','Catarata', 1),
(nextval('sid_cirurgia'), 'c2', '02-01-2023', 'Remover amígdalas', 2),
(nextval('sid_cirurgia'), 'c3', '03-01-2023', 'Cirugia na perna',3),
(nextval('sid_cirurgia'), 'c4', '04-01-2023','Cateterismo', 2);

