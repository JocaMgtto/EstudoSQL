create database Unitech;
use Unitech;

create table professores(
	ID int(11) auto_increment,
    Nome varchar(100),
    cpf varchar(30) unique,
    primary key (ID)
);

create table turmas(
	ID int(11) auto_increment,
    Nome int (11),
    ID_cursoCamp int(11),
    primary key (ID)

);

create table disciplina(
	ID int(11) auto_increment,
    Nome varchar(100),
	primary key(ID)

);

create table alunos(
	ID int(11) auto_increment,
    Nome varchar(200),
    ID_Turma int(11),
    ID_Campus int(11),
    Cpf varchar(50),
    primary key (ID)
);

create table campus(
	ID int(11) auto_increment,
    Nome varchar(150),
    Endereco varchar(200),
    Cidade varchar(200),
    Estado char(2),
	primary key (ID)

);

create table cursos(
	ID int(11) auto_increment,
    Nome varchar(250),
    Area varchar(200),
    Tipo Enum('G', 'E', 'M', 'D'),
    primary key (ID)
);

create table diarioclasse(
	ID int(11) auto_increment,
    ID_Aluno int(11),
    ID_CursoCamp int(11),
    ID_DisciplinaTurm int(11),
    Faltas int(11),
    AE1 decimal(2,1),
    AE2 decimal(2,1),
    status enum('A', 'E', 'R'),
    primary key(ID)
      
);
describe diarioclasse;

create table curso_disciplina(

	ID int(11) auto_increment,
    ID_Curso int(11),
    ID_Disciplina int(11),
    primary key (ID)
);

create table disciplina_prof(
	ID int(11) auto_increment,
    ID_Disciplina int(11),
    ID_Professor int(11),
    primary key(ID)    
);


create table disciplina_turma(
	ID int(11) auto_increment,
    ID_Turma int(11),
    ID_Disciplina int(11),
    primary key (ID)
);

create table curso_campus(
	ID int(11) auto_increment,
    ID_Curso int(11),
    ID_Campus int(11),
    oferta enum('M', 'V', 'N'),
    primary key (ID)
);

alter table alunos
add constraint aluno_turma
    foreign key (ID_Turma) references turmas(ID),
add constraint aluno_campus
    foreign key (ID_Campus) references campus(ID);
    

alter table turmas 
add constraint curso_campus 
foreign key (ID_cursoCamp) references curso_campus(ID);

alter table curso_campus
add constraint curso_campus_curso
foreign key (ID_Curso) references cursos(ID),
add constraint curso_campus_campus
foreign key (ID_Campus) references campus(ID);
describe curso_campus;

alter table curso_disciplina
add constraint curso_disciplina_curso
foreign key (ID_Curso) references cursos(ID),
add constraint curso_disciplina_disciplina
foreign key (ID_Disciplina) references disciplina(ID);

alter table disciplina_prof
add constraint disciplina_prof_disciplina
foreign key (ID_Disciplina) references disciplina(ID),
add constraint disciplina_prof_prof
foreign key (ID_Professor) references professores(ID);

alter table disciplina_turma
add constraint disciplina_turma_turma
foreign key (ID_Turma) references turmas(ID),
add constraint disciplina_turma_disciplina
foreign key (ID_Disciplina) references disciplina(ID);

alter table diarioclasse
add constraint diarioclasse_aluno
foreign key (ID_Aluno) references alunos(ID),
add constraint diarioclasse_Curso_camp
foreign key (ID_CursoCamp) references curso_campus(ID),
add constraint diarioclasse_disciplinaTurm
foreign key (ID_DisciplinaTurm) references disciplina_turma(ID);

describe diarioclasse;
describe alunos;
describe campus;
describe curso_campus;
describe curso_disciplina;
describe cursos;
describe disciplina;
describe disciplina_prof;
describe disciplina_turma;
describe professores;
describe turmas;






