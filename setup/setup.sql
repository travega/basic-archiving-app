CREATE SCHEMA IF NOT EXISTS "archive";

CREATE OR REPLACE FUNCTION archive.run_archival()
 RETURNS void AS
$BODY$
BEGIN

CREATE TABLE IF NOT EXISTS archive.lead (LIKE salesforce.lead INCLUDING ALL);
    BEGIN
        ALTER TABLE archive.lead ADD COLUMN archival_date timestamp;
    EXCEPTION
        WHEN duplicate_column THEN RAISE NOTICE 'column archival_date already exists in archiving.lead.';
    END;

INSERT INTO archive.lead
SELECT *, now() AS archival_date
FROM salesforce.lead;
-- WHERE createddate::date >= current_date - interval '2 years' AND createddate::date < current_date - interval '8 years';

-- DELETE FROM salesforce.property__c
-- WHERE createddate::date >= current_date - interval '2 years' AND createddate::date < current_date - interval '8 years';

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
