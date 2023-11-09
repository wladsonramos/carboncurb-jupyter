create schema appcc;

set schema 'appcc';

create table departamento(
    id serial primary key,
    nome varchar(30),
    qtd_funcionarios integer
);

create table funcionario(
    id serial primary key,
    cpf varchar(14),
    pnome varchar(30),
    unome varchar(30),
    cod_depto integer
);

create table trajeto(
    id serial primary key,
    cod_funcionario integer,
    endereco_residencia varchar(30),
    endereco_empresa varchar(30),
    qtd_km double precision,
    veiculo varchar(30),
    qtd_carbono_emitido double precision
);

create table reducao_de_emissao(
    id serial primary key,
    cod_trajeto integer,
    dia_semana varchar(20),
    qtd_reducao double precision,
    meio_transporte varchar(30)
);

alter table funcionario
add constraint funcionario_departamento_fk
foreign key(cod_depto)
references departamento(id);

alter table trajeto
add constraint trajeto_funcionario_fk
foreign key(cod_funcionario)
references funcionario(id);

alter table reducao_de_emissao
add constraint reducao_trajeto
foreign key(cod_trajeto)
references trajeto(id);

insert into departamento (nome, qtd_funcionarios)
values
    ('Contabilidade', 1),
    ('Finanças', 1),
    ('Recursos Humanos', 1),
    ('Jurídico', 1),
    ('Vendas', 3),
    ('Marketing', 2),
    ('Setor de T.I', 1);
	

insert into funcionario (cpf, pnome, unome, cod_depto)
values
    ('111.111.111-11', 'Pedro', 'Sousa', 1),
    ('222.222.222-22', 'Claudia', 'Martins', 5),
    ('333.333.333-33', 'João', 'Silva', 6),
    ('444.444.444-44', 'Paula', 'Santos', 4),
    ('555.555.555-55', 'Maria', 'Ferreira', 2),
    ('666.666.666-66', 'Gustavo', 'Souza', 3),
    ('777.777.777-77', 'Marina', 'Almeida', 5),
    ('888.888.888-88', 'Carlos', 'Ribeiro', 5),
    ('999.999.999-99', 'Vinicius', 'Andrade', 6),
    ('000.000.000-00', 'Marcia', 'Menezes', 7);

insert into trajeto (cod_funcionario, endereco_residencia, endereco_empresa, qtd_km, veiculo, qtd_carbono_emitido)
values
    (1, 'Avenida Paulista', 'Avenida Brigadeiro Faria Lima', 10.5, 'Carro', 4.77),
    (2, 'Rua Augusta', 'Avenida Brigadeiro Faria Lima', 15.3, 'Carro', 6.96),
    (3, 'Rua Oscar Freire', 'Avenida Brigadeiro Faria Lima', 8.0, 'Carro', 3.64),
    (4, 'Avenida Faria Lima', 'Avenida Brigadeiro Faria Lima', 12.5, 'Carro', 5.68),
    (5, 'Avenida Rebouças', 'Avenida Brigadeiro Faria Lima', 5.8, 'Carro', 2.63),
    (6, 'Rua da Consolação', 'Avenida Brigadeiro Faria Lima', 9.8, 'Carro', 4.45),
    (7, 'Rua Haddock Lobo', 'Avenida Brigadeiro Faria Lima', 6.4, 'Carro', 2.91),
    (8, 'Rua Bela Cintra', 'Avenida Brigadeiro Faria Lima', 11.6, 'Carro', 5.27),
    (9, 'Rua da Mooca', 'Avenida Brigadeiro Faria Lima', 7.0, 'Moto', 0.79),
    (10, 'Avenida Santo Amaro', 'Avenida Brigadeiro Faria Lima', 14.3, 'Carro', 6.50);

insert into reducao_de_emissao (cod_trajeto, dia_semana, qtd_reducao, meio_transporte)
values
    (1, 'Segunda-feira', 2.67, 'Ônibus'),
    (2, 'Terça-feira', 3.9, 'Ônibus'),
    (3, 'Quarta-feira', 2.04, 'Ônibus'),
    (4, 'Quinta-feira', 3.68, 'Ônibus'),
    (5, 'Sexta-feira', 2.63, 'Bicicleta'),
    (6, 'Segunda-feira', 2.49, 'Ônibus'),
    (7, 'Terça-feira', 2.91, 'Bicicleta'),
    (8, 'Quinta-feira', 2.95, 'Ônibus'),
    (9, 'Quarta-feira', 0.79, 'Bicileta'),
    (10, 'Segunda-feira', 3.64, 'Ônibus');
	

