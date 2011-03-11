-- createTables.sql
-- create sequences
drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;
drop sequence if exists suggestion_id_seq cascade;
create sequence suggestion_id_seq;
-- create tables
drop table if exists users cascade;
create table users(
id integer not null primary key default nextval('user_id_seq'),
name text,
division text,
department text,
username text unique,
password text,
enc_pass text,
salt text
);
drop table if exists suggestions cascade;
create table suggestions(
id integer not null primary key default nextval('suggestion_id_seq'),
first_name text,
last_name text,
suggestion text unique,
created_at timestamp,
updated_at timestamp
);
drop table if exists suggestions_users cascade;
create table suggestions_users(
user_id integer references users(id),
suggestion_id integer references suggestions(id)
);
-- create view
drop view if exists suggestions_users_view cascade;
create view suggestions_users_view as
select users.id as userid,users.username,users.name,users.password,
users.division,users.department,suggestions.first_name,suggestions.last_name,
suggestions.id as suid,suggestions.suggestion,suggestions.created_at,suggestions.updated_at
from users join suggestions_users on users.id=suggestions_users.user_id
join suggestions on suggestions_users.suggestion_id=suggestions.id
;
