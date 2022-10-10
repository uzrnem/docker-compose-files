docker exec -it cassandratest-cassandra-1 bash

cqlsh -u cassandra -p cassandra

cassandra@cqlsh> CREATE KEYSPACE IF NOT EXISTS cycling
  WITH REPLICATION = {
   'class' : 'SimpleStrategy',
   'replication_factor' : 1
  };

cassandra@cqlsh> DESCRIBE keyspaces;

cycling  system_auth         system_schema  system_views
system   system_distributed  system_traces  system_virtual_schema

cassandra@cqlsh> use cycling;
cassandra@cqlsh:cycling>

DROP TABLE IF EXISTS cycling.cyclist_name;

CREATE TABLE cycling.cyclist_name (
  id UUID PRIMARY KEY,
  lastname text,
  firstname text,
  details_ map<text,text>
);

INSERT INTO cycling.cyclist_name (id, lastname, firstname, details_) VALUES (e7cd5752-bc0d-4157-a80f-7523add8dbcd, 'VAN DER BREGGEN', 'Anna', {'details_age':'35', 'details_bday':'27/07/1980', 'details_nation':'AUSTRALIA'});
INSERT INTO cycling.cyclist_name (id, lastname, firstname, details_) VALUES (e7ae5cf3-d358-4d99-b900-85902fda9bb0, 'FRAME', 'Alex', {'details_age':'54', 'details_bday':'27/07/1961', 'details_nation':'ITALY'});
INSERT INTO cycling.cyclist_name (id, lastname, firstname, details_) VALUES (220844bf-4860-49d6-9a4b-6b5d3a79cbfb, 'TIRALONGO', 'Paolo', {'details_age':'23', 'details_bday':'27/07/1992', 'details_nation':'CANADA'});
INSERT INTO cycling.cyclist_name (id, lastname, firstname, details_) VALUES (6ab09bec-e68e-48d9-a5f8-97e6fb4c9b47, 'KRUIKSWIJK', 'Steven', {'details_age':'23', 'details_bday':'27/07/1992', 'details_nation':'GERMANY'});
INSERT INTO cycling.cyclist_name (id, lastname, firstname, details_) VALUES (fb372533-eb95-4bb4-8685-6ef61e994caa, 'MATTHEWS', 'Michael', {'details_age':'28', 'details_bday':'27/07/1987', 'details_nation':'NETHERLANDS'});

DROP TABLE IF EXISTS cycling.cyclist_races;
DROP TYPE IF EXISTS cycling.race;

CREATE TYPE cycling.race (
  race_title text,
  race_date timestamp,
  race_time time);

CREATE TABLE cycling.cyclist_races (
  id UUID PRIMARY KEY,
  lastname text,
  firstname text,
  races list<FROZEN <race>> );

INSERT INTO cycling.cyclist_races (id,races) VALUES (
   e7ae5cf3-d358-4d99-b900-85902fda9bb0,
   [ { race_title:'17th Santos Tour Down Under Aalburg', race_date:'2017-04-14',race_time:'07:00:00' },
     { race_title:'17th Santos Tour Down Under Gelderland', race_date:'2017-04-14', race_time:'08:00:00' } ]);

INSERT INTO cycling.cyclist_races (id, lastname, firstname, races) 
VALUES (
	e7cd5752-bc0d-4157-a80f-7523add8dbcd, 'VAN DER BREGGEN', 'Anna', 
	[ {race_title:'Festival Luxembourgeois du cyclisme feminin Elsy Jacobs - Prologue - Garnich > Garnich',race_date:'2017-04-14',race_time:'08:00:00'},
		{race_title:'Festival Luxembourgeois du cyclisme feminin Elsy Jacobs - Stage 2 - Garnich > Garnich',race_date:'2017-04-14',race_time:'06:00:00'},
		{race_title:'Festival Luxembourgeois du cyclisme feminin Elsy Jacobs - Stage 3 - Mamer > Mamer',race_date:'2017-04-14',race_time:'10:00:00'} ]);

UPDATE cycling.cyclist_races
	SET
    lastname = 'FRAME',
    firstname = 'Alex',
    races[1] = { race_time:'06:00:00'}
		WHERE id = e7ae5cf3-d358-4d99-b900-85902fda9bb0;

cassandra@cqlsh:cycling> DESCRIBE TYPES;

race

cassandra@cqlsh:cycling> DESCRIBE TABLES;

cyclist_name  cyclist_races

cassandra@cqlsh:cycling> SELECT * from cycling.cyclist_name;

cassandra@cqlsh:cycling> SELECT lastname, races FROM cycling.cyclist_races WHERE id = e7cd5752-bc0d-4157-a80f-7523add8dbcd;