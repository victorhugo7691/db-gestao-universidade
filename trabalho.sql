create table Pessoa(
    cpf_pessoa varchar(11) not null,
    nome_pessoa varchar(60) not null,
    endereco_pessoa varchar(100) not null,
    rg_pessoa varchar(7) not null,
    data_nascimento date not null,
    sexo_pessoa varchar(1) not null,
    primary key (cpf_pessoa)
);

create table Telefone(
    cpf_pessoa varchar(11) references Pessoa(cpf_pessoa) not null,
    numero_telefone varchar(12),
    primary key(cpf_pessoa)
);

create table Escola(
    codigo_escola serial not null,
    nome_escola varchar(60) not null,
    email_escola varchar(70) not null,
    pagina_net_escola varchar(100) not null,
    diretor_escola serial,
    primary key(codigo_escola)
);

create table Telefone_escola(
    codigo_escola serial references Escola(codigo_escola) not null,
    numero_escola varchar(12) not null,
    primary key(codigo_escola)
);

create table Aluno(
    cpf_pessoa varchar(11) unique references Pessoa(cpf_pessoa) not null,
    matricula_aluno serial unique not null,
    incio_curso date not null,
    final_curso date not null,
    primary key(cpf_pessoa, matricula_aluno) 
);

create table Funcionario(
    cpf_pessoa varchar(11) unique references Pessoa(cpf_pessoa) not null,
    matricula_funcionario serial unique not null,
    departamento varchar(30) not null,
    data_admissao date not null,
    codigo_escola serial references Escola(codigo_escola) not null,
    primary key(cpf_pessoa, matricula_funcionario)
);

create table Dependente(
    cpf_pessoa varchar(11) references Pessoa(cpf_pessoa) not null,
    matricula_funcionario serial references Funcionario(matricula_funcionario) not null,
    primary key(cpf_pessoa, matricula_funcionario)
);

create table Tecnico(
    cpf_pessoa varchar(11) references Funcionario(cpf_pessoa) not null,
    matricula_funcionario serial references Funcionario(matricula_funcionario) not null,
    primary key(cpf_pessoa, matricula_funcionario) 
);

create table Professor(
    matricula_professor serial unique references Funcionario(matricula_funcionario) not null,
    cpf_pessoa varchar(11) unique references Funcionario(cpf_pessoa) not null,
    primary key(matricula_professor, cpf_pessoa)
);

create table Formacao(
    matricula_professor serial references Professor(matricula_professor) not null,
    cpf_pessoa varchar(11) references Professor(cpf_pessoa) not null,
    nome_formacao varchar(50) not null,
    descricao_formacao varchar(50) not null,
    data_conclusao_formacao date not null,
    primary key(matricula_professor,cpf_pessoa)
);

create table Curso(
	codigo_curso serial unique not null,
    nome_curso varchar(60) not null,
    descricao_curso varchar(70) not null,
    carga_horaria_total_curso time not null,
    cordenador_curso serial,
    codigo_escola serial unique references Escola(codigo_escola) not null,
    primary key(codigo_curso, codigo_escola)
);

create table Matricula(
	matricula_aluno serial references Aluno(matricula_aluno) not null,
    cpf_pessoa varchar(11) references Aluno(cpf_pessoa) not null,
    codigo_curso serial references Curso(codigo_curso) not null,
    codigo_escola serial references Curso(codigo_escola) not null,
    primary key(matricula_aluno, cpf_pessoa, codigo_curso, codigo_escola)
);

create table Disciplina(
	codigo_disciplina serial unique not null,
    nome_disciplina varchar(60) not null,
    carga_horaria_semanal_disciplina time not null,
    codigo_curso serial unique references Curso(codigo_curso) not null,
    codigo_escola serial unique references Curso(codigo_escola) not null,
    primary key(codigo_disciplina, codigo_curso,codigo_escola)
);

create table Pre_requisito (
    codigo_disciplina serial references Disciplina(codigo_disciplina)not null,
    pre_requisito_curso serial references Disciplina(codigo_disciplina)not null,
    primary key(codigo_disciplina,pre_requisito_curso)
);

create table Capacitado (
    codigo_disciplina serial references Disciplina(codigo_disciplina) not null,
    matricula_professor serial references Professor(matricula_professor) not null,
    cpf_pessoa varchar(11) references Professor(cpf_pessoa) not null,
    primary key(codigo_disciplina, matricula_professor, cpf_pessoa)
);

create table Semestre(
	codigo_semestre serial unique not null,
    ano_semestre date not null,
    semestre varchar(15),
    primary key(codigo_semestre)
); 

create table Turma( -- ajustar PK
	codigo_turma serial unique not null,
    codigo_disciplina serial unique references Disciplina(codigo_disciplina) not null,
    codigo_curso serial unique references Disciplina(codigo_curso) not null,
    codigo_escola serial unique references Disciplina(codigo_escola) not null,
    codigo_semestre serial references Semestre(codigo_semestre),
    horario_semanal_turma time not null,
    primary key(codigo_turma, codigo_disciplina)
);

create table Mes_letivo(
	codigo_semestre serial unique references Semestre(codigo_semestre) not null,
    mes_letivo date not null,
    codigo_mes_letivo serial unique not null,
    primary key(codigo_semestre, codigo_mes_letivo)
);

create table Frequencia(-- ajustar PK
	matricula_aluno serial references Aluno(matricula_aluno) not null,
    cpf_pessoa varchar(11) unique references Aluno(cpf_pessoa) not null,
    codigo_turma serial references Turma(codigo_turma) not null,
    codigo_disciplina serial unique references Turma(codigo_disciplina) not null,
    codigo_mes_letivo serial references Mes_letivo(codigo_mes_letivo) not null,
    codigo_semestre serial unique references Mes_letivo(codigo_semestre) not null,
    frequencia int not null,
	primary key(matricula_aluno, codigo_turma, codigo_mes_letivo)
);

create table Avaliacao(
	matricula_aluno serial references Aluno(matricula_aluno) not null,
    cpf_pessoa varchar(11) unique references Aluno(cpf_pessoa) not null,
    codigo_turma serial references Turma(codigo_turma) not null,
    codigo_disciplina serial unique references Turma(codigo_disciplina) not null,
    n1 float not null,
    n2 float not null,
    media float not null,
    situacao varchar(20) not null,
	primary key(matricula_aluno, codigo_turma)
);

create table Horario(
    cod_horario serial unique not null,
    horario time not null,
    primary key(cod_horario)    
);

create table Ministrada(
    cod_horario serial references Horario(cod_horario) not null,
    matricula_professor serial references Professor(matricula_professor) not null,
    cpf_pessoa varchar(11) references Professor(cpf_pessoa) not null,
    codigo_turma serial references Turma(codigo_turma) not null,
    codigo_disciplina serial unique references Turma(codigo_disciplina) not null,
    primary key(matricula_professor, codigo_turma, cod_horario)
);

create table Projeto(
	codigo_projeto serial unique not null,
    nome_projeto varchar(60) not null,
    descricao_projeto varchar(70) not null,
    codigo_escola serial unique references Escola(codigo_escola) not null,
    primary key(codigo_projeto, codigo_escola)
);

create table Projeto_pesquisa(
	codigo_projeto_pesquisa serial references Projeto(codigo_projeto) not null,
    codigo_escola serial references Projeto(codigo_escola) not null,
    primary key(codigo_projeto_pesquisa, codigo_escola)
);

create table Projeto_extencao(
	codigo_projeto_extencao serial unique references Projeto(codigo_projeto) not null,
    codigo_escola serial unique references Projeto(codigo_escola) not null,
    primary key(codigo_projeto_extencao, codigo_escola)
);

create table Empresa(
	cnpj_empresa varchar(15) unique not null,
    nome_empresa varchar(60) not null,
    email_empresa varchar(100) not null,
    representante_empresa varchar(70) not null,
    primary key(cnpj_empresa)
);

create table Apoio(
	codigo_projeto_extencao serial references Projeto_extencao(codigo_projeto_extencao) not null,
    codigo_escola serial references Projeto_extencao(codigo_escola) not null,
    cnpj_empresa varchar(15) references Empresa(cnpj_empresa) not null,
    primary key(codigo_projeto_extencao, codigo_escola, cnpj_empresa)
);

create table Publicacao_projeto(
	codigo_pub_projeto serial references Projeto(codigo_projeto) not null,
    titulo varchar(70) not null,
    autor varchar(70) not null,
    numero_pagina int not null,
    nome_evento varchar(70) not null,
    primary key(codigo_pub_projeto)
);

create table Participa(
	codigo_projeto serial references Projeto(codigo_projeto) not null,
    codigo_escola serial unique references Projeto(codigo_escola) not null,
    matricula_aluno serial references Aluno(matricula_aluno) not null,
    cpf_pessoa varchar(11) references Aluno(cpf_pessoa) not null,
    primary key(codigo_projeto, codigo_escola, matricula_aluno, cpf_pessoa)
);

create table Conteudo(
	codigo_conteudo serial unique not null,
    nome_conteudo varchar(70) not null,
    descricao_conteudo varchar(60) not null,
    data_publicacao_conteudo date not null,
   -- matricula_professor serial references Professor(matricula_professor) not null,
    primary key(codigo_conteudo)
);

create table Disponibilizado (
    matricula_professor serial references Professor(matricula_professor) not null,
    cpf_pessoa varchar(11) references Professor(cpf_pessoa) not null,
    codigo_turma serial references Turma(codigo_turma) not null,
    codigo_disciplina serial references Turma(codigo_disciplina) not null,
    codigo_conteudo serial  references Conteudo(codigo_conteudo) not null,
    primary key (matricula_professor, codigo_turma, codigo_conteudo)
);

create table Atividade(
	codigo_atividade serial unique not null,
    codigo_conteudo serial unique references Conteudo(codigo_conteudo) not null,
    anexo_atividade varchar(100) not null,
    data_entrega_atividade date not null,
    tipo_atividade varchar(60) not null,
    primary key(codigo_atividade, codigo_conteudo)
);

create table Forum(
	codigo_forum serial unique not null,
    codigo_conteudo serial unique references Conteudo(codigo_conteudo) not null,
    nome_forum varchar(70) not null,
    descricao_forum varchar(70) not null,
    primary key(codigo_forum, codigo_conteudo)
);

create table Arquivo (
    codigo_arquivo serial unique not null,
    codigo_conteudo serial unique references Conteudo(codigo_conteudo) not null,
    primary key(codigo_arquivo, codigo_conteudo)
);

create table Respondida(
	codigo_atividade serial references Atividade(codigo_atividade) not null,
    codigo_conteudo serial unique references Atividade(codigo_conteudo) not null,
    matricula_aluno serial references Aluno(matricula_aluno) not null,
    cpf_pessoa varchar(11) references Aluno(cpf_pessoa) not null,
    primary key(codigo_atividade, codigo_conteudo, matricula_aluno, cpf_pessoa)
);

create table Comentada(
	codigo_forum serial references Forum(codigo_forum)not null,
    codigo_conteudo serial unique references Conteudo(codigo_conteudo) not null,
    matricula_aluno serial references Aluno(matricula_aluno) not null,
    cpf_pessoa varchar(11) references Aluno(cpf_pessoa) not null,
     primary key(codigo_forum, codigo_conteudo, matricula_aluno, cpf_pessoa)
);



-- ---------------------------------Apagando Tabelas-------------------------------------------

drop table Comentada;
drop table Respondida;
drop table Arquivo;
drop table Forum;
drop table Atividade;
drop table Disponibilizado;
drop table Conteudo;
drop table Participa;
drop table Publicacao_projeto;
drop table Apoio;
drop table Empresa;
drop table Projeto_extencao;
drop table Projeto_pesquisa;
drop table Projeto;
drop table Ministrada;
drop table Horario;
drop table Avaliacao;
drop table Frequencia;
drop table Mes_letivo;
drop table Turma;
drop table Semestre;
drop table Capacitado;
drop table Pre_requisito;
drop table Disciplina;
drop table Matricula;
drop table Curso;
drop table Formacao;
drop table Professor;
drop table Tecnico;
drop table Dependente;
drop table Funcionario;
drop table Aluno;
drop table Telefone_escola;
drop table Escola;
drop table Telefone;
drop table Pessoa;