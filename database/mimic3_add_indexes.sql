.print 'Creating indexes for mimic3 tables...'

-------------
-- ADMISSIONS
-------------

DROP INDEX IF EXISTS ADMISSIONS_idx01;
CREATE INDEX ADMISSIONS_IDX01
  ON ADMISSIONS (SUBJECT_ID);

DROP INDEX IF EXISTS ADMISSIONS_idx02;
CREATE INDEX ADMISSIONS_IDX02
  ON ADMISSIONS (HADM_ID);

-- DROP INDEX IF EXISTS ADMISSIONS_idx03;
-- CREATE INDEX ADMISSIONS_IDX03
--   ON ADMISSIONS (ADMISSION_TYPE);


-----------
--CALLOUT--
-----------

DROP INDEX IF EXISTS CALLOUT_idx01;
CREATE INDEX CALLOUT_IDX01
  ON CALLOUT (SUBJECT_ID);

DROP INDEX IF EXISTS CALLOUT_idx02;
CREATE INDEX CALLOUT_IDX02
  ON CALLOUT (HADM_ID);

-- DROP INDEX IF EXISTS CALLOUT_idx03;
-- CREATE INDEX CALLOUT_IDX03
--   ON CALLOUT (CALLOUT_SERVICE);

-- DROP INDEX IF EXISTS CALLOUT_idx04;
-- CREATE INDEX CALLOUT_IDX04
--   ON CALLOUT (CURR_WARDID, CALLOUT_WARDID,
--     DISCHARGE_WARDID);

-- DROP INDEX IF EXISTS CALLOUT_idx05;
-- CREATE INDEX CALLOUT_IDX05
--   ON CALLOUT (CALLOUT_STATUS,
--     CALLOUT_OUTCOME);

-- DROP INDEX IF EXISTS CALLOUT_idx06;
-- CREATE INDEX CALLOUT_IDX06
--   ON CALLOUT (CREATETIME, UPDATETIME,
--     ACKNOWLEDGETIME, OUTCOMETIME);

---------------
-- CAREGIVERS
---------------

-- DROP INDEX IF EXISTS CAREGIVERS_idx01;
-- CREATE INDEX CAREGIVERS_IDX01
--   ON CAREGIVERS (CGID, LABEL);

---------------
-- CHARTEVENTS
---------------

DROP INDEX IF EXISTS CHARTEVENTS_idx01;
CREATE INDEX CHARTEVENTS_idx01
  ON CHARTEVENTS (itemid);

---------------
-- CPTEVENTS
---------------

DROP INDEX IF EXISTS CPTEVENTS_idx01;
CREATE INDEX CPTEVENTS_idx01
  ON CPTEVENTS (SUBJECT_ID);

DROP INDEX IF EXISTS CPTEVENTS_idx02;
CREATE INDEX CPTEVENTS_idx02
  ON CPTEVENTS (CPT_CD);

-----------
-- D_CPT
-----------

-- Table is 134 rows - doesn't need an index.

--------------------
-- D_ICD_DIAGNOSES
--------------------

DROP INDEX IF EXISTS D_ICD_DIAG_idx01;
CREATE INDEX D_ICD_DIAG_idx01
  ON D_ICD_DIAGNOSES (ICD9_CODE);

DROP INDEX IF EXISTS D_ICD_DIAG_idx02;
CREATE INDEX D_ICD_DIAG_idx02
  ON D_ICD_DIAGNOSES (LONG_TITLE);

--------------------
-- D_ICD_PROCEDURES
--------------------

DROP INDEX IF EXISTS D_ICD_PROC_idx01;
CREATE INDEX D_ICD_PROC_idx01
  ON D_ICD_PROCEDURES (ICD9_CODE);

DROP INDEX IF EXISTS D_ICD_PROC_idx02;
CREATE INDEX D_ICD_PROC_idx02
  ON D_ICD_PROCEDURES (LONG_TITLE);

-----------
-- D_ITEMS
-----------

DROP INDEX IF EXISTS D_ITEMS_idx01;
CREATE INDEX D_ITEMS_idx01
  ON D_ITEMS (ITEMID);

DROP INDEX IF EXISTS D_ITEMS_idx02;
CREATE INDEX D_ITEMS_idx02
  ON D_ITEMS (LABEL);

-- DROP INDEX IF EXISTS D_ITEMS_idx03;
-- CREATE INDEX D_ITEMS_idx03
--   ON D_ITEMS (CATEGORY);

---------------
-- D_LABITEMS
---------------

DROP INDEX IF EXISTS D_LABITEMS_idx01;
CREATE INDEX D_LABITEMS_idx01
  ON D_LABITEMS (ITEMID);

DROP INDEX IF EXISTS D_LABITEMS_idx02;
CREATE INDEX D_LABITEMS_idx02
  ON D_LABITEMS (LABEL);

DROP INDEX IF EXISTS D_LABITEMS_idx03;
CREATE INDEX D_LABITEMS_idx03
  ON D_LABITEMS (LOINC_CODE);

-------------------
-- DATETIMEEVENTS
-------------------

DROP INDEX IF EXISTS DATETIMEEVENTS_idx01;
CREATE INDEX DATETIMEEVENTS_idx01
  ON DATETIMEEVENTS (SUBJECT_ID);

DROP INDEX IF EXISTS DATETIMEEVENTS_idx02;
CREATE INDEX DATETIMEEVENTS_idx02
  ON DATETIMEEVENTS (ITEMID);

DROP INDEX IF EXISTS DATETIMEEVENTS_idx03;
CREATE INDEX DATETIMEEVENTS_idx03
  ON DATETIMEEVENTS (ICUSTAY_ID);

DROP INDEX IF EXISTS DATETIMEEVENTS_idx04;
CREATE INDEX DATETIMEEVENTS_idx04
  ON DATETIMEEVENTS (HADM_ID);

-- DROP INDEX IF EXISTS DATETIMEEVENTS_idx05;
-- CREATE INDEX DATETIMEEVENTS_idx05
--   ON DATETIMEEVENTS (VALUE);

------------------
-- DIAGNOSES_ICD
------------------

DROP INDEX IF EXISTS DIAGNOSES_ICD_idx01;
CREATE INDEX DIAGNOSES_ICD_idx01
  ON DIAGNOSES_ICD (SUBJECT_ID);

DROP INDEX IF EXISTS DIAGNOSES_ICD_idx02;
CREATE INDEX DIAGNOSES_ICD_idx02
  ON DIAGNOSES_ICD (ICD9_CODE);

DROP INDEX IF EXISTS DIAGNOSES_ICD_idx03;
CREATE INDEX DIAGNOSES_ICD_idx03
  ON DIAGNOSES_ICD (HADM_ID);

--------------
-- DRGCODES
--------------

DROP INDEX IF EXISTS DRGCODES_idx01;
CREATE INDEX DRGCODES_idx01
  ON DRGCODES (SUBJECT_ID);

DROP INDEX IF EXISTS DRGCODES_idx02;
CREATE INDEX DRGCODES_idx02
  ON DRGCODES (DRG_CODE);

DROP INDEX IF EXISTS DRGCODES_idx03;
CREATE INDEX DRGCODES_idx03
  ON DRGCODES (DESCRIPTION);

-- HADM_ID

------------------
-- ICUSTAYS
------------------

DROP INDEX IF EXISTS ICUSTAYS_idx01;
CREATE INDEX ICUSTAYS_idx01
  ON ICUSTAYS (SUBJECT_ID);

DROP INDEX IF EXISTS ICUSTAYS_idx02;
CREATE INDEX ICUSTAYS_idx02
  ON ICUSTAYS (ICUSTAY_ID);

-- DROP INDEX IF EXISTS ICUSTAYS_idx03;
-- CREATE INDEX ICUSTAYS_idx03
--   ON ICUSTAYS (LOS);

-- DROP INDEX IF EXISTS ICUSTAYS_idx04;
-- CREATE INDEX ICUSTAYS_idx04
--   ON ICUSTAYS (FIRST_CAREUNIT);

-- DROP INDEX IF EXISTS ICUSTAYS_idx05;
-- CREATE INDEX ICUSTAYS_idx05
--   ON ICUSTAYS (LAST_CAREUNIT);

DROP INDEX IF EXISTS ICUSTAYS_idx06;
CREATE INDEX ICUSTAYS_IDX06
  ON ICUSTAYS (HADM_ID);

-------------
-- INPUTEVENTS_CV
-------------

DROP INDEX IF EXISTS INPUTEVENTS_CV_idx01;
CREATE INDEX INPUTEVENTS_CV_idx01
  ON INPUTEVENTS_CV (SUBJECT_ID);

  DROP INDEX IF EXISTS INPUTEVENTS_CV_idx02;
  CREATE INDEX INPUTEVENTS_CV_idx02
    ON INPUTEVENTS_CV (HADM_ID);

DROP INDEX IF EXISTS INPUTEVENTS_CV_idx03;
CREATE INDEX INPUTEVENTS_CV_idx03
  ON INPUTEVENTS_CV (ICUSTAY_ID);

DROP INDEX IF EXISTS INPUTEVENTS_CV_idx04;
CREATE INDEX INPUTEVENTS_CV_idx04
  ON INPUTEVENTS_CV (CHARTTIME);

DROP INDEX IF EXISTS INPUTEVENTS_CV_idx05;
CREATE INDEX INPUTEVENTS_CV_idx05
  ON INPUTEVENTS_CV (ITEMID);

-- DROP INDEX IF EXISTS INPUTEVENTS_CV_idx06;
-- CREATE INDEX INPUTEVENTS_CV_idx06
--   ON INPUTEVENTS_CV (RATE);

-- DROP INDEX IF EXISTS INPUTEVENTS_CV_idx07;
-- CREATE INDEX INPUTEVENTS_CV_idx07
--   ON INPUTEVENTS_CV (AMOUNT);

-- DROP INDEX IF EXISTS INPUTEVENTS_CV_idx08;
-- CREATE INDEX INPUTEVENTS_CV_idx08
--   ON INPUTEVENTS_CV (CGID);

-- DROP INDEX IF EXISTS INPUTEVENTS_CV_idx09;
-- CREATE INDEX INPUTEVENTS_CV_idx09
--   ON INPUTEVENTS_CV (LINKORDERID, ORDERID);

-------------
-- INPUTEVENTS_MV
-------------

DROP INDEX IF EXISTS INPUTEVENTS_MV_idx01;
CREATE INDEX INPUTEVENTS_MV_idx01
  ON INPUTEVENTS_MV (SUBJECT_ID);

DROP INDEX IF EXISTS INPUTEVENTS_MV_idx02;
CREATE INDEX INPUTEVENTS_MV_idx02
  ON INPUTEVENTS_MV (HADM_ID);

DROP INDEX IF EXISTS INPUTEVENTS_MV_idx03;
CREATE INDEX INPUTEVENTS_MV_idx03
  ON INPUTEVENTS_MV (ICUSTAY_ID);

-- DROP INDEX IF EXISTS INPUTEVENTS_MV_idx04;
-- CREATE INDEX INPUTEVENTS_MV_idx04
--   ON INPUTEVENTS_MV (ENDTIME, STARTTIME);

DROP INDEX IF EXISTS INPUTEVENTS_MV_idx05;
CREATE INDEX INPUTEVENTS_MV_idx05
  ON INPUTEVENTS_MV (ITEMID);

-- DROP INDEX IF EXISTS INPUTEVENTS_MV_idx06;
-- CREATE INDEX INPUTEVENTS_MV_idx06
--   ON INPUTEVENTS_MV (RATE);

-- DROP INDEX IF EXISTS INPUTEVENTS_MV_idx07;
-- CREATE INDEX INPUTEVENTS_MV_idx07
--   ON INPUTEVENTS_MV (VOLUME);

-- DROP INDEX IF EXISTS INPUTEVENTS_MV_idx08;
-- CREATE INDEX INPUTEVENTS_MV_idx08
--   ON INPUTEVENTS_MV (CGID);

-- DROP INDEX IF EXISTS INPUTEVENTS_MV_idx09;
-- CREATE INDEX INPUTEVENTS_MV_idx09
--   ON INPUTEVENTS_MV (LINKORDERID, ORDERID);

-- DROP INDEX IF EXISTS INPUTEVENTS_MV_idx10;
-- CREATE INDEX INPUTEVENTS_MV_idx10
--   ON INPUTEVENTS_MV (ORDERCATEGORYDESCRIPTION,
--     ORDERCATEGORYNAME, SECONDARYORDERCATEGORYNAME);

-- DROP INDEX IF EXISTS INPUTEVENTS_MV_idx11;
-- CREATE INDEX INPUTEVENTS_MV_idx11
--   ON INPUTEVENTS_MV (ORDERCOMPONENTTYPEDESCRIPTION,
--     ORDERCATEGORYDESCRIPTION);


--------------
-- LABEVENTS
--------------

DROP INDEX IF EXISTS LABEVENTS_idx01;
CREATE INDEX LABEVENTS_idx01
  ON LABEVENTS (SUBJECT_ID);

DROP INDEX IF EXISTS LABEVENTS_idx02;
CREATE INDEX LABEVENTS_idx02
  ON LABEVENTS (HADM_ID);

DROP INDEX IF EXISTS LABEVENTS_idx03;
CREATE INDEX LABEVENTS_idx03
  ON LABEVENTS (ITEMID);

-- DROP INDEX IF EXISTS LABEVENTS_idx04;
-- CREATE INDEX LABEVENTS_idx04
--   ON LABEVENTS (VALUE, VALUENUM);

----------------------
-- MICROBIOLOGYEVENTS
----------------------

DROP INDEX IF EXISTS MICROBIOLOGYEVENTS_idx01;
CREATE INDEX MICROBIOLOGYEVENTS_idx01
  ON MICROBIOLOGYEVENTS (SUBJECT_ID);

DROP INDEX IF EXISTS MICROBIOLOGYEVENTS_idx02;
CREATE INDEX MICROBIOLOGYEVENTS_idx02
  ON MICROBIOLOGYEVENTS (HADM_ID);

-- DROP INDEX IF EXISTS MICROBIOLOGYEVENTS_idx03;
-- CREATE INDEX MICROBIOLOGYEVENTS_idx03
--   ON MICROBIOLOGYEVENTS (SPEC_ITEMID,
--     ORG_ITEMID, AB_ITEMID);

---------------
-- NOTEEVENTS
---------------

DROP INDEX IF EXISTS NOTEEVENTS_idx01;
CREATE INDEX NOTEEVENTS_idx01
  ON NOTEEVENTS (SUBJECT_ID);

DROP INDEX IF EXISTS NOTEEVENTS_idx02;
CREATE INDEX NOTEEVENTS_idx02
  ON NOTEEVENTS (HADM_ID);

-- DROP INDEX IF EXISTS NOTEEVENTS_idx03;
-- CREATE INDEX NOTEEVENTS_idx03
--   ON NOTEEVENTS (CGID);

-- DROP INDEX IF EXISTS NOTEEVENTS_idx04;
-- CREATE INDEX NOTEEVENTS_idx04
--   ON NOTEEVENTS (RECORD_ID);

DROP INDEX IF EXISTS NOTEEVENTS_idx05;
CREATE INDEX NOTEEVENTS_idx05
  ON NOTEEVENTS (CATEGORY);


---------------
-- OUTPUTEVENTS
---------------
DROP INDEX IF EXISTS OUTPUTEVENTS_idx01;
CREATE INDEX OUTPUTEVENTS_idx01
  ON OUTPUTEVENTS (SUBJECT_ID);


DROP INDEX IF EXISTS OUTPUTEVENTS_idx02;
CREATE INDEX OUTPUTEVENTS_idx02
  ON OUTPUTEVENTS (ITEMID);


DROP INDEX IF EXISTS OUTPUTEVENTS_idx03;
CREATE INDEX OUTPUTEVENTS_idx03
  ON OUTPUTEVENTS (ICUSTAY_ID);


DROP INDEX IF EXISTS OUTPUTEVENTS_idx04;
CREATE INDEX OUTPUTEVENTS_idx04
  ON OUTPUTEVENTS (HADM_ID);

-- Perhaps not useful to index on just value? Index just for popular subset?
-- DROP INDEX IF EXISTS OUTPUTEVENTS_idx05;
-- CREATE INDEX OUTPUTEVENTS_idx05
--   ON OUTPUTEVENTS (VALUE);


-------------
-- PATIENTS
-------------

-- Note that SUBJECT_ID is already indexed as it is unique

-- DROP INDEX IF EXISTS PATIENTS_idx01;
-- CREATE INDEX PATIENTS_idx01
--   ON PATIENTS (EXPIRE_FLAG);


------------------
-- PRESCRIPTIONS
------------------

DROP INDEX IF EXISTS PRESCRIPTIONS_idx01;
CREATE INDEX PRESCRIPTIONS_idx01
  ON PRESCRIPTIONS (SUBJECT_ID);

DROP INDEX IF EXISTS PRESCRIPTIONS_idx02;
CREATE INDEX PRESCRIPTIONS_idx02
  ON PRESCRIPTIONS (ICUSTAY_ID);

DROP INDEX IF EXISTS PRESCRIPTIONS_idx03;
CREATE INDEX PRESCRIPTIONS_idx03
  ON PRESCRIPTIONS (DRUG_TYPE);

DROP INDEX IF EXISTS PRESCRIPTIONS_idx04;
CREATE INDEX PRESCRIPTIONS_idx04
  ON PRESCRIPTIONS (DRUG);

DROP INDEX IF EXISTS PRESCRIPTIONS_idx05;
CREATE INDEX PRESCRIPTIONS_idx05
  ON PRESCRIPTIONS (HADM_ID);


---------------------
-- PROCEDUREEVENTS_MV
---------------------

DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx01;
CREATE INDEX PROCEDUREEVENTS_MV_idx01
  ON PROCEDUREEVENTS_MV (SUBJECT_ID);

DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx02;
CREATE INDEX PROCEDUREEVENTS_MV_idx02
  ON PROCEDUREEVENTS_MV (HADM_ID);

DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx03;
CREATE INDEX PROCEDUREEVENTS_MV_idx03
  ON PROCEDUREEVENTS_MV (ICUSTAY_ID);

-- DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx04;
-- CREATE INDEX PROCEDUREEVENTS_MV_idx04
--   ON PROCEDUREEVENTS_MV (ENDTIME, STARTTIME);

DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx05;
CREATE INDEX PROCEDUREEVENTS_MV_idx05
  ON PROCEDUREEVENTS_MV (ITEMID);

-- DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx06;
-- CREATE INDEX PROCEDUREEVENTS_MV_idx06
--   ON PROCEDUREEVENTS_MV (VALUE);

-- DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx07;
-- CREATE INDEX PROCEDUREEVENTS_MV_idx07
--   ON PROCEDUREEVENTS_MV (CGID);

-- DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx08;
-- CREATE INDEX PROCEDUREEVENTS_MV_idx08
--   ON PROCEDUREEVENTS_MV (LINKORDERID, ORDERID);

-- DROP INDEX IF EXISTS PROCEDUREEVENTS_MV_idx09;
-- CREATE INDEX PROCEDUREEVENTS_MV_idx09
--   ON PROCEDUREEVENTS_MV (ORDERCATEGORYDESCRIPTION,
--     ORDERCATEGORYNAME, SECONDARYORDERCATEGORYNAME);

-------------------
-- PROCEDURES_ICD
-------------------

DROP INDEX IF EXISTS PROCEDURES_ICD_idx01;
CREATE INDEX PROCEDURES_ICD_idx01
  ON PROCEDURES_ICD (SUBJECT_ID);

DROP INDEX IF EXISTS PROCEDURES_ICD_idx02;
CREATE INDEX PROCEDURES_ICD_idx02
  ON PROCEDURES_ICD (ICD9_CODE);

DROP INDEX IF EXISTS PROCEDURES_ICD_idx03;
CREATE INDEX PROCEDURES_ICD_idx03
  ON PROCEDURES_ICD (HADM_ID);


-------------
-- SERVICES
-------------

DROP INDEX IF EXISTS SERVICES_idx01;
CREATE INDEX SERVICES_idx01
  ON SERVICES (SUBJECT_ID);

DROP INDEX IF EXISTS SERVICES_idx02;
CREATE INDEX SERVICES_idx02
  ON SERVICES (HADM_ID);

-- DROP INDEX IF EXISTS SERVICES_idx03;
-- CREATE INDEX SERVICES_idx03
--   ON SERVICES (CURR_SERVICE, PREV_SERVICE);

-------------
-- TRANSFERS
-------------

DROP INDEX IF EXISTS TRANSFERS_idx01;
CREATE INDEX TRANSFERS_idx01
  ON TRANSFERS (SUBJECT_ID);

DROP INDEX IF EXISTS TRANSFERS_idx02;
CREATE INDEX TRANSFERS_idx02
  ON TRANSFERS (ICUSTAY_ID);

DROP INDEX IF EXISTS TRANSFERS_idx03;
CREATE INDEX TRANSFERS_idx03
  ON TRANSFERS (HADM_ID);

-- DROP INDEX IF EXISTS TRANSFERS_idx04;
-- CREATE INDEX TRANSFERS_idx04
--   ON TRANSFERS (INTIME, OUTTIME);

-- DROP INDEX IF EXISTS TRANSFERS_idx05;
-- CREATE INDEX TRANSFERS_idx05
--   ON TRANSFERS (LOS);

.exit
