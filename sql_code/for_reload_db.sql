DROP DATABASE course_project;
DROP ROLE driver;
DROP ROLE officer;
CREATE DATABASE course_project;
\c course_project
\i 'D:/Scripts_DB/for_db.sql'

SET session_replication_role = 'replica';
\i 'D:/Scripts_DB/drivers_script.sql'
\i 'D:/Scripts_DB/personal_script.sql'
\i 'D:/Scripts_DB/gibdd_script.sql'
\i 'D:/Scripts_DB/information_script.sql'
\i 'D:/Scripts_DB/insurance_script.sql'
\i 'D:/Scripts_DB/manufacturers_script.sql'
\i 'D:/Scripts_DB/offenses_script.sql'
\i 'D:/Scripts_DB/penalty_script.sql'
\i 'D:/Scripts_DB/transport_script.sql'
\i 'D:/Scripts_DB/witnesses_script.sql'
SET session_replication_role = 'origin';
