# SQL and PostgreSQL learning

A blog documenting me learning of SQL and PostgreSQL

## 24 Oct, 2024 (day 11)

I have been trying to verify that it actually works what I wrote in the scripts. I think I have succeeded. But, the way I have achieved it feels obscure enough for me to have a feeling that what I have done is, for some reason, redundant in normal database usage.

At any rate, I am publishing the script below. I include not the file with it in the repository because I have decided to keep it somewhere else on the disk. I think it might serve as a general reference for me future PostgreSQL usage. What follows, I want to avoid keeping two copies of the same script on disk, of course not counting any backups.

It is not complete, in the sense I know not everything about it I would like. Confer me comments therewithin.

```sql
-- For more readable displaying.
\x on

-- Why the "select distinct" seems to work the way I
--  expect it to? Here, it feels just too easy to believe
--  that it accomplishes displaying distinct rows, that
--  is, "distinct" in the way I understand it here.
select distinct
    c.table_name,
    c.column_name,
    data_type,
    character_maximum_length,
    tc.constraint_type,
    -- In general I prefer sticking to a standard way of
    --  doing something rather than coming
    --  up with a custom way, like the one below,
    --  employed by the usage of "case". But I
    --  believe now the script does its job better.
    --  However, I am not sure whether I can treat
    --  "NO" and "NOT NULL" as equivalent here. If I
    --  could, then what should be the reason of
    --  introducing the syntax "NOT NULL" instead of
    --  a syntax more aligned with the column name,
    --  namely "IS NULLABLE" or similar? Or, why should
    --  the column name, and semantics of course, not be
    --  "NOT NULL"?
    case
        when is_nullable = 'NO' then 'NOT NULL'
        else ''
    end,
    identity_generation
from
    information_schema.columns c
    -- Why seems the "left outer join" to work the way I
    --  expect it to? Why not "right outer join"?
    -- What is the relation between join order in
    --  case of three and more tables and the left
    --  and right joins?
    left outer join
        information_schema.key_column_usage kcu
        on
            c.column_name = kcu.column_name
    left outer join
        information_schema.table_constraints tc
        on
            tc.constraint_name = kcu.constraint_name
where
    -- Could my tables be in any other schema than
    --  "public"? Can I assume this constraint will
    --  always return all the tables I have created,
    --  and only them?
    c.table_schema = 'public'
order by
    c.table_name
-- Semicolon in a separete line just for consistency with
--  the formatting of the whole script.
;
```

I believe this script allows me be sure, as much as a beginner sure should feel in what he diffidently does, that me DDL works. And so, according to what I said yesterday, I am also publishing the DDL of the tables I have created so far. You can see it in the repository, [here](https://github.com/decision-making-mike/sql-postgresql-learning/tree/main/transport-company-database/tables-ddl).

Other than the DDL, I am including me general comments pertaining the database design and so on. You can see it in the file `general-comments.txt`, [here](https://github.com/decision-making-mike/sql-postgresql-learning/blob/main/transport-company-database/general-comments.txt).

### TODOs

1. New database model tables adding consideration
2. PostgreSQL documentation continuation
3. Model implementation continuation

## 23 Oct, 2024 (day 10)

I red here and there about window functions. They seem not so difficult in terms of usage in databases. It is their use cases, the business logic, that seem more difficult.

I have created separate tables for companies and the relations between companies and people. The objective was to avoid duplication of the registration number of a company when it has more than one person assigned.

I have created the people, companies and vehicles tables. But I will not present the DDL yet because I have not checked whether the tables are created properly. Even considering I saw not any errors.

As soon as all the DDL is prepared and published, I plan to archive the model. By that I mean to move the file with it to an "archive" directory within the repository and change it not anymore. I should concentrate solely on the database. I believe in such a small, learning project like this it is reasonable to stick to one source of truth. It is better not to have to update multiple places with a single change, like both the model and the database. Saves me time and mistakes.

### TODOs

1. New database model tables adding consideration
2. PostgreSQL documentation continuation
3. Proper text file table creation validation way finding
4. Model implementation continuation

## 22 Oct, 2024 (day 9)

I have red chapters 2 and 3 of the PostgreSQL documentation, partly already yesterday, after publishing the day 8 update. I have thus completed the tutorial and part I. What I specifically yet understand not are window functions.

I now plan to read part II and III. Of course, I expect not to complete them before the 30 days pass. They are too big. We will see how far I will go.

I believe reading other parts, that is IV to VII, should not be of me interest during me forseeable learning of PostgreSQL.

Beyond reading, I believe to have successfully created a database, then `pg_dumpall`ed, then `drop`ed this database, and finally restored it with `psql -f`.

I have created a table with `create table` and displayed it with `\dt`. I have inserted a row thereinto with `insert into` and displayed it with `select`.

I discovered https://wiki.postgresql.org/wiki/Don%27t_Do_This

### TODOs

1. New database model tables adding consideration
2. PostgreSQL documentation continuation

## 21 Oct, 2024 (day 8)

I have added the address that a shipment is done at.

I have added descriptions of tables.

I have removed the TODO of "order placing person, cargo handing over person and cargo receiving person companies information adding." It makes no sense as there is already information about companies of any people mentioned in the model.

I should note I base the model not on any strict rules. I mean it not to represent a strict SQL point of view, the less a strict PostgreSQL one. At least for now, while I am learning. For example, I mean the notion of nullability, employed as an attribute of columns, not to adhere stricly to any standard definition. By "can be null" I just wish to mean "can the value be not present."

### TODOs

1. New database model tables adding consideration
2. PostgreSQL tutorial continuation

## 20 Oct, 2024 (day 7)

I have figured out how to push the Git changes to GitHub through the command line. Now I can do things unavailable through the GitHub website, like amending a commit.

I have updated the model a bit. I have removed the terms "consignor" and "consignee" from the "Orders" table. First, as far as I know, they were not relevant to this model. Second, I could not figure out what I had really meant by them. Instead, I am now making use in that table of the terms "Cargo handing over person" and "Cargo receiving person". I have also added the information what person has placed the order. I have reorganized the file with the model for readability.

### TODOs

1. Database model tables columns descriptions adding
2. New database model tables adding consideration
3. Order placing person, cargo handing over person and cargo receiving person companies information adding

## 19 Oct, 2024 (day 6)

I have refined and published the database model. The database is to be used by an example transport company. You can view the model at https://github.com/decision-making-mike/sql-postgresql-learning/blob/main/transport-company-database-model.md.

 I wanted the names of the tables and columns to be as straightforward as possible. 

It is not complete yet. The thing is, in this learning project, I have decided to publish resources early, and make multiple small refinements of them later, instead of publishing them only when I consider them complete. In case of this model, I should definitely add more tables. It lacks information about employees, for example. However, overall I plan not adding too many details. I want it to be an example model. It should be complex enough to allow me to use me current skills, learn new ones, and show them. In the same time it should be simple enough so that I will not get lost in the details.

### TODOs

1. Database model tables columns descriptions adding
2. New database model tables adding consideration

## 18 Oct, 2024 (day 5)

I finished the preface, and, in a way, chapter 1.

Apart from PostgreSQL, I plan to finally visualize me database model. I am not sure yet what would be the best way to do it.

## 14 to 17 Oct, 2024 (days 1 to 4)

Lacking a job too long, I decided to go back to computer science. I am to refresh me SQL basics and learn the basics of PostgreSQL. I have allotted 30 days for this. That means that the last day shall be 13 Nov, 2024. Then, on 14 Nov, 2024, here on the blog I will summarize what I have learnt.

During the first 4 days I have mainly red the Wikipedia article about SQL and some questions on Stack Overflow about "null." I have installed PostgreSQL. I have written a [post on LinkedIn](https://www.linkedin.com/posts/activity-7252380581676601344-ymVo?utm_source=share&utm_medium=member_desktop) about the commitment. I have decided to start this blog. I have decided to start reading the [PostgreSQL documentation](https://www.postgresql.org/docs/12/index.html), the reasons being, it is the official documentation, and it contains a tutorial early on. I have prepared a simple model of a database, which I am planning to transform into a database, and it then should accompany me theoretical learning.
