create table people (
    -- The ID of the person.
    id integer primary key generated always as identity,
    -- The name of the person. I made a decision not to
    --  separate first and last names, and
    --  similar parts of a "name". Time will tell if
    --  this decision makes sense.
    -- The type is "varchar(20)" just for not having
    --  to define a check constraint with "text" or
    --  "varchar". I do not understand check
    --  constraints yet. The length "20" is a
    --  more or less arbitrary value, but which
    --  seems to me to be short enough and long
    --  enough for my needs during my learning of SQL
    --  and PostgreSQL.
    name varchar(20) not null
);

create table companies (
    -- The ID of the company.
    id integer primary key generated always as identity,
    -- The registration number of the company. I am
    --  assuming that every company is registered in
    --  a register. I do not specify what register it is
    --  to make this database agnostic of the fact that
    --  various states use various registers.
    -- The type is "integer" because I think it is
    --  simple. But in general I believe I could also
    --  use "varchar" or "text".
    registration_number integer not null
);

create table people_companies (
    -- The ID of the relationship between the and the
    --  company.
    id integer primary key generated always as identity,
    -- The ID of the person.
    person_id integer not null references people,
    -- The ID of the company.
    company_id integer not null references companies
);

create table addresses (
    -- The ID of the address.
    id integer primary key generated always as identity,
    -- The address.
    -- The type is "varchar(100)" just for not having
    --  to define a check constraint with "text" or
    --  "varchar". I do not understand check
    --  constraints yet. The length "100" is a
    --  more or less arbitrary value, but which
    --  seems to me to be short enough and long
    --  enough for my needs during my learning of SQL
    --  and PostgreSQL.
    address varchar(100) not null,
    -- The GPS location of the address.
    -- As for the type, see the comment for the column
    --  "gps_location" in the DDL for the table
    --  "vehicles".
    gps_location varchar(20) not null
);

create table vehicles (
    -- The ID of the vehicle.
    id integer primary key generated always as identity,
    -- The maximum cargo that the vehicle can be loaded.
    max_cargo_weight_in_kg integer not null,
    -- The GPS location of the vehicle.
    -- The type is "varchar(20)", because I expect
    --  this column to store strings representing
    --  decimal degrees, in a form of
    --  "90.123456,180.123456".
    gps_location varchar(20) not null
);

create table orders (
    -- The ID of the order.
    id integer primary key generated always as identity,
    -- The type is "timestamp" only because I think it
    --  is the simplest type in this case.
    acceptance_date_and_time timestamp not null,
    -- The ID of the person that has placed the order.
    order_placing_person_id integer not null references people,
    -- The ID of the person to hand the cargo over.
    cargo_handing_over_person_id integer not null references people,
    -- The ID of the person to receive the cargo.
    cargo_receiving_person_id integer not null references people,
    -- The ID of the address of the place of origin of
    --  the cargo.
    place_of_origin_address_id integer not null references addresses,
    -- The ID of the address of the place of destination
    --  of the cargo.
    place_of_destination_address_id integer not null references addresses
);

create table parcels (
    -- The ID of the parcel.
    id integer primary key generated always as identity,
    -- The ID of the order that the parcel belongs to.
    order_id integer not null references orders,
    -- The estimated weight of the parcel in kilograms.
    estimated_weight_in_kg integer not null
);

create table shipments (
    -- The ID of the shipment.
    id integer primary key generated always as identity,
    -- The ID of the vehicle that makes the shipment.
    vehicle_id integer not null references vehicles,
    -- The ID of the parcel.
    parcel_id integer not null references parcels,
    -- The ID of the address of the shipment.
    address_id integer not null references addresses,
    -- The ID of the date and time of the shipment.
    -- As for the type, see the comment for the column
    --  "acceptance_date_and_time" in the table "orders".
    date_and_time timestamp not null
);

create table deliveries (
    -- The ID of the delivery.
    id integer primary key generated always as identity,
    -- The ID of the shipment of the cargo of this
    --  delivery.
    shipment_id integer not null references shipments,
    -- The ID of the address of the delivery.
    address_id integer not null references addresses,
    -- The date and time of the delivery.
    -- As for the type, see the comment for the column
    --  "acceptance_date_and_time" in the table "orders".
    date_and_time timestamp not null
);

create table required_payments (
    -- The ID of the payment.
    id integer primary key generated always as identity,
    -- The ID of the order that the payment is required
    --  for.
    order_id integer not null references orders,
    -- The amount of money to pay.
    amount integer not null,
    -- The due date of the payment.
    due_date interval day not null
);

create table done_payments (
    -- The ID of the payment.
    id integer primary key generated always as identity,
    -- The ID of the required payment that corresponds to
    --  this payment.
    required_payment_id integer not null references required_payments,
    -- The date of the payment.
    date interval day not null
);
