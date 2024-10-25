create table companies (
    id integer primary key generated always as identity,
    -- The type is 'integer' because I think it is
    --  simple. But in general I believe I could also
    --  use 'varchar' or 'text'.
    registration_number integer not null
);
