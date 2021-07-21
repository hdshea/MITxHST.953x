library(DBI)
library(RSQLite)
library(tidyverse)
library(lubridate)

base_dir <- here::here("")
db_dir <- fs::path(base_dir, "database")
db_file <- fs::path(db_dir, "mimic3.db")

if(dbCanConnect(RSQLite::SQLite(), db_file)) {
    mimic3 <- dbConnect(RSQLite::SQLite(), db_file)
}

source(fs::path(base_dir, "db_functions.R"))
source(fs::path(base_dir, "mimic3_meta_data.R"))

#
# The following routines encapsulate the base level get_db_<tables> routines into higher level concepts
# with standardized use case patterns.  Some of these were adapted from the mimic-code github repository
# https://github.com/MIT-LCP/mimic-code/tree/main/mimic-iii
#
# In the following code, the concept of a cohort is a group of subjects identified by numeric SUBJECT_IDs.
# cohort can be:
#  NULL, indicating the entire mimic-iii population
#  a single SUBJECT_ID for an indivdual, or
#  a list of SUBJECT_IDs for a proper subset of the entire population
#
cohort_where <- function(cohort) {
    rval <- NULL
    if(!is.null(cohort)) {
        rval <- ifelse(
            length(cohort) == 1,
            str_c("WHERE SUBJECT_ID = ", cohort),
            str_c("WHERE SUBJECT_ID IN (", str_c(cohort, collapse = ", "), ")")
        )
    }

    rval
}

mimic_get_patients <- function(con, cohort = NULL, ...) {
    where <- cohort_where(cohort)

    db_get_patients(con, where) %>%
        arrange(SUBJECT_ID)
}

mimic_get_admissions <- function(con, cohort = NULL, ...) {
    where <- cohort_where(cohort)

    db_get_admissions(con, where) %>%
        arrange(SUBJECT_ID, ADMITTIME, HADM_ID)
}

mimic_get_services <- function(con, cohort = NULL, ...) {
    where <- cohort_where(cohort)

    db_get_services(con, where) %>%
        arrange(SUBJECT_ID, TRANSFERTIME, HADM_ID)
}

mimic_get_callout <- function(con, cohort = NULL, ...) {
    where <- cohort_where(cohort)

    db_get_callout(con, where) %>%
        arrange(SUBJECT_ID, HADM_ID)
}

mimic_get_drgcodes <- function(con, cohort = NULL, ...) {
    where <- cohort_where(cohort)

    db_get_drgcodes(con, where) %>%
        arrange(SUBJECT_ID, HADM_ID)
}

mimic_get_icustays <- function(con, cohort = NULL, ...) {
    where <- cohort_where(cohort)

    db_get_icustays(con, where) %>%
        arrange(SUBJECT_ID, INTIME, HADM_ID, ICUSTAY_ID)
}

pat <- mimic_get_patients(mimic3, cohort = 256)
adm <- mimic_get_admissions(mimic3, cohort = 256)
srv <- mimic_get_services(mimic3, cohort = 256)
out <- mimic_get_callout(mimic3, cohort = 256)
drg <- mimic_get_drgcodes(mimic3, cohort = 256)
icu <- mimic_get_icustays(mimic3, cohort = 256)

adm %>%
    left_join(pat, by = "SUBJECT_ID") %>%
    select(SUBJECT_ID, HADM_ID, ADMITTIME, DISCHTIME, DOB) %>%
    mutate(
        LOA = time_length(difftime(DISCHTIME, ADMITTIME), "days"),
        AGE = time_length(difftime(ADMITTIME, DOB), "years")
    )
