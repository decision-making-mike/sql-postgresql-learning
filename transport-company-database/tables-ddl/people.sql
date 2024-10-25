create table people (
    id integer primary key generated always as identity,
    -- The type is 'varchar(20)' just for not having
    --  to define a check constraint with 'text' or
    --  'varchar'. I do not understand check
    --  constraints yet. The length '20' is a
    --  more or less arbitrary value, but which
    --  seems to me to be short enough and long
    --  enough for my needs during my learning of SQL
    --  and PostgreSQL.
    name varchar(20) not null
);
