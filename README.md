# SQL and PostgreSQL learning

A blog documenting me learning of SQL and PostgreSQL

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

It is not complete yet. The thing is, in this learning project, I have decided to publish resources early, and make multiple small refinements of them later, instead of publishing them only when I consider them complete. In case of this model, I should definitely add more tables. It lacks information about employees, for example. However, overall I do not plan adding too many details. I want it to be an example model. It should be complex enough to allow me to use me current skills, learn new ones, and show them. In the same time it should be simple enough so that I will not get lost in the details.

### TODOs

1. Database model tables columns descriptions adding
2. New database model tables adding consideration

## 18 Oct, 2024 (day 5)

I finished the preface, and, in a way, chapter 1.

Apart from PostgreSQL, I plan to finally visualize me database model. I am not sure yet what would be the best way to do it.

## 14 to 17 Oct, 2024 (days 1 to 4)

Lacking a job too long, I decided to go back to computer science. I am to refresh me SQL basics and learn the basics of PostgreSQL. I have allotted 30 days for this. That means that the last day shall be 13 Nov, 2024. Then, on 14 Nov, 2024, here on the blog I will summarize what I have learnt.

During the first 4 days I have mainly red the Wikipedia article about SQL and some questions on Stack Overflow about "null." I have installed PostgreSQL. I have written a [post on LinkedIn](https://www.linkedin.com/posts/activity-7252380581676601344-ymVo?utm_source=share&utm_medium=member_desktop) about the commitment. I have decided to start this blog. I have decided to start reading the [PostgreSQL documentation](https://www.postgresql.org/docs/12/index.html), the reasons being, it is the official documentation, and it contains a tutorial early on. I have prepared a simple model of a database, which I am planning to transform into a database, and it then should accompany me theoretical learning.
