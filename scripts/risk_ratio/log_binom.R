library(logbin)
library(gtsummary)
library(sandwich)
library(tidyverse)
library(lmtest)
library(brms)

load("~/GitHub/extubationFailure/data/comp_data.rda")


comp_data |>
  dplyr::select(
    gender,
    reintubate72Hr,
    age
  ) |>
  tbl_cross(
    row = gender,
    col = reintubate72Hr,
    percent = "row"
  )


# Frequentist
# log binomial EM

# method 1 glm
model = glm(
  reintubate72Hr ~ gender + age_cat,
  family = binomial(log),
  # start = c(log(start.p), rep(c(0.2, 0.4), 4)),
  data = comp_data,
  trace = TRUE,
  maxit = 100)

exp(coef(model))
exp(confint(model))


# method 2 logbin

model = logbin(
  reintubate72Hr ~ age_cat,
  # start = c(log(start.p), rep(c(0.2, 0.4), 4)),
  data = comp_data,
  trace = 1)

exp(coef(model))
exp(confint(model))





# log binomial Adaptive barrier

model = logbin(
  reintubate72Hr ~ gender,
  method = "ab",
  # start = c(log(start.p), rep(c(0.2, 0.4), 4)),
  data = comp_data,
  trace = 1)

exp(coef(model))
exp(confint(model))


# robust poisson
poisson_data = comp_data |>
  mutate(
    reintubate72Hr = ifelse(reintubate72Hr == "Yes",1,0)
  ) |>
  dplyr::select(
    gender,
    reintubate72Hr,
    age_cat
  ) |>
  drop_na()


glm.log.poisson <- glm(
  reintubate72Hr ~ gender + age_cat,
  family = poisson(link = "log"),
  data = poisson_data)

exp(coef(coeftest(glm.log.poisson, vcov = sandwich)))
exp(coef(glm.log.poisson))


# Bayesian

model = brm(
  data = poisson_data,
  reintubate72Hr ~ gender + age_cat,
  family = poisson(link = "log")
)

exp(fixef(model))



# model evaluation








# cross validation





