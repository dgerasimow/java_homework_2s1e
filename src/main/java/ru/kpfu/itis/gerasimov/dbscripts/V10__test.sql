create table cities (
                        id serial primary key,
                        name varchar
);
create table offices (
                         id serial primary key,
                         city integer references cities(id)
);
create table clients (
                         id serial primary key,
                         surname varchar,
                         first_name varchar,
                         middle_name varchar,
                         passport varchar not null,
                         license varchar not null,
                         available_loan integer default 50000 check (available_loan between 50000 and 150000)
);
create table loans (
                       id serial primary key,
                       value integer check (value between 1 and 150000),
                       loan_duration integer check (loan_duration between 1 and 61),
                       office_id integer references offices(id)
);

create table paid_debts (
                            id serial primary key,
                            loan_id integer references loans(id),
                            client_id integer references clients(id),
                            days_after_paid integer
);

-- insert data
--cities
INSERT INTO public.cities(
    name)
VALUES ('moscow');
INSERT INTO public.cities(
    name)
VALUES ('kazan');
--offices
INSERT INTO public.offices(
    city)
VALUES (1);
INSERT INTO public.offices(
    city)
VALUES (1);
INSERT INTO public.offices(
    city)
VALUES (2);
INSERT INTO public.offices(
    city)
VALUES (2);
--clients
INSERT INTO public.clients(
    surname, first_name, middle_name, passport, license)
VALUES ('Иванов', 'Иван', 'Иванович', '9222222222', '92222253252');
INSERT INTO public.clients(
    surname, first_name, middle_name, passport, license)
VALUES ('Алексеев', 'Леонид', 'Павлович', '9222224356', '922352363222');
INSERT INTO public.clients(
    surname, first_name, middle_name, passport, license)
VALUES ('Герасимов', 'Данил', 'Русланович', '9222432453', '92223532522');
INSERT INTO public.clients(
    surname, first_name, middle_name, passport, license)
VALUES ('Русланов', 'Руслан', 'Русланович', '922543566', '922235325222');
--loans
INSERT INTO public.loans(
    value, loan_duration, office_id)
VALUES (50000, 20, 1);
INSERT INTO public.loans(
    value, loan_duration, office_id)
VALUES (50000, 20, 1);
INSERT INTO public.loans(
    value, loan_duration, office_id)
VALUES (50000, 20, 3);
INSERT INTO public.loans(
    value, loan_duration, office_id)
VALUES (50000, 20, 4);
INSERT INTO public.loans(
    value, loan_duration, office_id)
VALUES (50000, 20, 2);
INSERT INTO public.loans(
    value, loan_duration, office_id)
VALUES (50000, 20, 2);
--paid_debts
INSERT INTO public.paid_debts(
    loan_id, client_id)
VALUES (8, 1, 20);
INSERT INTO public.paid_debts(
    loan_id, client_id)
VALUES (9, 2, 19);
INSERT INTO public.paid_debts(
    loan_id, client_id)
VALUES (10, 3, 62);
INSERT INTO public.paid_debts(
    loan_id, client_id)
VALUES (11, 4, 50);
INSERT INTO public.paid_debts(
    loan_id, client_id)
VALUES (12, 4, 20);
INSERT INTO public.paid_debts(
    loan_id, client_id)
VALUES (13, 1, 11);
-- 3 task
select *
from loans left join paid_debts on loans.id = paid_debts.loan_id
where paid_debts.id is null;
-- 4 task
with cte2 as (
    select *
    from loans join offices on office_id = offices.id
), cte1 as (
    select cities.name, cte2.value
    from cte2 join cities on cities.id = cte2.city
), cte3 as (
    select cte1.name, sum(cte1.value)
    from cte1
    group by cte1.name
)
select *
from cte3;

-- 5 task
with cte as (
    select *
    from loans left join paid_debts pd on loans.id = pd.loan_id WHERE (loans.loan_duration - pd.days_after_paid > 61 )
)
select * from cte JOIN clients on cte.client_id = clients.id ORDER BY value DESC