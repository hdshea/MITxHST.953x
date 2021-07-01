.print 'Fixing NULLS in dat fields for mimic3 tables...'

UPDATE callout set SUBMIT_WARDID = NULL where SUBMIT_WARDID = "";

UPDATE callout set CURR_WARDID = NULL where CURR_WARDID = "";

UPDATE callout set DISCHARGE_WARDID = NULL where DISCHARGE_WARDID = "";

UPDATE cptevents set CPT_NUMBER = NULL where CPT_NUMBER = "";

UPDATE cptevents set TICKET_ID_SEQ = NULL where TICKET_ID_SEQ = "";

UPDATE datetimeevents set HADM_ID = NULL where HADM_ID = "";

UPDATE datetimeevents set ICUSTAY_ID = NULL where ICUSTAY_ID = "";

UPDATE datetimeevents set WARNING = NULL where WARNING = "";

UPDATE datetimeevents set ERROR = NULL where ERROR = "";

UPDATE diagnoses_icd set SEQ_NUM = NULL where SEQ_NUM = "";

UPDATE drgcodes set DRG_SEVERITY = NULL where DRG_SEVERITY = "";

UPDATE drgcodes set DRG_MORTALITY = NULL where DRG_MORTALITY = "";

UPDATE icustays set LOS = NULL where LOS = "";

UPDATE inputevents_cv set HADM_ID = NULL where HADM_ID = "";

UPDATE inputevents_cv set ICUSTAY_ID = NULL where ICUSTAY_ID = "";

UPDATE inputevents_cv set AMOUNT = NULL where AMOUNT = "";

UPDATE inputevents_cv set RATE = NULL where RATE = "";

UPDATE inputevents_cv set CGID = NULL where CGID = "";

UPDATE inputevents_cv set NEWBOTTLE = NULL where NEWBOTTLE = "";

UPDATE inputevents_cv set ORIGINALAMOUNT = NULL where ORIGINALAMOUNT = "";

UPDATE inputevents_cv set ORIGINALRATE = NULL where ORIGINALRATE = "";

UPDATE inputevents_mv set ICUSTAY_ID = NULL where ICUSTAY_ID = "";

UPDATE inputevents_mv set RATE = NULL where RATE = "";

UPDATE inputevents_mv set TOTALAMOUNT = NULL where TOTALAMOUNT = "";

UPDATE labevents set HADM_ID = NULL where HADM_ID = "";

UPDATE labevents set VALUENUM = NULL where VALUENUM = "";

UPDATE microbiologyevents set SPEC_ITEMID = NULL where SPEC_ITEMID = "";

UPDATE microbiologyevents set ORG_ITEMID = NULL where ORG_ITEMID = "";

UPDATE microbiologyevents set ISOLATE_NUM = NULL where ISOLATE_NUM = "";

UPDATE microbiologyevents set AB_ITEMID = NULL where AB_ITEMID = "";

UPDATE microbiologyevents set DILUTION_VALUE = NULL where DILUTION_VALUE = "";

UPDATE noteevents set HADM_ID = NULL where HADM_ID = "";

UPDATE noteevents set CGID = NULL where CGID = "";

UPDATE outputevents set ICUSTAY_ID = NULL where ICUSTAY_ID = "";

UPDATE outputevents set VALUE = NULL where VALUE = "";

UPDATE prescriptions set ICUSTAY_ID = NULL where ICUSTAY_ID = "";

UPDATE procedureevents_mv set ICUSTAY_ID = NULL where ICUSTAY_ID = "";

UPDATE transfers set ICUSTAY_ID = NULL where ICUSTAY_ID = "";

UPDATE transfers set PREV_WARDID = NULL where PREV_WARDID = "";

UPDATE transfers set CURR_WARDID = NULL where CURR_WARDID = "";

UPDATE transfers set LOS = NULL where LOS = "";

.exit
