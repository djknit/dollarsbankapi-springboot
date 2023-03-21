drop database if exists dollarsbankspringbootdb;
create database dollarsbankspringbootdb;
use dollarsbankspringbootdb;

create table users (
	id int auto_increment,
    legal_name varchar(100) not null,
    username varchar(20) unique not null,
    password varchar(30) not null,
    dob date not null,
    primary key (id)
);

create table accounts (
	id int auto_increment,
    acct_num bigint unique not null,
    user_id int not null,
    balance_cents int not null,
    opened_date date not null,
    closed_date date,
    foreign key (user_id) references users(id),
    primary key (id)
);

create table transactions (
	id int auto_increment,
    account_id int not null,
    amount_cents int not null,
    time_of_transaction bigint not null,
	transaction_type varchar(20),
    transaction_num bigint not null,
    foreign key (account_id) references accounts(id),
    primary key (id)
);

create table transfers (
    id int auto_increment,
    sending_transaction_id int not null,
    receiving_transaction_id int not null,
    transfer_num bigint not null,
    foreign key (sending_transaction_id) references transactions(id),
    foreign key (receiving_transaction_id) references transactions(id),
    primary key (id)
);
