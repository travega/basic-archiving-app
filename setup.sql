CREATE SCHEMA "archive";

CREATE OR REPLACE FUNCTION archive.run_archival()
 RETURNS void AS
$BODY$
BEGIN

CREATE TABLE IF NOT EXISTS archive.property__c (LIKE salesforce.property__c INCLUDING ALL);
    BEGIN
        ALTER TABLE archive.property__c ADD COLUMN archival_date timestamp;
    EXCEPTION
        WHEN duplicate_column THEN RAISE NOTICE 'column archival_date already exists in archiving.property__c.';
    END;

INSERT INTO archive.property__c
SELECT *, now() AS archival_date
FROM salesforce.property__c;
-- WHERE createddate::date >= current_date - interval '1 years' AND createddate::date < current_date - interval '8 years';

-- DELETE FROM salesforce.property__c
-- WHERE createddate::date >= current_date - interval '1 years' AND createddate::date < current_date - interval '8 years';

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
