-- loadInitData.sql a script to load initial data
-- make sure addInsertFuncs.sql is run before this

-- add Suggestions and Users records
insert into suggestions_users_view (username,name,password,division,department,first_name,last_name,suggestion)
  values ('johndoe','John Doe','pass1','CENT','Programming','John','Doe','Suggestion_1');
insert into suggestions_users_view (username,name,password,division,department,first_name,last_name,suggestion)
  values ('janedoe','Jane Doe','pass2','CENT','Networking','Jane','Doe','Suggestion_2');
insert into suggestions_users_view (username,name,password,division,department,first_name,last_name,suggestion)
  values ('jmaquino','Jose Aquino','pass3','CENT','Admin','Jose','Aquino','Suggestion_3');
insert into suggestions_users_view (username,name,password,division,department,first_name,last_name,suggestion)
  values ('billgates','Bill Gates','pass4','ICS','Admin','Bill','Gates','Suggestion_4');
insert into suggestions_users_view (username,name,password,division,department,first_name,last_name,suggestion)
   values ('johnsmith','John Smith','pass5','ICS','Datacom','John','Smith','Suggestion_5');
insert into suggestions_users_view (username,name,password,division,department,first_name,last_name,suggestion)
  values ('davylocker','Davy Locker','pass6','ICS','Security','Davy','Locker','Suggestion_6');
