
/* Trabalho de Banco de Dados - Parte 02 - Implementação
	Professora Daniela Musa - ICT/UNIFESP
    Alunos: Gabriel Sardinha - RA:140853 // Maycon André - RA: 140690
*/

# --Implementação tabelas--

create table unidade(
	codUnid integer UNIQUE, 
    nomeUnid varchar(30), 
    UFUnid varchar (2), 
    cidadeUnid varchar(20), 
    codCart integer UNIQUE,    
    primary key(nomeUnid),
    foreign key(codCart) references carteira(codCart)
);

create table cambio(
	codCamb integer UNIQUE,
    primary key(codCamb)
);

create table cripto(
	codCambCripto integer UNIQUE, 
    nomeCambCripto varchar(20),
    blockchain varchar(30),
    primary key(codCambCripto),
    foreign key(codCambCripto) references cambio(codCamb)
);

create table cambioFisico(
	codCambFisico integer UNIQUE, 
    nomeCambFisico varchar(20),
    paisOrigem varchar(30),
    primary key(codCambFisico),
    foreign key(codCambFisico) references cambio(codCamb)
);

create table precos(
	codCamb integer UNIQUE,
    preco float,
    taxaTrans float,
    primary key(codCamb),
    foreign key(codCamb) references cambio(codCamb)
);

create table carteira(
	codCart integer,
    codCamb integer,
    qnt float,
    primary key(codCart, codCamb),
    foreign key(codCamb) references cambio(codCamb)
);

create table funcionarios(
	codFunc integer UNIQUE,
    codUnid integer,
    nomeFunc varchar(30),
    salario float,
    horarioInicio time,
    horarioFim time,
    primary key(codFunc,codUnid),
    foreign key(codUnid) references unidade(codUnid)
);

create table atendimento(
	codFunc integer UNIQUE,
    cargoFunc varchar(20),
    funcao varchar(30),
    primary key(codFunc, cargoFunc),
    foreign key(codFunc) references funcionarios(codFunc)
);

create table administracao(
	codFunc integer UNIQUE,
    cargoFunc varchar(20),
    funcao varchar(30),
    primary key(codFunc, cargoFunc),
    foreign key(codFunc) references funcionarios(codFunc)
);

create table cliente(
	cpf integer UNIQUE,
    nomeClie varchar(30),
    codCart integer UNIQUE,
    primary key(cpf),
    foreign key(codCart) references carteira(codCart)
);

create table transacoes_cliente(
	id integer UNIQUE,
    tipo integer,
    codUnid int UNIQUE,
    cpf int UNIQUE,
    qnt float,
    primary key(id),
    foreign key(codUnid) references unidade(codUnid),
    foreign key(cpf) references cliente(cpf)
);

create table transacoes_unidades(
	id integer UNIQUE,
    tipo integer,
    codUnid1 int UNIQUE,
    codUnid2 int UNIQUE,
    qnt float,
    primary key(id),
    foreign key(codUnid1) references unidade(codUnid),
    foreign key(codUnid2) references unidade(codUnid)
);

alter table unidade add foreign key(codCart) references carteira(codCart);


# -- Criando Instancias --
insert into cambio value(1);
insert into cambio value(2);
insert into cambio value(3);
insert into cambio value(4);
insert into cambio value(5);
insert into cambio value(6);
insert into cambio value(7);
insert into cambio value(8);
insert into cambio value(9);
insert into cambio value(10);

insert into cambiofisico
value(1,'Real','Brasil');
insert into cambiofisico
value(2,'Libra','Inglaterra');
insert into cambiofisico
value(3,'Euro','Europa');
insert into cambiofisico
value(4,'Dolar','EUA');
insert into cambiofisico
value(5,'Peso Argentino','Argentina');

insert into cripto
values(6,'Bitcoin','BTC');
insert into cripto
values(7,'Ethereum','ETH');
insert into cripto
values(8,'XRP','XRP');
insert into cripto
values(9,'Polkadot','DOT');
insert into cripto
values(10,'Litecoin','LTC');

insert into precos
values(1,1,1);
insert into precos
values(2, 7.46, 0.25);
insert into precos
values(3, 6.49, 0.25);
insert into precos
values(4, 5.37, 0.25);
insert into precos
values(5, 0.061, 0.25);
insert into precos
values(6, 49510.50, 0.15);
insert into precos
values(7, 1751.14, 0.10);
insert into precos
values(8, 0.5144, 0.15);
insert into precos
values(9, 31.15, 0.15);
insert into precos
values(10, 208.59, 0.15);

insert into unidade
values(1, 'Unidade Talim', 'SP', 'Sao Jose dos Campos', 1);
insert into unidade
values(2, 'Unidade Santana', 'SP', 'Sao Paulo', 2);
insert into unidade
values(3, 'Unidade Barra', 'RJ', 'Rio de Janeiro', 3);

insert into cliente
values(462756987,'Gabriel Sardinha', 4);
insert into cliente
values(724686988,'Maycon Andre', 5);

insert into funcionarios
values(1, 1, 'Anderson Pereira', 3054.36, '08:00', '18:00');
insert into funcionarios
values(2, 1, 'Flavio Roberto', 4666.42, '15:00', '17:00');
insert into funcionarios
values(3, 2, 'Thiago Nigro', 1500.00, '08:00', '18:00');
insert into funcionarios
values(4, 3, 'Felipe Cunha', 1500.00, '08:00', '18:00');
insert into funcionarios
values(5, 2, 'Ricardo Neves', 10000, '15:00', '17:00');
insert into funcionarios
values(6, 1, 'Thales Lobo', 1500.00, '08:00', '18:00');

insert into atendimento
values(1, 'Gerente', 'Gerenciar Funcionarios');
insert into atendimento
values(6, 'Atendente', 'Atender Publico');
insert into atendimento
values(3, 'Atendente', 'Atender Publico');
insert into atendimento
values(4, 'Atendente', 'Atender Publico');

insert into administracao
values(2, 'Financeiro', 'Compra e Venda de moedas');
insert into administracao
values(5, 'RH', 'Contratação e Demissão');

insert into carteira
values(1, 4, 50000);
insert into carteira
values(1, 2, 50000);
insert into carteira
values(1, 3, 50000);
insert into carteira
values(2, 4, 30000);
insert into carteira
values(2, 2, 30000);
insert into carteira
values(2, 3, 30000);
insert into carteira
values(3, 7, 300);
insert into carteira
values(4,1,10);
insert into carteira
values(5,1,10)

/* ações à se fazer para o trabalho:
1) modificar taxa do etherum
2) modificar taxa do real
3) aumentar o salário dos Atendentes
4) registrar transações
5) verificar saldo de clientes
6) adiquirir mais moedas
 */
