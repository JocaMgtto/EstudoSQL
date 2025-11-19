create database DDL16_10;
use DDL16_10;

/*
Exercicio de criacao de tabela do dia 16/10/2025
Criei as tabelas propostas e nao usei comandos como
alter table pois nao foi necessario, apenas mais simples
como: 

describe;
select;
create;
if not exists;
etc.
Joaquim Menegotto Vieira
ra: 139413
*/

create table if not exists Cursos(
	id int primary key auto_increment,
    nome varchar(100),
    tipoCurso varchar(50)
);

create table if not exists aluno(
	id int primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(15) unique not null,
    endereco varchar(150),
    cidade varchar(50) default 'maringa',
    estado varchar(30) default 'Parana'
);

create table if not exists professores(
	id int auto_increment primary key,
    nome varchar(100) not null, 
    email varchar(120) unique not null,
    telefone varchar(50) not null
);

create table if not exists disciplina(
	id int auto_increment primary key, 
    nome varchar(100) not null, 
    cargaHoraria decimal(5,2),
    semestre char(2)
);

create table if not exists matricula(
	id int primary key auto_increment,
    ra varchar(30) unique not null,
    id_curso int,
    id_aluno int,
    ativo enum('Y', 'N'),
    foreign key (id_curso) references Cursos(id),
    foreign key (id_aluno) references Aluno(id)
);

create table if not exists vinculoDisciplina(
	id int primary key auto_increment,
    id_professor int,
    id_disciplina int,
    id_Cursos int,
    foreign key (id_professor) references professores(id),
    foreign key (id_disciplina) references disciplina(id),
    foreign key (id_Cursos) references Cursos(id)
);
/*
Comandos para inserir dados na tabela
pedi proa chat gerar dados aleatorios 
para nao ter que fazer um por um,
apenas para testar o banco de dados.
*/

insert into Cursos values
(default, 'Engenharia de Software', 'Bacharelado'),
(default, 'Analise e Desenvolvimento de Sistemas', 'Tecnologo'),
(default, 'Direito Civil', 'Pos-graduacao'),
(default, 'Pedagogia', 'Licenciatura'),
(default, 'Gestao de Recursos Humanos', 'Tecnologo'),
(default, 'Ciencia da Computacao', 'Bacharelado'),
(default, 'Excel Avancado', 'Curso Livre'),
(default, 'Marketing Digital', 'Curso Livre'),
(default, 'Matematica Financeira', 'Licenciatura'),
(default, 'Administracao de Empresas', 'Bacharelado');

insert into professores values
(DEFAULT, 'Dr. Ana Costa', 'ana.costa@tech.edu', '11987654321'),
(DEFAULT, 'Ms. Roberto Santos', 'roberto.santos@tech.edu', '21981234567'),
(DEFAULT, 'Dra. Luiza Melo', 'luiza.melo@tech.edu', '44991002000');

insert into disciplina values
(DEFAULT, 'Banco de Dados Avançado', 60.00, '04'),
(DEFAULT, 'Interacao Humano-Computador', 80.00, '03'),
(DEFAULT, 'Calculo I', 90.00, '01');

insert into aluno values
(DEFAULT, 'Maria Silva', '123.456.789-01', 'Rua das Flores, 100', 'Maringa', 'Parana'),
(DEFAULT, 'João Santos', '987.654.321-02', 'Av. Paulista, 500', 'São Paulo', 'São Paulo'),
(DEFAULT, 'Ana Paula Gomes', '111.222.333-44', 'Rua XV de Novembro, 250', 'Curitiba', 'Parana'),
(DEFAULT, 'Pedro Mendes', '555.444.333-21', 'Rua da Bahia, 1200', 'Belo Horizonte', 'Minas Gerais'),
(DEFAULT, 'Camila Lima', '666.777.888-99', 'Av. Paraná, 900', 'Londrina', 'Parana');


insert into matricula values
(DEFAULT, 'RA10012025', 1, 1, 'Y'), 
(DEFAULT, 'RA10012026', 2, 2, 'Y'), 
(DEFAULT, 'RA10012027', 1, 3, 'N');

insert into vinculoDisciplina values
(DEFAULT,1, 1, 1), 
(DEFAULT,2, 2, 2), 
(DEFAULT,3, 3, 3), 
(DEFAULT,1, 1, 2);

/*
Imprimir tabelas, comandos usados: 

Comandos para exibir estrutura da tabela:
"Describe"
Comandos para selecionar e 'imprimir' os
dados da tabela:
"select * from 'nome_tabela'

*/

describe Cursos;
describe aluno;
describe professores;
describe matricula;
describe vinculoDisciplina;
describe disciplina;

select * from Cursos;
select * from aluno;
select * from professores;
select * from matricula;
select * from vinculoDisciplina;
select * from disciplina;

