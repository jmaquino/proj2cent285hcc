-- addInsertFuncs.sql - this script will make it easier to add Users and Suggestions
-- make sure that createTables.sql is run before this

-- create plpgsql language
drop language if exists plpgsql cascade;
create language plpgsql;

-- create function for adding Users and returning id
create or replace function insertUsers(_name text, _division text, _department text, _username text, _password text)
  returns integer as
  $func$
  begin
    execute 'insert into users_view (name, division, department, username, password) values (' ||
      quote_literal(_name) || ',' || quote_literal(_division) || ',' || quote_literal(_department) || ',' || quote_literal(_username) || ',' ||
      quote_literal(_password) || ')';
    return currval('user_id_seq');
  end;
  $func$
  language 'plpgsql';
  
-- create function for adding Suggestions and returning id
create or replace function insertSuggestions(_fname text, _lname text, _suggestion text)
  returns integer as
  $func$
  begin
    execute 'insert into suggestions (first_name, last_name, suggestion, created_at, updated_at) values ('
      || quote_literal(_fname) || ',' || quote_literal(_lname) || ',' ||
      quote_literal(_suggestion) || ',' || quote_literal(now()) || ',' || quote_literal(now()) || ')';
    return currval('suggestion_id_seq');
  end;
  $func$
  language 'plpgsql';
  
-- create function for inserting into Users and Suggestions
create or replace function insertSuggestionsUsers(_username text, _name text, _password text, 
_division text, _department text, _fname text, _lname text, _suggestion text)
  returns boolean as
  $func$
  declare
    sql1 text;
    sql2 text;
  begin
    sql1 := 'coalesce((select id from users where username = '
      || quote_literal(_username) || '),insertUsers(' || quote_literal(_name) || 
      ',' || quote_literal(_division) || ',' || quote_literal(_department) || ',' || quote_literal(_username) || 
      ',' || quote_literal(_password) || '))';
    sql2 := 'coalesce((select id from suggestions where suggestion = ' 
      || quote_literal(_suggestion) || '),insertSuggestions(' ||
      quote_literal(_fname) || ',' || quote_literal(_lname) || 
      ',' || quote_literal(_suggestion) || '))';
    execute 'insert into suggestions_users (user_id, suggestion_id) values (' 
      || sql1 || ',' || sql2 || ')';
    return 't';
  end;
  $func$
  language 'plpgsql';
  
-- create rule
create or replace rule users_suggestions_ins as on insert to suggestions_users_view
  do instead select insertSuggestionsUsers(new.username, new.name, new.password
  ,new.division, new.department, new.first_name, new.last_name,new.suggestion);
