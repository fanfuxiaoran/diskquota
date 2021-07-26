CREATE EXTENSION diskquota;
-- start_ignore
\! gpstop -u
SELECT diskquota.init_table_size_table();
-- end_ignore
SELECT pg_sleep(15);

-- prepare a schema that has reached quota limit
CREATE SCHEMA badquota;
SELECT diskquota.set_schema_quota('badquota', '1 MB');
DROP ROLE IF EXISTS testbody;
CREATE ROLE testbody;
CREATE TABLE badquota.t1(i INT);
ALTER TABLE badquota.t1 OWNER TO testbody;
INSERT INTO badquota.t1 SELECT generate_series(0, 100000);
SELECT pg_sleep(10);
-- expect fail
INSERT INTO badquota.t1 SELECT generate_series(0, 10);
SELECT schema_name, quota_in_mb, nspsize_in_bytes FROM diskquota.show_fast_schema_quota_view WHERE schema_name = 'badquota';
