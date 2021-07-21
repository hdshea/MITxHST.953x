library(tidyverse)

base_dir <- here::here("")
fnm <- fs::path(base_dir, "course_exercises/exploratory_data_analysis/aline_full_cohort_data.csv")
dat <- tibble(read.csv(fnm))
rm(fnm)

# Public dataset has NA values for variables required to complete workshop
# Replace NA values with defaults since dataset only intended for teaching
dat <- dat %>%
    mutate(
        gender_num = ifelse(is.na(gender_num), 0L, gender_num),
        sofa_first = ifelse(is.na(sofa_first), 0L, sofa_first)
    )

is01_factor_column <- function(x) {
    v <- unique(x[!is.na(x)])
    ((length(v) == 1) & (v[1] %in% c(0,1))) | ((length(v) == 2) & (v[1] %in% c(0,1)) & (v[2] %in% c(0,1)))
}

dat <- dat %>%
    mutate(across(where(is01_factor_column), as.factor))

dat <- dat %>% mutate(age.cat = ifelse(age <= 55, "<=55", ">55"))
dat$age.cat <- as.factor(dat$age.cat)

p_mort_by_age <- round(100*prop.table(table(dat$age.cat, dat$day_28_flg, dnn=c("Age Grp", "28 Mort")),1),1)
round((p_mort_by_age[,2]/p_mort_by_age[,1]),3)

age.glm <- glm(day_28_flg ~ age.cat, data = dat, family = "binomial")
summary(age.glm)

ageunit.glm <- glm(day_28_flg ~ age.cat + service_unit, data = dat, family = "binomial")
summary(ageunit.glm)

ageunit.glm$coef
ageunit.glm$coef[-1]
# odds ratios of coefficients
exp(ageunit.glm$coef[-1])
# odds ratios of confidence interval range - want to see that 0 is not in the range -
# which is equivalent to seeing if the intervals for the odds ratios include 1
exp(confint(ageunit.glm)[-1,])

# Analysis of variance
anova(age.glm, ageunit.glm, test = "Chisq")

agects.glm <- glm(day_28_flg ~ age, data = dat, family = "binomial")
summary(agects.glm)

# Prediction

newdat <- tibble(expand.grid(age.cat = c("<=55",">55"), service_unit = c("FICU", "MICU", "SICU")))
newdat$pred <- predict(ageunit.glm, newdata = newdat, type = "response")
newdat

#install.packages("aplore3")
library(aplore3)

icu.t <- tibble(icu)

sta_age.glm <- glm(sta ~ age, data = icu, family = "binomial")

sta_age.glm$coef

icu %>%
    ggplot(aes(age, as.numeric(sta)-1)) +
    geom_point()

newdat <- tibble(age = seq.int(from = min(icu$age, na.rm = T), to = max(icu$age, na.rm = T)))
newdat$pred <- predict(sta_age.glm, newdata = newdat, family = "binomial")


icu %>%
    ggplot(aes(age, as.numeric(sta)-1)) +
    geom_point() +
    geom_point(aes(age, predict), data = newdat, color = "red")


