#' ---
#' title: "Elixhauser Replication in R"
#' author: "H. David Shea"
#' date: "`r format(Sys.time(), '%d %b %Y')`"
#' output: github_document
#' ---
#'
#+ r setup, include = FALSE
library(DBI)
library(RSQLite)
library(tidyverse)
#+

#+ r connect, include = FALSE
#' Connect to the MIMIC3 database
#'
base_dir <- here::here("")
db_file <- fs::path(base_dir, "database/mimic3.db")
if(dbCanConnect(RSQLite::SQLite(), db_file)) {
    mimic_db <- dbConnect(RSQLite::SQLite(), db_file)
} else {
    stop(str_c("Database file: ", db_file, " not found.", sep=""))
}
source(fs::path(base_dir, "db_functions.R"))
source(fs::path(base_dir, "mimic3_meta_data.R"))
#+

icd <- db_get_diagnoses_icd(mimic_db, where = str_c(demo_subject_ids, "and seq_num != 1", sep = ""))

eliflg <- icd %>%
    mutate(
        CHF       = is_icdd_congestive_heart_failure(ICD9_CODE, mimic_db),
        ARYTHM    = is_icdd_cardiac_arrhythmia(ICD9_CODE, mimic_db),
        VALVE     = is_icdd_valvular_disease(ICD9_CODE, mimic_db),
        PULMCIRC  = is_icdd_pulmonary_circulation_disorder(ICD9_CODE, mimic_db),
        PERIVASC  = is_icdd_peripheral_vascular_disorder(ICD9_CODE, mimic_db),
        HTN       = is_icdd_hypertension_uncomplicated(ICD9_CODE, mimic_db),
        HTNCX     = is_icdd_hypertension_complicated(ICD9_CODE, mimic_db),
        HTNPREG   = is_icdd_hypertension_complicating_pregnancy(ICD9_CODE, mimic_db),
        HTNWOCHF  = is_icdd_hypertension_heart_disease_without_heart_failure(ICD9_CODE, mimic_db),
        HTNWCHF   = is_icdd_hypertension_heart_disease_with_heart_failure(ICD9_CODE, mimic_db),
        HRENWORF  = is_icdd_hypertension_renal_disease_without_renal_failure(ICD9_CODE, mimic_db),
        HRENWRF   = is_icdd_hypertension_renal_disease_with_renal_failure(ICD9_CODE, mimic_db),
        HHRWOHRF  = is_icdd_hypertension_heart_and_renal_disease_without_heart_or_renal_failure(ICD9_CODE, mimic_db),
        HHRWCHF   = is_icdd_hypertension_heart_and_renal_disease_with_heart_failure(ICD9_CODE, mimic_db),
        HHRWRF    = is_icdd_hypertension_heart_and_renal_disease_with_renal_failure(ICD9_CODE, mimic_db),
        HHRWHRF   = is_icdd_hypertension_heart_and_renal_disease_with_heart_and_renal_failure(ICD9_CODE, mimic_db),
        OHTNPREG  = is_icdd_hypertension_other_in_pregnancy(ICD9_CODE, mimic_db),
        PARA      = is_icdd_paralysis(ICD9_CODE, mimic_db),
        NEURO     = is_icdd_other_neurological(ICD9_CODE, mimic_db),
        CHRNLUNG  = is_icdd_chronic_pulmonary_disease(ICD9_CODE, mimic_db),
        DM        = is_icdd_diabetes_without_chronic_complications(ICD9_CODE, mimic_db),
        DMCX      = is_icdd_diabetes_with_chronic_complications(ICD9_CODE, mimic_db),
        HYPOTHY   = is_icdd_hypothyroidism(ICD9_CODE, mimic_db),
        RENLFAIL  = is_icdd_renal_failure(ICD9_CODE, mimic_db),
        LIVER     = is_icdd_liver_disease(ICD9_CODE, mimic_db),
        ULCER     = is_icdd_chronic_peptic_ulcer_disease(ICD9_CODE, mimic_db),
        AIDS      = is_icdd_hiv_and_aids(ICD9_CODE, mimic_db),
        LYMPH     = is_icdd_lymphoma(ICD9_CODE, mimic_db),
        METS      = is_icdd_metastatic_cancer(ICD9_CODE, mimic_db),
        TUMOR     = is_icdd_solid_tumor_without_metastasis(ICD9_CODE, mimic_db),
        ARTH      = is_icdd_rheumatoid_arthritis(ICD9_CODE, mimic_db),
        COAG      = is_icdd_coagulation_deficiency(ICD9_CODE, mimic_db),
        OBESE     = is_icdd_obesity(ICD9_CODE, mimic_db),
        WGHTLOSS  = is_icdd_weight_loss(ICD9_CODE, mimic_db),
        LYTES     = is_icdd_fluid_and_electrolyte_disorders(ICD9_CODE, mimic_db),
        BLDLOSS   = is_icdd_blood_loss_anemia(ICD9_CODE, mimic_db),
        ANEMDEF   = is_icdd_deficiency_anemias(ICD9_CODE, mimic_db),
        ALCOHOL   = is_icdd_alcohol_abuse(ICD9_CODE, mimic_db),
        DRUG      = is_icdd_drug_abuse(ICD9_CODE, mimic_db),
        PSYCH     = is_icdd_psychoses(ICD9_CODE, mimic_db),
        DEPRESS   = is_icdd_depression(ICD9_CODE, mimic_db)
    )

eligrp <- eliflg %>%
    arrange(HADM_ID, SUBJECT_ID) %>%
    group_by(HADM_ID, SUBJECT_ID) %>%
    summarize(
        CHF = as.logical(max(CHF)),
        ARYTHM = as.logical(max(ARYTHM)),
        VALVE = as.logical(max(VALVE)),
        PULMCIRC = as.logical(max(PULMCIRC)),
        PERIVASC = as.logical(max(PERIVASC)),
        HTN = as.logical(max(HTN)),
        HTNCX = as.logical(max(HTNCX)),
        HTNPREG = as.logical(max(HTNPREG)),
        HTNWOCHF = as.logical(max(HTNWOCHF)),
        HTNWCHF = as.logical(max(HTNWCHF)),
        HRENWORF = as.logical(max(HRENWORF)),
        HRENWRF = as.logical(max(HRENWRF)),
        HHRWOHRF = as.logical(max(HHRWOHRF)),
        HHRWCHF = as.logical(max(HHRWCHF)),
        HHRWRF = as.logical(max(HHRWRF)),
        HHRWHRF = as.logical(max(HHRWHRF)),
        OHTNPREG = as.logical(max(OHTNPREG)),
        PARA = as.logical(max(PARA)),
        NEURO = as.logical(max(NEURO)),
        CHRNLUNG = as.logical(max(CHRNLUNG)),
        DM = as.logical(max(DM)),
        DMCX = as.logical(max(DMCX)),
        HYPOTHY = as.logical(max(HYPOTHY)),
        RENLFAIL = as.logical(max(RENLFAIL)),
        LIVER = as.logical(max(LIVER)),
        ULCER = as.logical(max(ULCER)),
        AIDS = as.logical(max(AIDS)),
        LYMPH = as.logical(max(LYMPH)),
        METS = as.logical(max(METS)),
        TUMOR = as.logical(max(TUMOR)),
        ARTH = as.logical(max(ARTH)),
        COAG = as.logical(max(COAG)),
        OBESE = as.logical(max(OBESE)),
        WGHTLOSS = as.logical(max(WGHTLOSS)),
        LYTES = as.logical(max(LYTES)),
        BLDLOSS = as.logical(max(BLDLOSS)),
        ANEMDEF = as.logical(max(ANEMDEF)),
        ALCOHOL = as.logical(max(ALCOHOL)),
        DRUG = as.logical(max(DRUG)),
        PSYCH = as.logical(max(PSYCH)),
        DEPRESS = as.logical(max(DEPRESS)),
    )

msdrg <- db_get_drgcodes(mimic_db, where = str_c(demo_subject_ids, "and drg_type = 'MS'", sep = "")) %>%
    select(HADM_ID, SUBJECT_ID, DRG_TYPE, DRG_CODE) %>%
    mutate(
        DRG_CODE = as.numeric(DRG_CODE),
        CARDDRG = is_drggrp_cardiac(DRG_CODE, DRG_TYPE), etc...)

hcfadrg <- db_get_drgcodes(mimic_db, where = str_c(demo_subject_ids, "and drg_type = 'MS'", sep = "")) %>%
    select(HADM_ID, SUBJECT_ID, DRG_TYPE, DRG_CODE) %>%
    mutate(DRG_CODE = as.numeric(DRG_CODE))

