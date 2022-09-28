# add directory

  dataset = readRDS('/undead_army/dataset.rds')




    ##########  username

  NA

  NA


dataset = dataset |>

  dplyr::mutate(
                username = username |>
                     sjlabelled::set_label(
                     label = 'username'
                  ))

chokmah::clean_continuous(dataset[['username']])





    ##########  deviceid

  NA

  NA


dataset = dataset |>

  dplyr::mutate(
                deviceid = deviceid |>
                     sjlabelled::set_label(
                     label = 'deviceid'
                  ))

chokmah::clean_continuous(dataset[['deviceid']])





    ##########  In which region is the farm located?

  NA

  NA

chokmah::clean_discrete(dataset[['q001']])

dataset = dataset |>

  dplyr::mutate(
                q001 = sjlabelled::set_labels(
                                                q001,
                                                labels =
                                                reg
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In which region is the farm located?'
                  ))

chokmah::clean_discrete(dataset[['q001']])





    ##########  In which general area is the farm located?

  NA

  NA

chokmah::clean_discrete(dataset[['q001_1']])

dataset = dataset |>

  dplyr::mutate(
                q001_1 = sjlabelled::set_labels(
                                                q001_1,
                                                labels =
                                                majarea
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In which general area is the farm located?'
                  ))

chokmah::clean_discrete(dataset[['q001_1']])





    ##########  In which community is the farm located?

  NA


dataset$q002[stringr::str_detect(dataset$q002a,pattern = "Airy") == T]
vill[which(stringr::str_detect(names(vill),pattern = "Airy") == T)]


chokmah::clean_discrete(dataset[['q002']])

dataset = dataset |>

  dplyr::mutate(
                q002 = sjlabelled::set_labels(
                                                q002,
                                                labels =
                                                vill
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In which community is the farm located?'
                  ))

chokmah::clean_discrete(dataset[['q002']])





    ##########  Specify community

  dataset$q002a[dataset$q002 != 4] = "Not Applicable"

  NA

chokmah::clean_discrete(dataset[['q002a']])

dataset = dataset |>

  dplyr::mutate(
                q002a = q002a |>
                     sjlabelled::set_label(
                     label = 'Specify community'
                  ))

chokmah::clean_discrete(dataset[['q002a']])





    ##########  Enter the household number

  NA

  NA

chokmah::clean_discrete(dataset[['q003']])

dataset = dataset |>

  dplyr::mutate(
                q003 = q003 |>
                     sjlabelled::set_label(
                     label = 'Enter the household number'
                  ))

chokmah::clean_discrete(dataset[['q003']])





    ##########  Do you agree to participate?

  NA

  NA

chokmah::clean_discrete(dataset[['q0_0']])

dataset = dataset |>

  dplyr::mutate(
                q0_0 = sjlabelled::set_labels(
                                                q0_0,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you agree to participate?'
                  ))

chokmah::clean_discrete(dataset[['q0_0']])





    ##########  Where are you conducting the interview with the respondent?

  NA

  NA

chokmah::clean_discrete(dataset[['q0_4']])

dataset = dataset |>

  dplyr::mutate(
                q0_4 = sjlabelled::set_labels(
                                                q0_4,
                                                labels =
                                                loc
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where are you conducting the interview with the respondent?'
                  ))

chokmah::clean_discrete(dataset[['q0_4']])





    ##########  What is your surname?

  NA

  NA

chokmah::clean_discrete(dataset[['q0_5a']])

dataset = dataset |>

  dplyr::mutate(
                q0_5a = q0_5a |>
                     sjlabelled::set_label(
                     label = 'What is your surname?'
                  ))

chokmah::clean_discrete(dataset[['q0_5a']])





    ##########  What is your first name?

  NA

  NA

chokmah::clean_discrete(dataset[['q0_5b']])

dataset = dataset |>

  dplyr::mutate(
                q0_5b = q0_5b |>
                     sjlabelled::set_label(
                     label = 'What is your first name?'
                  ))

chokmah::clean_discrete(dataset[['q0_5b']])





    ##########  What is your identification (ID) number?

  NA

  NA

chokmah::clean_continuous(dataset[['q0_6']])

dataset = dataset |>

  dplyr::mutate(
                q0_6 = q0_6 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What is your identification (ID) number?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dknas
                     )
                  )

chokmah::clean_continuous(dataset[['q0_6']])





    ##########  What is your mobile phone number?

  NA

  NA

chokmah::clean_continuous(dataset[['q0_a7']])

dataset = dataset |>

  dplyr::mutate(
                q0_a7 = q0_a7 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What is your mobile phone number?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dknas
                     )
                  )

chokmah::clean_continuous(dataset[['q0_a7']])





    ##########  What is your landline telephone number?

  NA

  NA

chokmah::clean_continuous(dataset[['q0_7b']])

dataset = dataset |>

  dplyr::mutate(
                q0_7b = q0_7b |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What is your landline telephone number?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dknas
                     )
                  )

chokmah::clean_continuous(dataset[['q0_7b']])





    ##########  What is your address: Village name?

  NA


dataset$q0_8a =  dataset$q0_8a |> tolower()
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"41")] = "No. 41 Village"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"maria.*p")] = "Maria's Pleasure"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"manor")] = "Taymouth Manor"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"abram")] = "Abram Zuil"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"golden.*est")] = "Golden Fleece Estate"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"gold.f")] = "Golden Fleece"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"regina.*h")] = "Anna Regina Housing Scheme"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"jeal")] = "La Jalousie"
dataset$q0_8a[stringr::str_detect(dataset$q0_8a,"marie")]
dataset$q002[stringr::str_detect(dataset$q0_8a,"marie")]


chokmah::clean_discrete(dataset[['q0_8a']])

dataset = dataset |>

  dplyr::mutate(
                q0_8a = q0_8a |>
                     sjlabelled::set_label(
                     label = 'What is your address: Village name?'
                  ))

chokmah::clean_discrete(dataset[['q0_8a']])





    ##########  What is your address: Lot number?

  NA


dataset$q0_8b[which(dataset$q0_8b == "O")] = 0
dataset$q0_8b[which(dataset$q0_8b == "1p")] = NA
dataset$q0_8b[which(dataset$q0_8b == "SubD1")] = NA
replace1 = which( dataset$q0_8b == "27&28")
replace2 = which( dataset$q0_8b == "230-89")
replace3 = which( dataset$q0_8b == "5B")
replace4 = which( dataset$q0_8b == "1p")
replace5 = which( dataset$q0_8b == "SubD1")
replace5 = which( dataset$q0_8b == "3a")
replace5 = which( dataset$q0_8b == "K17")
replace5 = which( dataset$q0_8b == "103B")
replace5 = which( dataset$q0_8b == "103B")


chokmah::clean_discrete(dataset[['q0_8b']])

dataset = dataset |>

  dplyr::mutate(
                q0_8b = q0_8b |>
                     sjlabelled::set_label(
                     label = 'What is your address: Lot number?'
                  ))

chokmah::clean_discrete(dataset[['q0_8b']])





    ##########  For how many years have you been a producer of agricultural or livestock products?

  NA


dataset$q0_9[dataset$q0_9 == 20017] = 2017
dataset$q0_9[dataset$q0_9 > 1000] = 2022 - dataset$q0_9[dataset$q0_9 > 1000]


chokmah::clean_continuous(dataset[['q0_9']])

dataset = dataset |>

  dplyr::mutate(
                q0_9 = q0_9 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'For how many years have you been a producer of agricultural or livestock products?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dk
                     )
                  )

chokmah::clean_continuous(dataset[['q0_9']])





    ##########  With which ethnicity do you identify most?

  NA

  NA

chokmah::clean_discrete(dataset[['q0_10']])

dataset = dataset |>

  dplyr::mutate(
                q0_10 = sjlabelled::set_labels(
                                                q0_10,
                                                labels =
                                                eth
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'With which ethnicity do you identify most?'
                  ))

chokmah::clean_discrete(dataset[['q0_10']])





    ##########  Do you speak a dialect or language other than English?

  NA

  NA

chokmah::clean_discrete(dataset[['q0_11']])

dataset = dataset |>

  dplyr::mutate(
                q0_11 = sjlabelled::set_labels(
                                                q0_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you speak a dialect or language other than English?'
                  ))

chokmah::clean_discrete(dataset[['q0_11']])





    ##########  What other language or dialect do you speak?: Portuguese

  dataset$q0_12_1[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_1']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_1 = sjlabelled::set_labels(
                                                q0_12_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Portuguese'
                  ))

chokmah::clean_discrete(dataset[['q0_12_1']])





    ##########  What other language or dialect do you speak?: Guyanese Creole

  dataset$q0_12_2[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_2']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_2 = sjlabelled::set_labels(
                                                q0_12_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Guyanese Creole'
                  ))

chokmah::clean_discrete(dataset[['q0_12_2']])





    ##########  What other language or dialect do you speak?: Macushi

  dataset$q0_12_3[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_3']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_3 = sjlabelled::set_labels(
                                                q0_12_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Macushi'
                  ))

chokmah::clean_discrete(dataset[['q0_12_3']])





    ##########  What other language or dialect do you speak?: Akawaio

  dataset$q0_12_4[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_4']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_4 = sjlabelled::set_labels(
                                                q0_12_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Akawaio'
                  ))

chokmah::clean_discrete(dataset[['q0_12_4']])





    ##########  What other language or dialect do you speak?: Wai-Wai

  dataset$q0_12_5[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_5']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_5 = sjlabelled::set_labels(
                                                q0_12_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Wai-Wai'
                  ))

chokmah::clean_discrete(dataset[['q0_12_5']])





    ##########  What other language or dialect do you speak?: Arawak / Lokono

  dataset$q0_12_6[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_6']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_6 = sjlabelled::set_labels(
                                                q0_12_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Arawak / Lokono'
                  ))

chokmah::clean_discrete(dataset[['q0_12_6']])





    ##########  What other language or dialect do you speak?: Wapishana

  dataset$q0_12_7[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_7']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_7 = sjlabelled::set_labels(
                                                q0_12_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Wapishana'
                  ))

chokmah::clean_discrete(dataset[['q0_12_7']])





    ##########  What other language or dialect do you speak?: Chinese

  dataset$q0_12_8[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_8']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_8 = sjlabelled::set_labels(
                                                q0_12_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Chinese'
                  ))

chokmah::clean_discrete(dataset[['q0_12_8']])





    ##########  What other language or dialect do you speak?: Hindi

  dataset$q0_12_9[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_9']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_9 = sjlabelled::set_labels(
                                                q0_12_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Hindi'
                  ))

chokmah::clean_discrete(dataset[['q0_12_9']])





    ##########  What other language or dialect do you speak?: Spanish

  dataset$q0_12_10[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_10']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_10 = sjlabelled::set_labels(
                                                q0_12_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Spanish'
                  ))

chokmah::clean_discrete(dataset[['q0_12_10']])





    ##########  What other language or dialect do you speak?: Tamil

  dataset$q0_12_11[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_11']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_11 = sjlabelled::set_labels(
                                                q0_12_11,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Tamil'
                  ))

chokmah::clean_discrete(dataset[['q0_12_11']])





    ##########  What other language or dialect do you speak?: Other

  dataset$q0_12_12[dataset$q0_11 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q0_12_12']])

dataset = dataset |>

  dplyr::mutate(
                q0_12_12 = sjlabelled::set_labels(
                                                q0_12_12,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What other language or dialect do you speak?: Other'
                  ))

chokmah::clean_discrete(dataset[['q0_12_12']])





    ##########  What is the main activity of your household?

  NA

  NA

chokmah::clean_discrete(dataset[['q0_13']])

dataset = dataset |>

  dplyr::mutate(
                q0_13 = sjlabelled::set_labels(
                                                q0_13,
                                                labels =
                                                mact
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the main activity of your household?'
                  ))

chokmah::clean_discrete(dataset[['q0_13']])





    ##########  Which of the following does your household produce?: Cash crops

  NA

  NA

chokmah::clean_discrete(dataset[['q0_14_1']])

dataset = dataset |>

  dplyr::mutate(
                q0_14_1 = sjlabelled::set_labels(
                                                q0_14_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following does your household produce?: Cash crops'
                  ))

chokmah::clean_discrete(dataset[['q0_14_1']])





    ##########  Which of the following does your household produce?: Cattle

  NA

  NA

chokmah::clean_discrete(dataset[['q0_14_2']])

dataset = dataset |>

  dplyr::mutate(
                q0_14_2 = sjlabelled::set_labels(
                                                q0_14_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following does your household produce?: Cattle'
                  ))

chokmah::clean_discrete(dataset[['q0_14_2']])





    ##########  Which of the following does your household produce?: Small ruminants

  NA

  NA

chokmah::clean_discrete(dataset[['q0_14_3']])

dataset = dataset |>

  dplyr::mutate(
                q0_14_3 = sjlabelled::set_labels(
                                                q0_14_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following does your household produce?: Small ruminants'
                  ))

chokmah::clean_discrete(dataset[['q0_14_3']])





    ##########  What type of dwelling does your household live in?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_11']])

dataset = dataset |>

  dplyr::mutate(
                q1_11 = sjlabelled::set_labels(
                                                q1_11,
                                                labels =
                                                dwell
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of dwelling does your household live in?'
                  ))

chokmah::clean_discrete(dataset[['q1_11']])





    ##########  Specify other type of dwelling

  dataset$q1_11a[dataset$q1_11 != 8] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_11a']])

dataset = dataset |>

  dplyr::mutate(
                q1_11a = q1_11a |>
                     sjlabelled::set_label(
                     label = 'Specify other type of dwelling'
                  ))

chokmah::clean_discrete(dataset[['q1_11a']])





    ##########  What is the main wall material used in the dwelling?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_12']])

dataset = dataset |>

  dplyr::mutate(
                q1_12 = sjlabelled::set_labels(
                                                q1_12,
                                                labels =
                                                wall
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the main wall material used in the dwelling?'
                  ))

chokmah::clean_discrete(dataset[['q1_12']])





    ##########  Specify other wall material

  dataset$q1_12a[dataset$q1_12 != 8] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_12a']])

dataset = dataset |>

  dplyr::mutate(
                q1_12a = q1_12a |>
                     sjlabelled::set_label(
                     label = 'Specify other wall material'
                  ))

chokmah::clean_discrete(dataset[['q1_12a']])





    ##########  What is the predominant roof material used in the dwelling?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_13']])

dataset = dataset |>

  dplyr::mutate(
                q1_13 = sjlabelled::set_labels(
                                                q1_13,
                                                labels =
                                                roof
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the predominant roof material used in the dwelling?'
                  ))

chokmah::clean_discrete(dataset[['q1_13']])





    ##########  Specify other roofing material

  dataset$q1_13a[dataset$q1_13 != 9] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_13a']])

dataset = dataset |>

  dplyr::mutate(
                q1_13a = q1_13a |>
                     sjlabelled::set_label(
                     label = 'Specify other roofing material'
                  ))

chokmah::clean_discrete(dataset[['q1_13a']])





    ##########  What is the main source of water supply for this dwelling?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_14']])

dataset = dataset |>

  dplyr::mutate(
                q1_14 = sjlabelled::set_labels(
                                                q1_14,
                                                labels =
                                                waters
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the main source of water supply for this dwelling?'
                  ))

chokmah::clean_discrete(dataset[['q1_14']])





    ##########  Specify other main source of water

  dataset$q1_14a[dataset$q1_14 != 7] = 'Not Applicable'


dataset$q1_14[which(stringr::str_detect(string = tolower(dataset$q1_14a), "rain"))] = 2
  dataset$q1_14a[which(stringr::str_detect(string = tolower(dataset$q1_14a), "rain"))] = "Not Applicable"
  dataset$q1_14a[which(stringr::str_detect(string = tolower(dataset$q1_14a), "river"))] = "River"
  dataset$q1_14a[which(stringr::str_detect(string = tolower(dataset$q1_14a), "creek|creck"))] = "Creek"
  dataset$q1_14a[which(stringr::str_detect(string = tolower(dataset$q1_14a), "p.*nd |pony"))] = "Pond"


chokmah::clean_discrete(dataset[['q1_14a']])

dataset = dataset |>

  dplyr::mutate(
                q1_14a = q1_14a |>
                     sjlabelled::set_label(
                     label = 'Specify other main source of water'
                  ))

chokmah::clean_discrete(dataset[['q1_14a']])





    ##########  What is the main type of sanitation facility for this dwelling?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_15']])

dataset = dataset |>

  dplyr::mutate(
                q1_15 = sjlabelled::set_labels(
                                                q1_15,
                                                labels =
                                                wc
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the main type of sanitation facility for this dwelling?'
                  ))

chokmah::clean_discrete(dataset[['q1_15']])





    ##########  Specify other type of sanitation facility

  dataset$q1_15a[dataset$q1_15 != 6] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_15a']])

dataset = dataset |>

  dplyr::mutate(
                q1_15a = q1_15a |>
                     sjlabelled::set_label(
                     label = 'Specify other type of sanitation facility'
                  ))

chokmah::clean_discrete(dataset[['q1_15a']])





    ##########  What is the main source of electricity for this dwelling?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_16']])

dataset = dataset |>

  dplyr::mutate(
                q1_16 = sjlabelled::set_labels(
                                                q1_16,
                                                labels =
                                                elect
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the main source of electricity for this dwelling?'
                  ))

chokmah::clean_discrete(dataset[['q1_16']])





    ##########  Specify other main source of electricity

  dataset$q1_16a[dataset$q1_16 != 5] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_16a']])

dataset = dataset |>

  dplyr::mutate(
                q1_16a = q1_16a |>
                     sjlabelled::set_label(
                     label = 'Specify other main source of electricity'
                  ))

chokmah::clean_discrete(dataset[['q1_16a']])





    ##########  What is the main type of energy that your household uses for cooking?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_17']])

dataset = dataset |>

  dplyr::mutate(
                q1_17 = sjlabelled::set_labels(
                                                q1_17,
                                                labels =
                                                cook
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the main type of energy that your household uses for cooking?'
                  ))

chokmah::clean_discrete(dataset[['q1_17']])





    ##########  Specify other main source of energy for cooking

  dataset$q1_17a[dataset$q1_17 != 7] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_17a']])

dataset = dataset |>

  dplyr::mutate(
                q1_17a = q1_17a |>
                     sjlabelled::set_label(
                     label = 'Specify other main source of energy for cooking'
                  ))

chokmah::clean_discrete(dataset[['q1_17a']])





    ##########  Do you have telephone service (landline)?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_18']])

dataset = dataset |>

  dplyr::mutate(
                q1_18 = sjlabelled::set_labels(
                                                q1_18,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you have telephone service (landline)?'
                  ))

chokmah::clean_discrete(dataset[['q1_18']])





    ##########  What is the ownership status for this dwelling?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_19']])

dataset = dataset |>

  dplyr::mutate(
                q1_19 = sjlabelled::set_labels(
                                                q1_19,
                                                labels =
                                                own
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the ownership status for this dwelling?'
                  ))

chokmah::clean_discrete(dataset[['q1_19']])





    ##########  Specify other ownership status

  dataset$q1_19a[dataset$q1_19 != 7] = 'Not Applicable'



  dataset$q1_19a[which(dataset$q1_19 == 7)] = "Not Applicable"
  dataset$q1_19[which(dataset$q1_19 == 7)] = 1


chokmah::clean_discrete(dataset[['q1_19a']])

dataset = dataset |>

  dplyr::mutate(
                q1_19a = q1_19a |>
                     sjlabelled::set_label(
                     label = 'Specify other ownership status'
                  ))

chokmah::clean_discrete(dataset[['q1_19a']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Roof

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_1']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_1 = sjlabelled::set_labels(
                                                q1_20_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Roof'
                  ))

chokmah::clean_discrete(dataset[['q1_20_1']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Walls

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_2']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_2 = sjlabelled::set_labels(
                                                q1_20_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Walls'
                  ))

chokmah::clean_discrete(dataset[['q1_20_2']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Floor

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_3']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_3 = sjlabelled::set_labels(
                                                q1_20_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Floor'
                  ))

chokmah::clean_discrete(dataset[['q1_20_3']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Rooms

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_4']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_4 = sjlabelled::set_labels(
                                                q1_20_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Rooms'
                  ))

chokmah::clean_discrete(dataset[['q1_20_4']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Paint

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_5']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_5 = sjlabelled::set_labels(
                                                q1_20_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Paint'
                  ))

chokmah::clean_discrete(dataset[['q1_20_5']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Plastering

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_6']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_6 = sjlabelled::set_labels(
                                                q1_20_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Plastering'
                  ))

chokmah::clean_discrete(dataset[['q1_20_6']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Electrical system

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_7']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_7 = sjlabelled::set_labels(
                                                q1_20_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Electrical system'
                  ))

chokmah::clean_discrete(dataset[['q1_20_7']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Water and sanitation

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_8']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_8 = sjlabelled::set_labels(
                                                q1_20_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Water and sanitation'
                  ))

chokmah::clean_discrete(dataset[['q1_20_8']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Outside walls

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_9']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_9 = sjlabelled::set_labels(
                                                q1_20_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Outside walls'
                  ))

chokmah::clean_discrete(dataset[['q1_20_9']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Other

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_10']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_10 = sjlabelled::set_labels(
                                                q1_20_10,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: Other'
                  ))

chokmah::clean_discrete(dataset[['q1_20_10']])





    ##########  In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: None

  NA

  NA

chokmah::clean_discrete(dataset[['q1_20_11']])

dataset = dataset |>

  dplyr::mutate(
                q1_20_11 = sjlabelled::set_labels(
                                                q1_20_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) which of the following improvements have you made to the dwelling?: None'
                  ))

chokmah::clean_discrete(dataset[['q1_20_11']])





    ##########  Specify other dwelling improvement

  dataset$q1_20a[dataset$q1_20_10 != 1] = 'Not Applicable'


 dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "extension|extended"))] = "Extension"
  dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "shed"))] = "Built Shed"
  dataset$q1_20_9[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "fence"))] = 1
  dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "fence"))] = "Not Applicable"
  dataset$q1_20_3[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "ground"))] = 1
  dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "ground"))] = "Not Applicable"
  dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "reno"))] = "Renovation"
  dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "recon|rebuild"))] = "Rebuild Home"
  dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "start"))] = "Start Building"
  dataset$q1_20_1[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "roof|ceiling"))] = 1
  dataset$q1_20a[which(stringr::str_detect(tolower(dataset$q1_20a), pattern =  "roof|ceiling"))] = "Not Applicable"


chokmah::clean_discrete(dataset[['q1_20a']])

dataset = dataset |>

  dplyr::mutate(
                q1_20a = q1_20a |>
                     sjlabelled::set_label(
                     label = 'Specify other dwelling improvement'
                  ))

chokmah::clean_discrete(dataset[['q1_20a']])





    ##########  How much did you pay in total for these improvements (including tools, labour, and materials)?

  dataset$q1_21[dataset$q1_20_11 == 1] = -3

  NA

chokmah::clean_continuous(dataset[['q1_21']])

dataset = dataset |>

  dplyr::mutate(
                q1_21 = q1_21 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'How much did you pay in total for these improvements (including tools, labour, and materials)?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q1_21']])





    ##########  Do you know where the closest one of the following facilities is located?: Main paved highway

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_1']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_1 = sjlabelled::set_labels(
                                                q1_22_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Main paved highway'
                  ))

chokmah::clean_discrete(dataset[['q1_22_1']])





    ##########  Do you know where the closest one of the following facilities is located?: Airport / airstrip

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_2']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_2 = sjlabelled::set_labels(
                                                q1_22_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Airport / airstrip'
                  ))

chokmah::clean_discrete(dataset[['q1_22_2']])





    ##########  Do you know where the closest one of the following facilities is located?: Next city/ town

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_3']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_3 = sjlabelled::set_labels(
                                                q1_22_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Next city/ town'
                  ))

chokmah::clean_discrete(dataset[['q1_22_3']])





    ##########  Do you know where the closest one of the following facilities is located?: RDC

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_4']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_4 = sjlabelled::set_labels(
                                                q1_22_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: RDC'
                  ))

chokmah::clean_discrete(dataset[['q1_22_4']])





    ##########  Do you know where the closest one of the following facilities is located?: Preschool (Nursery School)

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_5']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_5 = sjlabelled::set_labels(
                                                q1_22_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Preschool (Nursery School)'
                  ))

chokmah::clean_discrete(dataset[['q1_22_5']])





    ##########  Do you know where the closest one of the following facilities is located?: Primary school

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_6']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_6 = sjlabelled::set_labels(
                                                q1_22_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Primary school'
                  ))

chokmah::clean_discrete(dataset[['q1_22_6']])





    ##########  Do you know where the closest one of the following facilities is located?: Secondary school

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_7']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_7 = sjlabelled::set_labels(
                                                q1_22_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Secondary school'
                  ))

chokmah::clean_discrete(dataset[['q1_22_7']])





    ##########  Do you know where the closest one of the following facilities is located?: Hospital

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_8']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_8 = sjlabelled::set_labels(
                                                q1_22_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Hospital'
                  ))

chokmah::clean_discrete(dataset[['q1_22_8']])





    ##########  Do you know where the closest one of the following facilities is located?: Health post

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_9']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_9 = sjlabelled::set_labels(
                                                q1_22_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Health post'
                  ))

chokmah::clean_discrete(dataset[['q1_22_9']])





    ##########  Do you know where the closest one of the following facilities is located?: Food market

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_10']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_10 = sjlabelled::set_labels(
                                                q1_22_10,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Food market'
                  ))

chokmah::clean_discrete(dataset[['q1_22_10']])





    ##########  Do you know where the closest one of the following facilities is located?: Agricultural extension officer

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_11']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_11 = sjlabelled::set_labels(
                                                q1_22_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Agricultural extension officer'
                  ))

chokmah::clean_discrete(dataset[['q1_22_11']])





    ##########  Do you know where the closest one of the following facilities is located?: Loan services

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_12']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_12 = sjlabelled::set_labels(
                                                q1_22_12,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Loan services'
                  ))

chokmah::clean_discrete(dataset[['q1_22_12']])





    ##########  Do you know where the closest one of the following facilities is located?: Bank

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_13']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_13 = sjlabelled::set_labels(
                                                q1_22_13,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Bank'
                  ))

chokmah::clean_discrete(dataset[['q1_22_13']])





    ##########  Do you know where the closest one of the following facilities is located?: Police station

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_14']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_14 = sjlabelled::set_labels(
                                                q1_22_14,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Police station'
                  ))

chokmah::clean_discrete(dataset[['q1_22_14']])





    ##########  Do you know where the closest one of the following facilities is located?: Public transport (boats and similar)

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_15']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_15 = sjlabelled::set_labels(
                                                q1_22_15,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: Public transport (boats and similar)'
                  ))

chokmah::clean_discrete(dataset[['q1_22_15']])





    ##########  Do you know where the closest one of the following facilities is located?: None

  NA

  NA

chokmah::clean_discrete(dataset[['q1_22_16']])

dataset = dataset |>

  dplyr::mutate(
                q1_22_16 = sjlabelled::set_labels(
                                                q1_22_16,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you know where the closest one of the following facilities is located?: None'
                  ))

chokmah::clean_discrete(dataset[['q1_22_16']])





    ##########  Count of facilities (the closest) the respondent can locate

  NA

  dataset$local_num[which(dataset$q1_22_16 == 1)] = 0

chokmah::clean_continuous(dataset[['local_num']])

dataset = dataset |>

  dplyr::mutate(
                local_num = local_num |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of facilities (the closest) the respondent can locate'
                     ) |>
                     sjlabelled::set_labels(
                     labels = empty
                     )
                  )

chokmah::clean_continuous(dataset[['local_num']])





    ##########  What is the main access route to reach the community/village where your household is located?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_26']])

dataset = dataset |>

  dplyr::mutate(
                q1_26 = sjlabelled::set_labels(
                                                q1_26,
                                                labels =
                                                aroute
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What is the main access route to reach the community/village where your household is located?'
                  ))

chokmah::clean_discrete(dataset[['q1_26']])





    ##########  Specify other access route

  dataset$q1_26a[dataset$q1_26 != 5] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_26a']])

dataset = dataset |>

  dplyr::mutate(
                q1_26a = q1_26a |>
                     sjlabelled::set_label(
                     label = 'Specify other access route'
                  ))

chokmah::clean_discrete(dataset[['q1_26a']])





    ##########  How accessible is this route?

  NA

  NA

chokmah::clean_discrete(dataset[['q1_27']])

dataset = dataset |>

  dplyr::mutate(
                q1_27 = sjlabelled::set_labels(
                                                q1_27,
                                                labels =
                                                access
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'How accessible is this route?'
                  ))

chokmah::clean_discrete(dataset[['q1_27']])





    ##########  Specify other accessibility

  dataset$q1_27a[dataset$q1_27 != 5] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q1_27a']])

dataset = dataset |>

  dplyr::mutate(
                q1_27a = q1_27a |>
                     sjlabelled::set_label(
                     label = 'Specify other accessibility'
                  ))

chokmah::clean_discrete(dataset[['q1_27a']])





    ##########  How many parcels/plots do you own or operate on?

  NA

  NA

chokmah::clean_continuous(dataset[['q2_0']])

dataset = dataset |>

  dplyr::mutate(
                q2_0 = q2_0 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'How many parcels/plots do you own or operate on?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dknas
                     )
                  )

chokmah::clean_continuous(dataset[['q2_0']])





    ##########  Have you experienced any conflicts with regards to your plot/plots?

  NA

  NA

chokmah::clean_discrete(dataset[['q2_20']])

dataset = dataset |>

  dplyr::mutate(
                q2_20 = sjlabelled::set_labels(
                                                q2_20,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Have you experienced any conflicts with regards to your plot/plots?'
                  ))

chokmah::clean_discrete(dataset[['q2_20']])





    ##########  What type of conflict has frequently occurred on your plot?: Border delimitation

  dataset$q2_21_1[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_1']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_1 = sjlabelled::set_labels(
                                                q2_21_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Border delimitation'
                  ))

chokmah::clean_discrete(dataset[['q2_21_1']])





    ##########  What type of conflict has frequently occurred on your plot?: Not having a legal document

  dataset$q2_21_2[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_2']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_2 = sjlabelled::set_labels(
                                                q2_21_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Not having a legal document'
                  ))

chokmah::clean_discrete(dataset[['q2_21_2']])





    ##########  What type of conflict has frequently occurred on your plot?: Occupation / invasion by others

  dataset$q2_21_3[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_3']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_3 = sjlabelled::set_labels(
                                                q2_21_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Occupation / invasion by others'
                  ))

chokmah::clean_discrete(dataset[['q2_21_3']])





    ##########  What type of conflict has frequently occurred on your plot?: Occupation / invasion by us

  dataset$q2_21_4[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_4']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_4 = sjlabelled::set_labels(
                                                q2_21_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Occupation / invasion by us'
                  ))

chokmah::clean_discrete(dataset[['q2_21_4']])





    ##########  What type of conflict has frequently occurred on your plot?: Others claim to be proprietors

  dataset$q2_21_5[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_5']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_5 = sjlabelled::set_labels(
                                                q2_21_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Others claim to be proprietors'
                  ))

chokmah::clean_discrete(dataset[['q2_21_5']])





    ##########  What type of conflict has frequently occurred on your plot?: Did not pay for purchase of land (squatting)

  dataset$q2_21_6[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_6']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_6 = sjlabelled::set_labels(
                                                q2_21_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Did not pay for purchase of land (squatting)'
                  ))

chokmah::clean_discrete(dataset[['q2_21_6']])





    ##########  What type of conflict has frequently occurred on your plot?: Did not pay for rent of land (to private owner)

  dataset$q2_21_7[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_7']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_7 = sjlabelled::set_labels(
                                                q2_21_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Did not pay for rent of land (to private owner)'
                  ))

chokmah::clean_discrete(dataset[['q2_21_7']])





    ##########  What type of conflict has frequently occurred on your plot?: Did not pay for lease of land (to government)

  dataset$q2_21_8[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_8']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_8 = sjlabelled::set_labels(
                                                q2_21_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Did not pay for lease of land (to government)'
                  ))

chokmah::clean_discrete(dataset[['q2_21_8']])





    ##########  What type of conflict has frequently occurred on your plot?: Other

  dataset$q2_21_9[dataset$q2_20 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q2_21_9']])

dataset = dataset |>

  dplyr::mutate(
                q2_21_9 = sjlabelled::set_labels(
                                                q2_21_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of conflict has frequently occurred on your plot?: Other'
                  ))

chokmah::clean_discrete(dataset[['q2_21_9']])





    ##########  Specify other conflict type

  dataset$q2_21a[dataset$q2_21_9 != 1] = 'Not Applicable'


  dataset$q2_21a[which(stringr::str_detect(tolower(dataset$q2_21a),pattern = "animal|sheep|irrigation"))] = "Not Applicable"
  dataset$q2_21a[which(stringr::str_detect(tolower(dataset$q2_21a),pattern = "mma"))] = "Land Ownership"
  dataset$q2_21a[which(stringr::str_detect(tolower(dataset$q2_21a),pattern = "gov"))] = "Land reclaimed by Government"


chokmah::clean_discrete(dataset[['q2_21a']])

dataset = dataset |>

  dplyr::mutate(
                q2_21a = q2_21a |>
                     sjlabelled::set_label(
                     label = 'Specify other conflict type'
                  ))

chokmah::clean_discrete(dataset[['q2_21a']])





    ##########  Count of conflict types that occurred frequently on plot

  dataset$cnum[which(dataset$q2_20 != 1)] = -3

  NA

chokmah::clean_continuous(dataset[['cnum']])

dataset = dataset |>

  dplyr::mutate(
                cnum = cnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of conflict types that occurred frequently on plot'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['cnum']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Drought

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_1']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_1 = sjlabelled::set_labels(
                                                q2_25_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Drought'
                  ))

chokmah::clean_discrete(dataset[['q2_25_1']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Crop pest/disease

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_2']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_2 = sjlabelled::set_labels(
                                                q2_25_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Crop pest/disease'
                  ))

chokmah::clean_discrete(dataset[['q2_25_2']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Livestock disease/illness

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_3']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_3 = sjlabelled::set_labels(
                                                q2_25_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Livestock disease/illness'
                  ))

chokmah::clean_discrete(dataset[['q2_25_3']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Flooding

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_4']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_4 = sjlabelled::set_labels(
                                                q2_25_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Flooding'
                  ))

chokmah::clean_discrete(dataset[['q2_25_4']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of livestock

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_5']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_5 = sjlabelled::set_labels(
                                                q2_25_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of livestock'
                  ))

chokmah::clean_discrete(dataset[['q2_25_5']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of agricultural inputs

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_6']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_6 = sjlabelled::set_labels(
                                                q2_25_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of agricultural inputs'
                  ))

chokmah::clean_discrete(dataset[['q2_25_6']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of machinery/tools

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_7']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_7 = sjlabelled::set_labels(
                                                q2_25_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of machinery/tools'
                  ))

chokmah::clean_discrete(dataset[['q2_25_7']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of agricultural products

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_8']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_8 = sjlabelled::set_labels(
                                                q2_25_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Theft of agricultural products'
                  ))

chokmah::clean_discrete(dataset[['q2_25_8']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Other

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_9']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_9 = sjlabelled::set_labels(
                                                q2_25_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: Other'
                  ))

chokmah::clean_discrete(dataset[['q2_25_9']])





    ##########  In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: None

  NA

  NA

chokmah::clean_discrete(dataset[['q2_25_10']])

dataset = dataset |>

  dplyr::mutate(
                q2_25_10 = sjlabelled::set_labels(
                                                q2_25_10,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) was your agricultural production affected by any of the following events?: None'
                  ))

chokmah::clean_discrete(dataset[['q2_25_10']])





    ##########  Specify other agricultural problem

  dataset$q2_25a[dataset$q2_25_9 != 1] = 'Not Applicable'


dataset$q2_25a[which(stringr::str_detect(tolower(dataset$q2_25a),pattern = "rain"))] = "Rainfall"
  dataset$q2_25a[which(stringr::str_detect(tolower(dataset$q2_25a),pattern = "guy|foot"))] = "Not Applicable"
  dataset$q2_25a[which(stringr::str_detect(tolower(dataset$q2_25a),pattern = "garden"))] = "Poison : crops"
  dataset$q2_25a[which(stringr::str_detect(tolower(dataset$q2_25a),pattern = "animal"))] = "Interference by animals"


chokmah::clean_discrete(dataset[['q2_25a']])

dataset = dataset |>

  dplyr::mutate(
                q2_25a = q2_25a |>
                     sjlabelled::set_label(
                     label = 'Specify other agricultural problem'
                  ))

chokmah::clean_discrete(dataset[['q2_25a']])





    ##########  Count of different events that affected agricultural production

  NA

  dataset$event_num[dataset$q2_25_10 == 1] = 0

chokmah::clean_continuous(dataset[['event_num']])

dataset = dataset |>

  dplyr::mutate(
                event_num = event_num |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different events that affected agricultural production'
                     ) |>
                     sjlabelled::set_labels(
                     labels = empty
                     )
                  )

chokmah::clean_continuous(dataset[['event_num']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Rhinoceros beetle and red palm mite management and control

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_1']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_1 = sjlabelled::set_labels(
                                                q2_28_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Rhinoceros beetle and red palm mite management and control'
                  ))

chokmah::clean_discrete(dataset[['q2_28_1']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Intercropping techniques

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_2']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_2 = sjlabelled::set_labels(
                                                q2_28_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Intercropping techniques'
                  ))

chokmah::clean_discrete(dataset[['q2_28_2']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Silage making

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_3']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_3 = sjlabelled::set_labels(
                                                q2_28_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Silage making'
                  ))

chokmah::clean_discrete(dataset[['q2_28_3']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Composting and vermicompost

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_4']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_4 = sjlabelled::set_labels(
                                                q2_28_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Composting and vermicompost'
                  ))

chokmah::clean_discrete(dataset[['q2_28_4']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Mulching

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_5']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_5 = sjlabelled::set_labels(
                                                q2_28_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Mulching'
                  ))

chokmah::clean_discrete(dataset[['q2_28_5']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Vegetative plant propagation

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_6']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_6 = sjlabelled::set_labels(
                                                q2_28_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Vegetative plant propagation'
                  ))

chokmah::clean_discrete(dataset[['q2_28_6']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Soil conservation works

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_7']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_7 = sjlabelled::set_labels(
                                                q2_28_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Soil conservation works'
                  ))

chokmah::clean_discrete(dataset[['q2_28_7']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Water harvesting

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_8']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_8 = sjlabelled::set_labels(
                                                q2_28_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Water harvesting'
                  ))

chokmah::clean_discrete(dataset[['q2_28_8']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Post harvesting management

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_9']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_9 = sjlabelled::set_labels(
                                                q2_28_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Post harvesting management'
                  ))

chokmah::clean_discrete(dataset[['q2_28_9']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Post-harvest pest and disease

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_10']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_10 = sjlabelled::set_labels(
                                                q2_28_10,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Post-harvest pest and disease'
                  ))

chokmah::clean_discrete(dataset[['q2_28_10']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Climate-smart and protective agricultural techniques

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_11']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_11 = sjlabelled::set_labels(
                                                q2_28_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Climate-smart and protective agricultural techniques'
                  ))

chokmah::clean_discrete(dataset[['q2_28_11']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Soil sampling techniques

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_12']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_12 = sjlabelled::set_labels(
                                                q2_28_12,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Soil sampling techniques'
                  ))

chokmah::clean_discrete(dataset[['q2_28_12']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Coverage crops

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_13']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_13 = sjlabelled::set_labels(
                                                q2_28_13,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Coverage crops'
                  ))

chokmah::clean_discrete(dataset[['q2_28_13']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Pest and disease control and management

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_14']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_14 = sjlabelled::set_labels(
                                                q2_28_14,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Pest and disease control and management'
                  ))

chokmah::clean_discrete(dataset[['q2_28_14']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Farm certification and biosecurity

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_15']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_15 = sjlabelled::set_labels(
                                                q2_28_15,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Farm certification and biosecurity'
                  ))

chokmah::clean_discrete(dataset[['q2_28_15']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: Other

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_16']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_16 = sjlabelled::set_labels(
                                                q2_28_16,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: Other'
                  ))

chokmah::clean_discrete(dataset[['q2_28_16']])





    ##########  Are you currently implementing any of the following agricultural practices on your farm?: None

  NA

  NA

chokmah::clean_discrete(dataset[['q2_28_17']])

dataset = dataset |>

  dplyr::mutate(
                q2_28_17 = sjlabelled::set_labels(
                                                q2_28_17,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following agricultural practices on your farm?: None'
                  ))

chokmah::clean_discrete(dataset[['q2_28_17']])





    ##########  Specify other agricultural practice

  dataset$q2_28a[dataset$q2_28_16 != 1] = 'Not Applicable'


dataset$q2_28_16[which(stringr::str_detect(tolower(dataset$q2_28a),pattern = "clean|tractor"))] = -3
  dataset$q2_28a[which(stringr::str_detect(tolower(dataset$q2_28a),pattern = "clean|tractor"))] = "Not Applicable"


chokmah::clean_discrete(dataset[['q2_28a']])

dataset = dataset |>

  dplyr::mutate(
                q2_28a = q2_28a |>
                     sjlabelled::set_label(
                     label = 'Specify other agricultural practice'
                  ))

chokmah::clean_discrete(dataset[['q2_28a']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Artificial insemination

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_1']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_1 = sjlabelled::set_labels(
                                                q2_29_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Artificial insemination'
                  ))

chokmah::clean_discrete(dataset[['q2_29_1']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Deworming

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_2']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_2 = sjlabelled::set_labels(
                                                q2_29_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Deworming'
                  ))

chokmah::clean_discrete(dataset[['q2_29_2']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Vaccination

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_3']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_3 = sjlabelled::set_labels(
                                                q2_29_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Vaccination'
                  ))

chokmah::clean_discrete(dataset[['q2_29_3']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Brood and brooding

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_4']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_4 = sjlabelled::set_labels(
                                                q2_29_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Brood and brooding'
                  ))

chokmah::clean_discrete(dataset[['q2_29_4']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Supplemental feeding

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_5']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_5 = sjlabelled::set_labels(
                                                q2_29_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Supplemental feeding'
                  ))

chokmah::clean_discrete(dataset[['q2_29_5']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Vampire bat control and management

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_6']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_6 = sjlabelled::set_labels(
                                                q2_29_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Vampire bat control and management'
                  ))

chokmah::clean_discrete(dataset[['q2_29_6']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Branding

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_7']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_7 = sjlabelled::set_labels(
                                                q2_29_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Branding'
                  ))

chokmah::clean_discrete(dataset[['q2_29_7']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Pest and disease control and management

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_8']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_8 = sjlabelled::set_labels(
                                                q2_29_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Pest and disease control and management'
                  ))

chokmah::clean_discrete(dataset[['q2_29_8']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Farm certification and biosecurity

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_9']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_9 = sjlabelled::set_labels(
                                                q2_29_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Farm certification and biosecurity'
                  ))

chokmah::clean_discrete(dataset[['q2_29_9']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: Other

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_10']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_10 = sjlabelled::set_labels(
                                                q2_29_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: Other'
                  ))

chokmah::clean_discrete(dataset[['q2_29_10']])





    ##########  Are you currently implementing any of the following livestock practices on your farm?: None

  NA

  NA

chokmah::clean_discrete(dataset[['q2_29_11']])

dataset = dataset |>

  dplyr::mutate(
                q2_29_11 = sjlabelled::set_labels(
                                                q2_29_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Are you currently implementing any of the following livestock practices on your farm?: None'
                  ))

chokmah::clean_discrete(dataset[['q2_29_11']])





    ##########  Specify other livestock practice

  dataset$q2_29a[dataset$q2_29_10 != 1] = 'Not Applicable'


  dataset$q2_29_10[which(stringr::str_detect(tolower(dataset$q2_29a),pattern = "herd"))] = -3
  dataset$q2_29a[which(stringr::str_detect(tolower(dataset$q2_29a),pattern = "herd"))] = "Not Applicable"


chokmah::clean_discrete(dataset[['q2_29a']])

dataset = dataset |>

  dplyr::mutate(
                q2_29a = q2_29a |>
                     sjlabelled::set_label(
                     label = 'Specify other livestock practice'
                  ))

chokmah::clean_discrete(dataset[['q2_29a']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Wheel tractor

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_1']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_1 = sjlabelled::set_labels(
                                                q3_1_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Wheel tractor'
                  ))

chokmah::clean_discrete(dataset[['q3_1_1']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Wheel barrow

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_2']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_2 = sjlabelled::set_labels(
                                                q3_1_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Wheel barrow'
                  ))

chokmah::clean_discrete(dataset[['q3_1_2']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Tractor trailer

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_3']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_3 = sjlabelled::set_labels(
                                                q3_1_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Tractor trailer'
                  ))

chokmah::clean_discrete(dataset[['q3_1_3']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Crop sprayer

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_4']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_4 = sjlabelled::set_labels(
                                                q3_1_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Crop sprayer'
                  ))

chokmah::clean_discrete(dataset[['q3_1_4']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Brush cutters

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_5']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_5 = sjlabelled::set_labels(
                                                q3_1_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Brush cutters'
                  ))

chokmah::clean_discrete(dataset[['q3_1_5']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Shovel

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_6']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_6 = sjlabelled::set_labels(
                                                q3_1_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Shovel'
                  ))

chokmah::clean_discrete(dataset[['q3_1_6']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Plough

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_7']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_7 = sjlabelled::set_labels(
                                                q3_1_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Plough'
                  ))

chokmah::clean_discrete(dataset[['q3_1_7']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Axe

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_8']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_8 = sjlabelled::set_labels(
                                                q3_1_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Axe'
                  ))

chokmah::clean_discrete(dataset[['q3_1_8']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Hoe

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_9']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_9 = sjlabelled::set_labels(
                                                q3_1_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Hoe'
                  ))

chokmah::clean_discrete(dataset[['q3_1_9']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Chain saw

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_10']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_10 = sjlabelled::set_labels(
                                                q3_1_10,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Chain saw'
                  ))

chokmah::clean_discrete(dataset[['q3_1_10']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Water pump

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_11']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_11 = sjlabelled::set_labels(
                                                q3_1_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Water pump'
                  ))

chokmah::clean_discrete(dataset[['q3_1_11']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Mechanized tiller

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_12']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_12 = sjlabelled::set_labels(
                                                q3_1_12,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Mechanized tiller'
                  ))

chokmah::clean_discrete(dataset[['q3_1_12']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Machete / cutlass

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_13']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_13 = sjlabelled::set_labels(
                                                q3_1_13,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Machete / cutlass'
                  ))

chokmah::clean_discrete(dataset[['q3_1_13']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Mist blower

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_14']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_14 = sjlabelled::set_labels(
                                                q3_1_14,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Mist blower'
                  ))

chokmah::clean_discrete(dataset[['q3_1_14']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Excavator

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_15']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_15 = sjlabelled::set_labels(
                                                q3_1_15,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Excavator'
                  ))

chokmah::clean_discrete(dataset[['q3_1_15']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Seeder

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_16']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_16 = sjlabelled::set_labels(
                                                q3_1_16,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Seeder'
                  ))

chokmah::clean_discrete(dataset[['q3_1_16']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Other

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_17']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_17 = sjlabelled::set_labels(
                                                q3_1_17,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: Other'
                  ))

chokmah::clean_discrete(dataset[['q3_1_17']])





    ##########  In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: None

  NA

  NA

chokmah::clean_discrete(dataset[['q3_1_18']])

dataset = dataset |>

  dplyr::mutate(
                q3_1_18 = sjlabelled::set_labels(
                                                q3_1_18,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021 - June 2022) did you or your household own one or more of the following agricultural assets?: None'
                  ))

chokmah::clean_discrete(dataset[['q3_1_18']])





    ##########  Specify other agricultural asset

  dataset$q3_1a[dataset$q3_1_17 != 1] = 'Not Applicable'


    dataset$q3_1_14[which(stringr::str_detect(tolower(dataset$q3_1a),pattern = "mist"))] = 1
  dataset$q3_1_17[which(stringr::str_detect(tolower(dataset$q3_1a),pattern = "mist"))] = -3
  dataset$q3_1a[which(stringr::str_detect(tolower(dataset$q3_1a),pattern = "mist"))] = "Not Applicable"
  dataset$q3_1a[which(tolower(dataset$q3_1a) == "spade and fork" | tolower(dataset$q3_1a) == "spade fork" | tolower(dataset$q3_1a) == "fork and spade")] = "Spade,Fork"
  dataset$q3_1a[which(tolower(dataset$q3_1a) == "motor gratter" )] = "Motor Grader"
  dataset$q3_1a[which(stringr::str_detect(tolower(dataset$q3_1a),pattern = "does not want"))] = "No Answer"


chokmah::clean_discrete(dataset[['q3_1a']])

dataset = dataset |>

  dplyr::mutate(
                q3_1a = q3_1a |>
                     sjlabelled::set_label(
                     label = 'Specify other agricultural asset'
                  ))

chokmah::clean_discrete(dataset[['q3_1a']])





    ##########  Count of different agricultural assets the household owns

  NA

  dataset$aassetnum[dataset$q3_1_18 == 1] = 0

chokmah::clean_continuous(dataset[['aassetnum']])

dataset = dataset |>

  dplyr::mutate(
                aassetnum = aassetnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different agricultural assets the household owns'
                     ) |>
                     sjlabelled::set_labels(
                     labels = empty
                     )
                  )

chokmah::clean_continuous(dataset[['aassetnum']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Television

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_1']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_1 = sjlabelled::set_labels(
                                                q3_6_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Television'
                  ))

chokmah::clean_discrete(dataset[['q3_6_1']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Radio / stereo

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_2']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_2 = sjlabelled::set_labels(
                                                q3_6_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Radio / stereo'
                  ))

chokmah::clean_discrete(dataset[['q3_6_2']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Cell phone

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_3']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_3 = sjlabelled::set_labels(
                                                q3_6_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Cell phone'
                  ))

chokmah::clean_discrete(dataset[['q3_6_3']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: DVD / VCR

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_4']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_4 = sjlabelled::set_labels(
                                                q3_6_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: DVD / VCR'
                  ))

chokmah::clean_discrete(dataset[['q3_6_4']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Refrigerator

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_5']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_5 = sjlabelled::set_labels(
                                                q3_6_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Refrigerator'
                  ))

chokmah::clean_discrete(dataset[['q3_6_5']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Freezer

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_6']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_6 = sjlabelled::set_labels(
                                                q3_6_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Freezer'
                  ))

chokmah::clean_discrete(dataset[['q3_6_6']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Electric fan / ventilator

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_7']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_7 = sjlabelled::set_labels(
                                                q3_6_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Electric fan / ventilator'
                  ))

chokmah::clean_discrete(dataset[['q3_6_7']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Computer / laptop

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_8']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_8 = sjlabelled::set_labels(
                                                q3_6_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Computer / laptop'
                  ))

chokmah::clean_discrete(dataset[['q3_6_8']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Blender

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_9']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_9 = sjlabelled::set_labels(
                                                q3_6_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Blender'
                  ))

chokmah::clean_discrete(dataset[['q3_6_9']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Gas oven

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_10']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_10 = sjlabelled::set_labels(
                                                q3_6_10,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Gas oven'
                  ))

chokmah::clean_discrete(dataset[['q3_6_10']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Electric oven

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_11']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_11 = sjlabelled::set_labels(
                                                q3_6_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Electric oven'
                  ))

chokmah::clean_discrete(dataset[['q3_6_11']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Washing machine

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_12']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_12 = sjlabelled::set_labels(
                                                q3_6_12,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Washing machine'
                  ))

chokmah::clean_discrete(dataset[['q3_6_12']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Bicycle

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_13']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_13 = sjlabelled::set_labels(
                                                q3_6_13,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Bicycle'
                  ))

chokmah::clean_discrete(dataset[['q3_6_13']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Motorcycle

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_14']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_14 = sjlabelled::set_labels(
                                                q3_6_14,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Motorcycle'
                  ))

chokmah::clean_discrete(dataset[['q3_6_14']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Own car

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_15']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_15 = sjlabelled::set_labels(
                                                q3_6_15,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Own car'
                  ))

chokmah::clean_discrete(dataset[['q3_6_15']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Boat

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_16']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_16 = sjlabelled::set_labels(
                                                q3_6_16,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Boat'
                  ))

chokmah::clean_discrete(dataset[['q3_6_16']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Outboard engine

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_17']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_17 = sjlabelled::set_labels(
                                                q3_6_17,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Outboard engine'
                  ))

chokmah::clean_discrete(dataset[['q3_6_17']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Other asset

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_18']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_18 = sjlabelled::set_labels(
                                                q3_6_18,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: Other asset'
                  ))

chokmah::clean_discrete(dataset[['q3_6_18']])





    ##########  In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: None

  NA

  NA

chokmah::clean_discrete(dataset[['q3_6_19']])

dataset = dataset |>

  dplyr::mutate(
                q3_6_19 = sjlabelled::set_labels(
                                                q3_6_19,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the last year (July 2021-June 2022) did you or a household member own one or more of the following non-agricultural assets?: None'
                  ))

chokmah::clean_discrete(dataset[['q3_6_19']])





    ##########  Specify other non-agricultural asset

  dataset$q3_6a[dataset$q3_6_18 != 1] = 'Not Applicable'


   dataset$q3_6a[which(stringr::str_detect(tolower(dataset$q3_6a),pattern = "bus"))] = "Bus/Mini-bus"
  dataset$q3_6a[which(stringr::str_detect(tolower(dataset$q3_6a),pattern = "track"))] = "Truck"


chokmah::clean_discrete(dataset[['q3_6a']])

dataset = dataset |>

  dplyr::mutate(
                q3_6a = q3_6a |>
                     sjlabelled::set_label(
                     label = 'Specify other non-agricultural asset'
                  ))

chokmah::clean_discrete(dataset[['q3_6a']])





    ##########  Count of different non-agricultural assets the household owns

  NA

  dataset$nassetnum[dataset$q3_6_19 == 1] = 0

chokmah::clean_continuous(dataset[['nassetnum']])

dataset = dataset |>

  dplyr::mutate(
                nassetnum = nassetnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different non-agricultural assets the household owns'
                     ) |>
                     sjlabelled::set_labels(
                     labels = empty
                     )
                  )

chokmah::clean_continuous(dataset[['nassetnum']])





    ##########  Do you have livestock?

  NA

  NA

chokmah::clean_discrete(dataset[['q4_0']])

dataset = dataset |>

  dplyr::mutate(
                q4_0 = sjlabelled::set_labels(
                                                q4_0,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Do you have livestock?'
                  ))

chokmah::clean_discrete(dataset[['q4_0']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Cows

  dataset$q4_1_1[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_1']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_1 = sjlabelled::set_labels(
                                                q4_1_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Cows'
                  ))

chokmah::clean_discrete(dataset[['q4_1_1']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Bulls

  dataset$q4_1_2[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_2']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_2 = sjlabelled::set_labels(
                                                q4_1_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Bulls'
                  ))

chokmah::clean_discrete(dataset[['q4_1_2']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Young bulls

  dataset$q4_1_3[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_3']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_3 = sjlabelled::set_labels(
                                                q4_1_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Young bulls'
                  ))

chokmah::clean_discrete(dataset[['q4_1_3']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Heifers

  dataset$q4_1_4[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_4']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_4 = sjlabelled::set_labels(
                                                q4_1_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Heifers'
                  ))

chokmah::clean_discrete(dataset[['q4_1_4']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Oxen

  dataset$q4_1_5[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_5']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_5 = sjlabelled::set_labels(
                                                q4_1_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Oxen'
                  ))

chokmah::clean_discrete(dataset[['q4_1_5']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Calves

  dataset$q4_1_6[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_6']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_6 = sjlabelled::set_labels(
                                                q4_1_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Calves'
                  ))

chokmah::clean_discrete(dataset[['q4_1_6']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Pigs

  dataset$q4_1_7[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_7']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_7 = sjlabelled::set_labels(
                                                q4_1_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Pigs'
                  ))

chokmah::clean_discrete(dataset[['q4_1_7']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Sheep

  dataset$q4_1_8[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_8']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_8 = sjlabelled::set_labels(
                                                q4_1_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Sheep'
                  ))

chokmah::clean_discrete(dataset[['q4_1_8']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Goats

  dataset$q4_1_9[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_9']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_9 = sjlabelled::set_labels(
                                                q4_1_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Goats'
                  ))

chokmah::clean_discrete(dataset[['q4_1_9']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Donkeys / mules

  dataset$q4_1_10[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_10']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_10 = sjlabelled::set_labels(
                                                q4_1_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Donkeys / mules'
                  ))

chokmah::clean_discrete(dataset[['q4_1_10']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Horses

  dataset$q4_1_11[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_11']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_11 = sjlabelled::set_labels(
                                                q4_1_11,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Horses'
                  ))

chokmah::clean_discrete(dataset[['q4_1_11']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Hens / chicken

  dataset$q4_1_12[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_12']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_12 = sjlabelled::set_labels(
                                                q4_1_12,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Hens / chicken'
                  ))

chokmah::clean_discrete(dataset[['q4_1_12']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Roosters

  dataset$q4_1_13[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_13']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_13 = sjlabelled::set_labels(
                                                q4_1_13,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Roosters'
                  ))

chokmah::clean_discrete(dataset[['q4_1_13']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Ducks

  dataset$q4_1_14[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_14']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_14 = sjlabelled::set_labels(
                                                q4_1_14,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Ducks'
                  ))

chokmah::clean_discrete(dataset[['q4_1_14']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Turkeys

  dataset$q4_1_15[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_15']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_15 = sjlabelled::set_labels(
                                                q4_1_15,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Turkeys'
                  ))

chokmah::clean_discrete(dataset[['q4_1_15']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Bee hives

  dataset$q4_1_16[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_16']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_16 = sjlabelled::set_labels(
                                                q4_1_16,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Bee hives'
                  ))

chokmah::clean_discrete(dataset[['q4_1_16']])





    ##########  Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Other

  dataset$q4_1_17[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_1_17']])

dataset = dataset |>

  dplyr::mutate(
                q4_1_17 = sjlabelled::set_labels(
                                                q4_1_17,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following animals have you owned in the past year (July 2021-Jun 2022)?: Other'
                  ))

chokmah::clean_discrete(dataset[['q4_1_17']])





    ##########  Specify other animals

  dataset$q4_1a[dataset$q4_1_17 != 1] = 'Not Applicable'


 dataset$q4_1a[which(stringr::str_detect(tolower(dataset$q4_1a),pattern = "cattle"))] = "Cattle"


chokmah::clean_discrete(dataset[['q4_1a']])

dataset = dataset |>

  dplyr::mutate(
                q4_1a = q4_1a |>
                     sjlabelled::set_label(
                     label = 'Specify other animals'
                  ))

chokmah::clean_discrete(dataset[['q4_1a']])





    ##########  Count of different animals on farm

  dataset$animalnum[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['animalnum']])

dataset = dataset |>

  dplyr::mutate(
                animalnum = animalnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different animals on farm'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['animalnum']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Milk

  dataset$q4_13_1[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_1']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_1 = sjlabelled::set_labels(
                                                q4_13_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Milk'
                  ))

chokmah::clean_discrete(dataset[['q4_13_1']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Cheese

  dataset$q4_13_2[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_2']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_2 = sjlabelled::set_labels(
                                                q4_13_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Cheese'
                  ))

chokmah::clean_discrete(dataset[['q4_13_2']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Eggs

  dataset$q4_13_3[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_3']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_3 = sjlabelled::set_labels(
                                                q4_13_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Eggs'
                  ))

chokmah::clean_discrete(dataset[['q4_13_3']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Honey

  dataset$q4_13_4[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_4']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_4 = sjlabelled::set_labels(
                                                q4_13_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Honey'
                  ))

chokmah::clean_discrete(dataset[['q4_13_4']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Oil

  dataset$q4_13_5[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_5']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_5 = sjlabelled::set_labels(
                                                q4_13_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Oil'
                  ))

chokmah::clean_discrete(dataset[['q4_13_5']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Manure

  dataset$q4_13_6[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_6']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_6 = sjlabelled::set_labels(
                                                q4_13_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Manure'
                  ))

chokmah::clean_discrete(dataset[['q4_13_6']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Hide

  dataset$q4_13_7[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_7']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_7 = sjlabelled::set_labels(
                                                q4_13_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Hide'
                  ))

chokmah::clean_discrete(dataset[['q4_13_7']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Other

  dataset$q4_13_8[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_8']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_8 = sjlabelled::set_labels(
                                                q4_13_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: Other'
                  ))

chokmah::clean_discrete(dataset[['q4_13_8']])





    ##########  Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: None

  dataset$q4_13_9[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_13_9']])

dataset = dataset |>

  dplyr::mutate(
                q4_13_9 = sjlabelled::set_labels(
                                                q4_13_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you produce any of the following animal products in the past year (July 2021 -- June 2022)?: None'
                  ))

chokmah::clean_discrete(dataset[['q4_13_9']])





    ##########  Specify other animal product

  dataset$q4_13a[dataset$q4_13_8 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q4_13a']])

dataset = dataset |>

  dplyr::mutate(
                q4_13a = q4_13a |>
                     sjlabelled::set_label(
                     label = 'Specify other animal product'
                  ))

chokmah::clean_discrete(dataset[['q4_13a']])





    ##########  Count of different animal products produced on farm

  dataset$aprodnum[dataset$q4_0 != 1] = -3

  dataset$aprodnum[dataset$q4_13_9 == 1] = 0

chokmah::clean_continuous(dataset[['aprodnum']])

dataset = dataset |>

  dplyr::mutate(
                aprodnum = aprodnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different animal products produced on farm'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['aprodnum']])





    ##########  On average, how many gallons of milk do you produce per day?

  dataset$q4_21[dataset$q4_13_1 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_21']])

dataset = dataset |>

  dplyr::mutate(
                q4_21 = q4_21 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'On average, how many gallons of milk do you produce per day?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_21']])





    ##########  How many days did you produce milk in the last year (July 2021 -- June 2022)?

  dataset$q4_22[dataset$q4_13_1 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_22']])

dataset = dataset |>

  dplyr::mutate(
                q4_22 = q4_22 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'How many days did you produce milk in the last year (July 2021 -- June 2022)?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_22']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Concentrate / food

  dataset$q4_23_1[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_1']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_1 = sjlabelled::set_labels(
                                                q4_23_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Concentrate / food'
                  ))

chokmah::clean_discrete(dataset[['q4_23_1']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Other food costs

  dataset$q4_23_2[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_2']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_2 = sjlabelled::set_labels(
                                                q4_23_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Other food costs'
                  ))

chokmah::clean_discrete(dataset[['q4_23_2']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Minerals

  dataset$q4_23_3[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_3']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_3 = sjlabelled::set_labels(
                                                q4_23_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Minerals'
                  ))

chokmah::clean_discrete(dataset[['q4_23_3']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Salt

  dataset$q4_23_4[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_4']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_4 = sjlabelled::set_labels(
                                                q4_23_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Salt'
                  ))

chokmah::clean_discrete(dataset[['q4_23_4']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Veterinary products / services

  dataset$q4_23_5[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_5']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_5 = sjlabelled::set_labels(
                                                q4_23_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Veterinary products / services'
                  ))

chokmah::clean_discrete(dataset[['q4_23_5']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Pasture maintenance

  dataset$q4_23_6[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_6']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_6 = sjlabelled::set_labels(
                                                q4_23_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Pasture maintenance'
                  ))

chokmah::clean_discrete(dataset[['q4_23_6']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Molasses

  dataset$q4_23_7[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_7']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_7 = sjlabelled::set_labels(
                                                q4_23_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Molasses'
                  ))

chokmah::clean_discrete(dataset[['q4_23_7']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Infrastructure maintenance

  dataset$q4_23_8[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_8']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_8 = sjlabelled::set_labels(
                                                q4_23_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Infrastructure maintenance'
                  ))

chokmah::clean_discrete(dataset[['q4_23_8']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Other

  dataset$q4_23_9[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_9']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_9 = sjlabelled::set_labels(
                                                q4_23_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: Other'
                  ))

chokmah::clean_discrete(dataset[['q4_23_9']])





    ##########  In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: None

  dataset$q4_23_10[dataset$q4_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_23_10']])

dataset = dataset |>

  dplyr::mutate(
                q4_23_10 = sjlabelled::set_labels(
                                                q4_23_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In the past year (July 2021 -- June 2022) did you use any of the following for your livestock production?: None'
                  ))

chokmah::clean_discrete(dataset[['q4_23_10']])





    ##########  Specify other cost

  dataset$q4_23a[dataset$q4_23_9 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q4_23a']])

dataset = dataset |>

  dplyr::mutate(
                q4_23a = q4_23a |>
                     sjlabelled::set_label(
                     label = 'Specify other cost'
                  ))

chokmah::clean_discrete(dataset[['q4_23a']])





    ##########  Count of different costs for livestock production

  dataset$lcostsnum[dataset$q4_0 != 1] = -3

  dataset$lcostsnum[dataset$q4_23_10 == 1] = 0

chokmah::clean_continuous(dataset[['lcostsnum']])

dataset = dataset |>

  dplyr::mutate(
                lcostsnum = lcostsnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different costs for livestock production'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['lcostsnum']])





    ##########  Is your household active in aquaculture production?

  NA

  NA

chokmah::clean_discrete(dataset[['q4_28']])

dataset = dataset |>

  dplyr::mutate(
                q4_28 = sjlabelled::set_labels(
                                                q4_28,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Is your household active in aquaculture production?'
                  ))

chokmah::clean_discrete(dataset[['q4_28']])





    ##########  Does your household possess a pond or tank for aquaculture?: Tank

  dataset$q4_29_1[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_29_1']])

dataset = dataset |>

  dplyr::mutate(
                q4_29_1 = sjlabelled::set_labels(
                                                q4_29_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Does your household possess a pond or tank for aquaculture?: Tank'
                  ))

chokmah::clean_discrete(dataset[['q4_29_1']])





    ##########  Does your household possess a pond or tank for aquaculture?: Pond

  dataset$q4_29_2[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_29_2']])

dataset = dataset |>

  dplyr::mutate(
                q4_29_2 = sjlabelled::set_labels(
                                                q4_29_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Does your household possess a pond or tank for aquaculture?: Pond'
                  ))

chokmah::clean_discrete(dataset[['q4_29_2']])





    ##########  Does your household possess a pond or tank for aquaculture?: None

  dataset$q4_29_3[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_29_3']])

dataset = dataset |>

  dplyr::mutate(
                q4_29_3 = sjlabelled::set_labels(
                                                q4_29_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Does your household possess a pond or tank for aquaculture?: None'
                  ))

chokmah::clean_discrete(dataset[['q4_29_3']])





    ##########  What is the length of the pond/ tank?

  dataset$q4_30_1[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_30_1']])

dataset = dataset |>

  dplyr::mutate(
                q4_30_1 = q4_30_1 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What is the length of the pond/ tank?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_30_1']])





    ##########  What is the width of the pond/tank?

  dataset$q4_30_2[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_30_2']])

dataset = dataset |>

  dplyr::mutate(
                q4_30_2 = q4_30_2 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What is the width of the pond/tank?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_30_2']])





    ##########  What is the depth of the pond/tank?

  dataset$q4_30_3[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_30_3']])

dataset = dataset |>

  dplyr::mutate(
                q4_30_3 = q4_30_3 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What is the depth of the pond/tank?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_30_3']])





    ##########  Was the pond/tank constructed due to a government program?

  dataset$q4_31[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_31']])

dataset = dataset |>

  dplyr::mutate(
                q4_31 = sjlabelled::set_labels(
                                                q4_31,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Was the pond/tank constructed due to a government program?'
                  ))

chokmah::clean_discrete(dataset[['q4_31']])





    ##########  In what year was this pond/tank constructed?

  dataset$q4_32[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_32']])

dataset = dataset |>

  dplyr::mutate(
                q4_32 = q4_32 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'In what year was this pond/tank constructed?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_32']])





    ##########  What was the cost of building the pond/ tank for hired labour?

  dataset$q4_33[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_33']])

dataset = dataset |>

  dplyr::mutate(
                q4_33 = q4_33 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What was the cost of building the pond/ tank for hired labour?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_33']])





    ##########  What was the cost of building the pond/ tank for tools and machinery?

  dataset$q4_34[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_34']])

dataset = dataset |>

  dplyr::mutate(
                q4_34 = q4_34 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What was the cost of building the pond/ tank for tools and machinery?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_34']])





    ##########  What was the cost of building the pond/tank for materials?

  dataset$q4_35[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_35']])

dataset = dataset |>

  dplyr::mutate(
                q4_35 = q4_35 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What was the cost of building the pond/tank for materials?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_35']])





    ##########  What were the maintenance costs in the last year?

  dataset$q4_36[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q4_36']])

dataset = dataset |>

  dplyr::mutate(
                q4_36 = q4_36 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What were the maintenance costs in the last year?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q4_36']])





    ##########  What type of fish do you have for aquaculture production?: Mozambique tilapia

  dataset$q4_37_1[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_1']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_1 = sjlabelled::set_labels(
                                                q4_37_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: Mozambique tilapia'
                  ))

chokmah::clean_discrete(dataset[['q4_37_1']])





    ##########  What type of fish do you have for aquaculture production?: Nile tilapia

  dataset$q4_37_2[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_2']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_2 = sjlabelled::set_labels(
                                                q4_37_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: Nile tilapia'
                  ))

chokmah::clean_discrete(dataset[['q4_37_2']])





    ##########  What type of fish do you have for aquaculture production?: Jamaican red tilapia

  dataset$q4_37_3[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_3']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_3 = sjlabelled::set_labels(
                                                q4_37_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: Jamaican red tilapia'
                  ))

chokmah::clean_discrete(dataset[['q4_37_3']])





    ##########  What type of fish do you have for aquaculture production?: Giant river prawn

  dataset$q4_37_4[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_4']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_4 = sjlabelled::set_labels(
                                                q4_37_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: Giant river prawn'
                  ))

chokmah::clean_discrete(dataset[['q4_37_4']])





    ##########  What type of fish do you have for aquaculture production?: Salmon shrimp

  dataset$q4_37_5[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_5']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_5 = sjlabelled::set_labels(
                                                q4_37_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: Salmon shrimp'
                  ))

chokmah::clean_discrete(dataset[['q4_37_5']])





    ##########  What type of fish do you have for aquaculture production?: Other 1

  dataset$q4_37_6[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_6']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_6 = sjlabelled::set_labels(
                                                q4_37_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: Other 1'
                  ))

chokmah::clean_discrete(dataset[['q4_37_6']])





    ##########  What type of fish do you have for aquaculture production?: Other 2

  dataset$q4_37_7[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_7']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_7 = sjlabelled::set_labels(
                                                q4_37_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: Other 2'
                  ))

chokmah::clean_discrete(dataset[['q4_37_7']])





    ##########  What type of fish do you have for aquaculture production?: None

  dataset$q4_37_8[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q4_37_8']])

dataset = dataset |>

  dplyr::mutate(
                q4_37_8 = sjlabelled::set_labels(
                                                q4_37_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What type of fish do you have for aquaculture production?: None'
                  ))

chokmah::clean_discrete(dataset[['q4_37_8']])





    ##########  Specify other type of fish 1

  dataset$q4_37a[dataset$q4_37_6 != 1] = 'Not Applicable'


  dataset$q4_37a[which(stringr::str_detect(tolower(dataset$q4_37a),pattern = "has"))] = "Hassa"
  dataset$q4_37a[which(stringr::str_detect(tolower(dataset$q4_37a),pattern = "pat"))] = "Patwa"

  dataset = dataset |>
    dplyr::mutate(
      q4_37_9 = ifelse(q4_37a == "Hassa",1,-3) |>
        sjlabelled::set_label('What type of fish do you have for aquaculture production?: Hassa') |>
        sjlabelled::set_labels(labels = ynna)
    ) |>
    dplyr::relocate(
      q4_37_9,
      .after = q4_37_8
    )


chokmah::clean_discrete(dataset[['q4_37a']])

dataset = dataset |>

  dplyr::mutate(
                q4_37a = q4_37a |>
                     sjlabelled::set_label(
                     label = 'Specify other type of fish 1'
                  ))

chokmah::clean_discrete(dataset[['q4_37a']])





    ##########  Specify other type of fish 2

  dataset$q4_37b[dataset$q4_37_7 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q4_37b']])

dataset = dataset |>

  dplyr::mutate(
                q4_37b = q4_37b |>
                     sjlabelled::set_label(
                     label = 'Specify other type of fish 2'
                  ))

chokmah::clean_discrete(dataset[['q4_37b']])





    ##########  Count of different fish types used for aquaculture production

  dataset$fishnum[dataset$q4_28 != 1] = -3

  dataset$fishnum[dataset$q4_37_8 == 1] = 0

chokmah::clean_continuous(dataset[['fishnum']])

dataset = dataset |>

  dplyr::mutate(
                fishnum = fishnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different fish types used for aquaculture production'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['fishnum']])





    ##########  Total money made from fish sold

  dataset$fsold[dataset$q4_28 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['fsold']])

dataset = dataset |>

  dplyr::mutate(
                fsold = fsold |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Total money made from fish sold'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['fsold']])





    ##########  Where did you sell the fish? : On own property

  dataset$q4_45_1[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_1']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_1 = sjlabelled::set_labels(
                                                q4_45_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : On own property'
                  ))

chokmah::clean_discrete(dataset[['q4_45_1']])





    ##########  Where did you sell the fish? : To friend / neighbour in community

  dataset$q4_45_2[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_2']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_2 = sjlabelled::set_labels(
                                                q4_45_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : To friend / neighbour in community'
                  ))

chokmah::clean_discrete(dataset[['q4_45_2']])





    ##########  Where did you sell the fish? : Fixed client

  dataset$q4_45_3[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_3']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_3 = sjlabelled::set_labels(
                                                q4_45_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Fixed client'
                  ))

chokmah::clean_discrete(dataset[['q4_45_3']])





    ##########  Where did you sell the fish? : Local market

  dataset$q4_45_4[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_4']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_4 = sjlabelled::set_labels(
                                                q4_45_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Local market'
                  ))

chokmah::clean_discrete(dataset[['q4_45_4']])





    ##########  Where did you sell the fish? : Regional market

  dataset$q4_45_5[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_5']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_5 = sjlabelled::set_labels(
                                                q4_45_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Regional market'
                  ))

chokmah::clean_discrete(dataset[['q4_45_5']])





    ##########  Where did you sell the fish? : Through cooperative / association

  dataset$q4_45_6[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_6']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_6 = sjlabelled::set_labels(
                                                q4_45_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Through cooperative / association'
                  ))

chokmah::clean_discrete(dataset[['q4_45_6']])





    ##########  Where did you sell the fish? : Wholesaler

  dataset$q4_45_7[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_7']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_7 = sjlabelled::set_labels(
                                                q4_45_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Wholesaler'
                  ))

chokmah::clean_discrete(dataset[['q4_45_7']])





    ##########  Where did you sell the fish? : Intermediary

  dataset$q4_45_8[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_8']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_8 = sjlabelled::set_labels(
                                                q4_45_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Intermediary'
                  ))

chokmah::clean_discrete(dataset[['q4_45_8']])





    ##########  Where did you sell the fish? : Supermarket

  dataset$q4_45_9[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_9']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_9 = sjlabelled::set_labels(
                                                q4_45_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Supermarket'
                  ))

chokmah::clean_discrete(dataset[['q4_45_9']])





    ##########  Where did you sell the fish? : Other

  dataset$q4_45_10[dataset$fsold == 0] = -3

  NA

chokmah::clean_discrete(dataset[['q4_45_10']])

dataset = dataset |>

  dplyr::mutate(
                q4_45_10 = sjlabelled::set_labels(
                                                q4_45_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Where did you sell the fish? : Other'
                  ))

chokmah::clean_discrete(dataset[['q4_45_10']])





    ##########  What was your cost of sale (transport, storage, etc.)?

  dataset$q4_46[dataset$fsold == 0] = -3

  NA

chokmah::clean_continuous(dataset[['q4_46']])

dataset = dataset |>

  dplyr::mutate(
                q4_46 = q4_46 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'What was your cost of sale (transport, storage, etc.)?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['q4_46']])





    ##########  Which of the following crops did you harvest within the last 12 months? : Temporary Crops

  NA

  NA

chokmah::clean_discrete(dataset[['q5_0_1']])

dataset = dataset |>

  dplyr::mutate(
                q5_0_1 = sjlabelled::set_labels(
                                                q5_0_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following crops did you harvest within the last 12 months? : Temporary Crops'
                  ))

chokmah::clean_discrete(dataset[['q5_0_1']])





    ##########  Which of the following crops did you harvest within the last 12 months? : Permanent Crops

  NA

  NA

chokmah::clean_discrete(dataset[['q5_0_2']])

dataset = dataset |>

  dplyr::mutate(
                q5_0_2 = sjlabelled::set_labels(
                                                q5_0_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following crops did you harvest within the last 12 months? : Permanent Crops'
                  ))

chokmah::clean_discrete(dataset[['q5_0_2']])





    ##########  Which of the following crops did you harvest within the last 12 months? : None

  NA

  NA

chokmah::clean_discrete(dataset[['q5_0_3']])

dataset = dataset |>

  dplyr::mutate(
                q5_0_3 = sjlabelled::set_labels(
                                                q5_0_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of the following crops did you harvest within the last 12 months? : None'
                  ))

chokmah::clean_discrete(dataset[['q5_0_3']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Bean / Bora

  dataset$q5_1_1[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_1']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_1 = sjlabelled::set_labels(
                                                q5_1_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Bean / Bora'
                  ))

chokmah::clean_discrete(dataset[['q5_1_1']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Black-Eyed Pea

  dataset$q5_1_2[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_2']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_2 = sjlabelled::set_labels(
                                                q5_1_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Black-Eyed Pea'
                  ))

chokmah::clean_discrete(dataset[['q5_1_2']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Boulanger / Eggplant

  dataset$q5_1_3[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_3']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_3 = sjlabelled::set_labels(
                                                q5_1_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Boulanger / Eggplant'
                  ))

chokmah::clean_discrete(dataset[['q5_1_3']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Broccoli

  dataset$q5_1_4[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_4']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_4 = sjlabelled::set_labels(
                                                q5_1_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Broccoli'
                  ))

chokmah::clean_discrete(dataset[['q5_1_4']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Cabbage

  dataset$q5_1_5[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_5']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_5 = sjlabelled::set_labels(
                                                q5_1_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Cabbage'
                  ))

chokmah::clean_discrete(dataset[['q5_1_5']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Callaloo

  dataset$q5_1_6[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_6']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_6 = sjlabelled::set_labels(
                                                q5_1_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Callaloo'
                  ))

chokmah::clean_discrete(dataset[['q5_1_6']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Carrot

  dataset$q5_1_7[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_7']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_7 = sjlabelled::set_labels(
                                                q5_1_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Carrot'
                  ))

chokmah::clean_discrete(dataset[['q5_1_7']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Cassava (Sweet)

  dataset$q5_1_8[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_8']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_8 = sjlabelled::set_labels(
                                                q5_1_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Cassava (Sweet)'
                  ))

chokmah::clean_discrete(dataset[['q5_1_8']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Cassava (Bitter)

  dataset$q5_1_9[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_9']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_9 = sjlabelled::set_labels(
                                                q5_1_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Cassava (Bitter)'
                  ))

chokmah::clean_discrete(dataset[['q5_1_9']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Cauliflower

  dataset$q5_1_10[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_10']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_10 = sjlabelled::set_labels(
                                                q5_1_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Cauliflower'
                  ))

chokmah::clean_discrete(dataset[['q5_1_10']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Celery

  dataset$q5_1_11[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_11']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_11 = sjlabelled::set_labels(
                                                q5_1_11,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Celery'
                  ))

chokmah::clean_discrete(dataset[['q5_1_11']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Corilla

  dataset$q5_1_12[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_12']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_12 = sjlabelled::set_labels(
                                                q5_1_12,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Corilla'
                  ))

chokmah::clean_discrete(dataset[['q5_1_12']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Corn

  dataset$q5_1_13[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_13']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_13 = sjlabelled::set_labels(
                                                q5_1_13,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Corn'
                  ))

chokmah::clean_discrete(dataset[['q5_1_13']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Corn (Sweet)

  dataset$q5_1_14[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_14']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_14 = sjlabelled::set_labels(
                                                q5_1_14,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Corn (Sweet)'
                  ))

chokmah::clean_discrete(dataset[['q5_1_14']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Cucumber

  dataset$q5_1_15[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_15']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_15 = sjlabelled::set_labels(
                                                q5_1_15,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Cucumber'
                  ))

chokmah::clean_discrete(dataset[['q5_1_15']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Dasheen

  dataset$q5_1_16[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_16']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_16 = sjlabelled::set_labels(
                                                q5_1_16,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Dasheen'
                  ))

chokmah::clean_discrete(dataset[['q5_1_16']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Eddoe

  dataset$q5_1_17[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_17']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_17 = sjlabelled::set_labels(
                                                q5_1_17,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Eddoe'
                  ))

chokmah::clean_discrete(dataset[['q5_1_17']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Eschallot

  dataset$q5_1_18[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_18']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_18 = sjlabelled::set_labels(
                                                q5_1_18,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Eschallot'
                  ))

chokmah::clean_discrete(dataset[['q5_1_18']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Ginger

  dataset$q5_1_19[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_19']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_19 = sjlabelled::set_labels(
                                                q5_1_19,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Ginger'
                  ))

chokmah::clean_discrete(dataset[['q5_1_19']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Lettuce

  dataset$q5_1_20[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_20']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_20 = sjlabelled::set_labels(
                                                q5_1_20,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Lettuce'
                  ))

chokmah::clean_discrete(dataset[['q5_1_20']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Minica

  dataset$q5_1_21[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_21']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_21 = sjlabelled::set_labels(
                                                q5_1_21,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Minica'
                  ))

chokmah::clean_discrete(dataset[['q5_1_21']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Musk Melon

  dataset$q5_1_22[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_22']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_22 = sjlabelled::set_labels(
                                                q5_1_22,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Musk Melon'
                  ))

chokmah::clean_discrete(dataset[['q5_1_22']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Mustard

  dataset$q5_1_23[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_23']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_23 = sjlabelled::set_labels(
                                                q5_1_23,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Mustard'
                  ))

chokmah::clean_discrete(dataset[['q5_1_23']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Ochro

  dataset$q5_1_24[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_24']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_24 = sjlabelled::set_labels(
                                                q5_1_24,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Ochro'
                  ))

chokmah::clean_discrete(dataset[['q5_1_24']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Onion

  dataset$q5_1_25[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_25']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_25 = sjlabelled::set_labels(
                                                q5_1_25,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Onion'
                  ))

chokmah::clean_discrete(dataset[['q5_1_25']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Pak Choi

  dataset$q5_1_26[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_26']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_26 = sjlabelled::set_labels(
                                                q5_1_26,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Pak Choi'
                  ))

chokmah::clean_discrete(dataset[['q5_1_26']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Parsley

  dataset$q5_1_27[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_27']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_27 = sjlabelled::set_labels(
                                                q5_1_27,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Parsley'
                  ))

chokmah::clean_discrete(dataset[['q5_1_27']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Peanut

  dataset$q5_1_28[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_28']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_28 = sjlabelled::set_labels(
                                                q5_1_28,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Peanut'
                  ))

chokmah::clean_discrete(dataset[['q5_1_28']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Pepper (Sweet)

  dataset$q5_1_29[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_29']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_29 = sjlabelled::set_labels(
                                                q5_1_29,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Pepper (Sweet)'
                  ))

chokmah::clean_discrete(dataset[['q5_1_29']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Pepper (Hot)

  dataset$q5_1_30[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_30']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_30 = sjlabelled::set_labels(
                                                q5_1_30,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Pepper (Hot)'
                  ))

chokmah::clean_discrete(dataset[['q5_1_30']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Pepper (Wiri Wiri)

  dataset$q5_1_31[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_31']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_31 = sjlabelled::set_labels(
                                                q5_1_31,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Pepper (Wiri Wiri)'
                  ))

chokmah::clean_discrete(dataset[['q5_1_31']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Pineapple

  dataset$q5_1_32[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_32']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_32 = sjlabelled::set_labels(
                                                q5_1_32,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Pineapple'
                  ))

chokmah::clean_discrete(dataset[['q5_1_32']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Potato

  dataset$q5_1_33[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_33']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_33 = sjlabelled::set_labels(
                                                q5_1_33,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Potato'
                  ))

chokmah::clean_discrete(dataset[['q5_1_33']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Pumpkin

  dataset$q5_1_34[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_34']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_34 = sjlabelled::set_labels(
                                                q5_1_34,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Pumpkin'
                  ))

chokmah::clean_discrete(dataset[['q5_1_34']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Radish

  dataset$q5_1_35[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_35']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_35 = sjlabelled::set_labels(
                                                q5_1_35,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Radish'
                  ))

chokmah::clean_discrete(dataset[['q5_1_35']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Red Beans

  dataset$q5_1_36[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_36']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_36 = sjlabelled::set_labels(
                                                q5_1_36,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Red Beans'
                  ))

chokmah::clean_discrete(dataset[['q5_1_36']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Rice

  dataset$q5_1_37[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_37']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_37 = sjlabelled::set_labels(
                                                q5_1_37,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Rice'
                  ))

chokmah::clean_discrete(dataset[['q5_1_37']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Saeme

  dataset$q5_1_38[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_38']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_38 = sjlabelled::set_labels(
                                                q5_1_38,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Saeme'
                  ))

chokmah::clean_discrete(dataset[['q5_1_38']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Scallion

  dataset$q5_1_39[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_39']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_39 = sjlabelled::set_labels(
                                                q5_1_39,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Scallion'
                  ))

chokmah::clean_discrete(dataset[['q5_1_39']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Squash

  dataset$q5_1_40[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_40']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_40 = sjlabelled::set_labels(
                                                q5_1_40,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Squash'
                  ))

chokmah::clean_discrete(dataset[['q5_1_40']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Spinach

  dataset$q5_1_41[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_41']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_41 = sjlabelled::set_labels(
                                                q5_1_41,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Spinach'
                  ))

chokmah::clean_discrete(dataset[['q5_1_41']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Sweet Potato

  dataset$q5_1_42[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_42']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_42 = sjlabelled::set_labels(
                                                q5_1_42,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Sweet Potato'
                  ))

chokmah::clean_discrete(dataset[['q5_1_42']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Tannia

  dataset$q5_1_43[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_43']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_43 = sjlabelled::set_labels(
                                                q5_1_43,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Tannia'
                  ))

chokmah::clean_discrete(dataset[['q5_1_43']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Thyme

  dataset$q5_1_44[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_44']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_44 = sjlabelled::set_labels(
                                                q5_1_44,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Thyme'
                  ))

chokmah::clean_discrete(dataset[['q5_1_44']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Tomato

  dataset$q5_1_45[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_45']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_45 = sjlabelled::set_labels(
                                                q5_1_45,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Tomato'
                  ))

chokmah::clean_discrete(dataset[['q5_1_45']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Watermelon

  dataset$q5_1_46[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_46']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_46 = sjlabelled::set_labels(
                                                q5_1_46,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Watermelon'
                  ))

chokmah::clean_discrete(dataset[['q5_1_46']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Yam

  dataset$q5_1_47[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_47']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_47 = sjlabelled::set_labels(
                                                q5_1_47,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Yam'
                  ))

chokmah::clean_discrete(dataset[['q5_1_47']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Other 1

  dataset$q5_1_48[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_48']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_48 = sjlabelled::set_labels(
                                                q5_1_48,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Other 1'
                  ))

chokmah::clean_discrete(dataset[['q5_1_48']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Other 2

  dataset$q5_1_49[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_49']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_49 = sjlabelled::set_labels(
                                                q5_1_49,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Other 2'
                  ))

chokmah::clean_discrete(dataset[['q5_1_49']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : Other 3

  dataset$q5_1_50[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_50']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_50 = sjlabelled::set_labels(
                                                q5_1_50,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : Other 3'
                  ))

chokmah::clean_discrete(dataset[['q5_1_50']])





    ##########  Which of these temporary/ annual crops did you harvest within the last 12 months? : None

  dataset$q5_1_51[dataset$q5_0_1 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_1_51']])

dataset = dataset |>

  dplyr::mutate(
                q5_1_51 = sjlabelled::set_labels(
                                                q5_1_51,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these temporary/ annual crops did you harvest within the last 12 months? : None'
                  ))

chokmah::clean_discrete(dataset[['q5_1_51']])





    ##########  Specify other temporary crop 1

  dataset$q5_1a[dataset$q5_1_48 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q5_1a']])

dataset = dataset |>

  dplyr::mutate(
                q5_1a = q5_1a |>
                     sjlabelled::set_label(
                     label = 'Specify other temporary crop 1'
                  ))

chokmah::clean_discrete(dataset[['q5_1a']])





    ##########  Specify other temporary crop 2

  dataset$q5_1b[dataset$q5_1_49 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q5_1b']])

dataset = dataset |>

  dplyr::mutate(
                q5_1b = q5_1b |>
                     sjlabelled::set_label(
                     label = 'Specify other temporary crop 2'
                  ))

chokmah::clean_discrete(dataset[['q5_1b']])





    ##########  Specify other temporary crop 3

  dataset$q5_1c[dataset$q5_1_50 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q5_1c']])

dataset = dataset |>

  dplyr::mutate(
                q5_1c = q5_1c |>
                     sjlabelled::set_label(
                     label = 'Specify other temporary crop 3'
                  ))

chokmah::clean_discrete(dataset[['q5_1c']])





    ##########  Count of different temporary/annual crops planted within the last 12 months

  dataset$tcropsnum[dataset$q5_0_1 != 1] = -3

  dataset$tcropsnum[dataset$q5_1_51 == 1] = 0

chokmah::clean_continuous(dataset[['tcropsnum']])

dataset = dataset |>

  dplyr::mutate(
                tcropsnum = tcropsnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different temporary/annual crops planted within the last 12 months'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['tcropsnum']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Avocado

  dataset$q5_52_1[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_1']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_1 = sjlabelled::set_labels(
                                                q5_52_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Avocado'
                  ))

chokmah::clean_discrete(dataset[['q5_52_1']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Banana

  dataset$q5_52_2[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_2']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_2 = sjlabelled::set_labels(
                                                q5_52_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Banana'
                  ))

chokmah::clean_discrete(dataset[['q5_52_2']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Bilimbi

  dataset$q5_52_3[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_3']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_3 = sjlabelled::set_labels(
                                                q5_52_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Bilimbi'
                  ))

chokmah::clean_discrete(dataset[['q5_52_3']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Breadfruit

  dataset$q5_52_4[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_4']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_4 = sjlabelled::set_labels(
                                                q5_52_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Breadfruit'
                  ))

chokmah::clean_discrete(dataset[['q5_52_4']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Breadnut

  dataset$q5_52_5[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_5']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_5 = sjlabelled::set_labels(
                                                q5_52_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Breadnut'
                  ))

chokmah::clean_discrete(dataset[['q5_52_5']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Carambola

  dataset$q5_52_6[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_6']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_6 = sjlabelled::set_labels(
                                                q5_52_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Carambola'
                  ))

chokmah::clean_discrete(dataset[['q5_52_6']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Cashew

  dataset$q5_52_7[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_7']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_7 = sjlabelled::set_labels(
                                                q5_52_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Cashew'
                  ))

chokmah::clean_discrete(dataset[['q5_52_7']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Cherry

  dataset$q5_52_8[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_8']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_8 = sjlabelled::set_labels(
                                                q5_52_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Cherry'
                  ))

chokmah::clean_discrete(dataset[['q5_52_8']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Cocoa

  dataset$q5_52_9[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_9']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_9 = sjlabelled::set_labels(
                                                q5_52_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Cocoa'
                  ))

chokmah::clean_discrete(dataset[['q5_52_9']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Coconut

  dataset$q5_52_10[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_10']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_10 = sjlabelled::set_labels(
                                                q5_52_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Coconut'
                  ))

chokmah::clean_discrete(dataset[['q5_52_10']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Coffee

  dataset$q5_52_11[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_11']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_11 = sjlabelled::set_labels(
                                                q5_52_11,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Coffee'
                  ))

chokmah::clean_discrete(dataset[['q5_52_11']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Corilla

  dataset$q5_52_12[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_12']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_12 = sjlabelled::set_labels(
                                                q5_52_12,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Corilla'
                  ))

chokmah::clean_discrete(dataset[['q5_52_12']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Eddo

  dataset$q5_52_13[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_13']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_13 = sjlabelled::set_labels(
                                                q5_52_13,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Eddo'
                  ))

chokmah::clean_discrete(dataset[['q5_52_13']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Golden Apple

  dataset$q5_52_14[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_14']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_14 = sjlabelled::set_labels(
                                                q5_52_14,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Golden Apple'
                  ))

chokmah::clean_discrete(dataset[['q5_52_14']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Gooseberry

  dataset$q5_52_15[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_15']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_15 = sjlabelled::set_labels(
                                                q5_52_15,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Gooseberry'
                  ))

chokmah::clean_discrete(dataset[['q5_52_15']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Granadilla

  dataset$q5_52_16[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_16']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_16 = sjlabelled::set_labels(
                                                q5_52_16,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Granadilla'
                  ))

chokmah::clean_discrete(dataset[['q5_52_16']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Grapefruit

  dataset$q5_52_17[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_17']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_17 = sjlabelled::set_labels(
                                                q5_52_17,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Grapefruit'
                  ))

chokmah::clean_discrete(dataset[['q5_52_17']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Guava

  dataset$q5_52_18[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_18']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_18 = sjlabelled::set_labels(
                                                q5_52_18,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Guava'
                  ))

chokmah::clean_discrete(dataset[['q5_52_18']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Lemon

  dataset$q5_52_19[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_19']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_19 = sjlabelled::set_labels(
                                                q5_52_19,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Lemon'
                  ))

chokmah::clean_discrete(dataset[['q5_52_19']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Lime

  dataset$q5_52_20[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_20']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_20 = sjlabelled::set_labels(
                                                q5_52_20,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Lime'
                  ))

chokmah::clean_discrete(dataset[['q5_52_20']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Mamey

  dataset$q5_52_21[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_21']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_21 = sjlabelled::set_labels(
                                                q5_52_21,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Mamey'
                  ))

chokmah::clean_discrete(dataset[['q5_52_21']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Mango

  dataset$q5_52_22[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_22']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_22 = sjlabelled::set_labels(
                                                q5_52_22,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Mango'
                  ))

chokmah::clean_discrete(dataset[['q5_52_22']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Married man

  dataset$q5_52_23[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_23']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_23 = sjlabelled::set_labels(
                                                q5_52_23,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Married man'
                  ))

chokmah::clean_discrete(dataset[['q5_52_23']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Orange

  dataset$q5_52_24[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_24']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_24 = sjlabelled::set_labels(
                                                q5_52_24,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Orange'
                  ))

chokmah::clean_discrete(dataset[['q5_52_24']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Papaya / Papaw

  dataset$q5_52_25[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_25']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_25 = sjlabelled::set_labels(
                                                q5_52_25,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Papaya / Papaw'
                  ))

chokmah::clean_discrete(dataset[['q5_52_25']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Passion Fruit

  dataset$q5_52_26[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_26']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_26 = sjlabelled::set_labels(
                                                q5_52_26,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Passion Fruit'
                  ))

chokmah::clean_discrete(dataset[['q5_52_26']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Peach

  dataset$q5_52_27[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_27']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_27 = sjlabelled::set_labels(
                                                q5_52_27,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Peach'
                  ))

chokmah::clean_discrete(dataset[['q5_52_27']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Pear

  dataset$q5_52_28[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_28']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_28 = sjlabelled::set_labels(
                                                q5_52_28,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Pear'
                  ))

chokmah::clean_discrete(dataset[['q5_52_28']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Permanent Pasture

  dataset$q5_52_29[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_29']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_29 = sjlabelled::set_labels(
                                                q5_52_29,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Permanent Pasture'
                  ))

chokmah::clean_discrete(dataset[['q5_52_29']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Pigeon Peas

  dataset$q5_52_30[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_30']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_30 = sjlabelled::set_labels(
                                                q5_52_30,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Pigeon Peas'
                  ))

chokmah::clean_discrete(dataset[['q5_52_30']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Plantain

  dataset$q5_52_31[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_31']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_31 = sjlabelled::set_labels(
                                                q5_52_31,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Plantain'
                  ))

chokmah::clean_discrete(dataset[['q5_52_31']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Pomegranate

  dataset$q5_52_32[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_32']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_32 = sjlabelled::set_labels(
                                                q5_52_32,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Pomegranate'
                  ))

chokmah::clean_discrete(dataset[['q5_52_32']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Psydium

  dataset$q5_52_33[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_33']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_33 = sjlabelled::set_labels(
                                                q5_52_33,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Psydium'
                  ))

chokmah::clean_discrete(dataset[['q5_52_33']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Ramboutan

  dataset$q5_52_34[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_34']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_34 = sjlabelled::set_labels(
                                                q5_52_34,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Ramboutan'
                  ))

chokmah::clean_discrete(dataset[['q5_52_34']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Saeme

  dataset$q5_52_35[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_35']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_35 = sjlabelled::set_labels(
                                                q5_52_35,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Saeme'
                  ))

chokmah::clean_discrete(dataset[['q5_52_35']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Sapodilla

  dataset$q5_52_36[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_36']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_36 = sjlabelled::set_labels(
                                                q5_52_36,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Sapodilla'
                  ))

chokmah::clean_discrete(dataset[['q5_52_36']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Sorrel

  dataset$q5_52_37[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_37']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_37 = sjlabelled::set_labels(
                                                q5_52_37,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Sorrel'
                  ))

chokmah::clean_discrete(dataset[['q5_52_37']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Sour Sop

  dataset$q5_52_38[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_38']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_38 = sjlabelled::set_labels(
                                                q5_52_38,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Sour Sop'
                  ))

chokmah::clean_discrete(dataset[['q5_52_38']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Star Apple

  dataset$q5_52_39[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_39']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_39 = sjlabelled::set_labels(
                                                q5_52_39,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Star Apple'
                  ))

chokmah::clean_discrete(dataset[['q5_52_39']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Sugar Apple

  dataset$q5_52_40[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_40']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_40 = sjlabelled::set_labels(
                                                q5_52_40,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Sugar Apple'
                  ))

chokmah::clean_discrete(dataset[['q5_52_40']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Sugar Cane

  dataset$q5_52_41[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_41']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_41 = sjlabelled::set_labels(
                                                q5_52_41,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Sugar Cane'
                  ))

chokmah::clean_discrete(dataset[['q5_52_41']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Tangerine

  dataset$q5_52_42[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_42']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_42 = sjlabelled::set_labels(
                                                q5_52_42,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Tangerine'
                  ))

chokmah::clean_discrete(dataset[['q5_52_42']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Tumeric

  dataset$q5_52_43[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_43']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_43 = sjlabelled::set_labels(
                                                q5_52_43,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Tumeric'
                  ))

chokmah::clean_discrete(dataset[['q5_52_43']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Other 1

  dataset$q5_52_44[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_44']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_44 = sjlabelled::set_labels(
                                                q5_52_44,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Other 1'
                  ))

chokmah::clean_discrete(dataset[['q5_52_44']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Other 2

  dataset$q5_52_45[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_45']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_45 = sjlabelled::set_labels(
                                                q5_52_45,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Other 2'
                  ))

chokmah::clean_discrete(dataset[['q5_52_45']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : Other 3

  dataset$q5_52_46[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_46']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_46 = sjlabelled::set_labels(
                                                q5_52_46,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : Other 3'
                  ))

chokmah::clean_discrete(dataset[['q5_52_46']])





    ##########  Which of these permanent/perennial crops did you harvest within the last 12 months? : None

  dataset$q5_52_47[dataset$q5_0_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q5_52_47']])

dataset = dataset |>

  dplyr::mutate(
                q5_52_47 = sjlabelled::set_labels(
                                                q5_52_47,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which of these permanent/perennial crops did you harvest within the last 12 months? : None'
                  ))

chokmah::clean_discrete(dataset[['q5_52_47']])





    ##########  Specify other permanent crop 1

  dataset$q5_52a[dataset$q5_52_44 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q5_52a']])

dataset = dataset |>

  dplyr::mutate(
                q5_52a = q5_52a |>
                     sjlabelled::set_label(
                     label = 'Specify other permanent crop 1'
                  ))

chokmah::clean_discrete(dataset[['q5_52a']])





    ##########  Specify other permanent crop 2

  dataset$q5_52b[dataset$q5_52_45 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q5_52b']])

dataset = dataset |>

  dplyr::mutate(
                q5_52b = q5_52b |>
                     sjlabelled::set_label(
                     label = 'Specify other permanent crop 2'
                  ))

chokmah::clean_discrete(dataset[['q5_52b']])





    ##########  Specify other permanent crop 3

  dataset$q5_52c[dataset$q5_52_46 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q5_52c']])

dataset = dataset |>

  dplyr::mutate(
                q5_52c = q5_52c |>
                     sjlabelled::set_label(
                     label = 'Specify other permanent crop 3'
                  ))

chokmah::clean_discrete(dataset[['q5_52c']])





    ##########  Count of different permanent/perennial crops harvested within the last 12 months

  dataset$pcropnum[dataset$q5_0_2 != 1] = -3

  dataset$pcropnum[dataset$q5_52_47 == 1] = 0

chokmah::clean_continuous(dataset[['pcropnum']])

dataset = dataset |>

  dplyr::mutate(
                pcropnum = pcropnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different permanent/perennial crops harvested within the last 12 months'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['pcropnum']])





    ##########  Were you offered assistance for your agricultural production in the last year (July 2021-June 2022)?

  NA

  NA

chokmah::clean_discrete(dataset[['q6_0']])

dataset = dataset |>

  dplyr::mutate(
                q6_0 = sjlabelled::set_labels(
                                                q6_0,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Were you offered assistance for your agricultural production in the last year (July 2021-June 2022)?'
                  ))

chokmah::clean_discrete(dataset[['q6_0']])





    ##########  For which of the following activities did you receive assistance? : Crop Farming

  dataset$q6_1_1[dataset$q6_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_1_1']])

dataset = dataset |>

  dplyr::mutate(
                q6_1_1 = sjlabelled::set_labels(
                                                q6_1_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'For which of the following activities did you receive assistance? : Crop Farming'
                  ))

chokmah::clean_discrete(dataset[['q6_1_1']])





    ##########  For which of the following activities did you receive assistance? : Livestock production

  dataset$q6_1_2[dataset$q6_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_1_2']])

dataset = dataset |>

  dplyr::mutate(
                q6_1_2 = sjlabelled::set_labels(
                                                q6_1_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'For which of the following activities did you receive assistance? : Livestock production'
                  ))

chokmah::clean_discrete(dataset[['q6_1_2']])





    ##########  For which of the following activities did you receive assistance? : General farming techniques

  dataset$q6_1_3[dataset$q6_0 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_1_3']])

dataset = dataset |>

  dplyr::mutate(
                q6_1_3 = sjlabelled::set_labels(
                                                q6_1_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'For which of the following activities did you receive assistance? : General farming techniques'
                  ))

chokmah::clean_discrete(dataset[['q6_1_3']])





    ##########  What was the nature of the assistance for general farming or crops? : Rhinoceros beetle and red palm mite management and control

  dataset$q6_3_1[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_1']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_1 = sjlabelled::set_labels(
                                                q6_3_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Rhinoceros beetle and red palm mite management and control'
                  ))

chokmah::clean_discrete(dataset[['q6_3_1']])





    ##########  What was the nature of the assistance for general farming or crops? : Intercropping techniques

  dataset$q6_3_2[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_2']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_2 = sjlabelled::set_labels(
                                                q6_3_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Intercropping techniques'
                  ))

chokmah::clean_discrete(dataset[['q6_3_2']])





    ##########  What was the nature of the assistance for general farming or crops? : Silage making

  dataset$q6_3_3[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_3']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_3 = sjlabelled::set_labels(
                                                q6_3_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Silage making'
                  ))

chokmah::clean_discrete(dataset[['q6_3_3']])





    ##########  What was the nature of the assistance for general farming or crops? : Composting and vermicompost

  dataset$q6_3_4[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_4']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_4 = sjlabelled::set_labels(
                                                q6_3_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Composting and vermicompost'
                  ))

chokmah::clean_discrete(dataset[['q6_3_4']])





    ##########  What was the nature of the assistance for general farming or crops? : Mulching

  dataset$q6_3_5[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_5']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_5 = sjlabelled::set_labels(
                                                q6_3_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Mulching'
                  ))

chokmah::clean_discrete(dataset[['q6_3_5']])





    ##########  What was the nature of the assistance for general farming or crops? : Vegetative plant propagation

  dataset$q6_3_6[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_6']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_6 = sjlabelled::set_labels(
                                                q6_3_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Vegetative plant propagation'
                  ))

chokmah::clean_discrete(dataset[['q6_3_6']])





    ##########  What was the nature of the assistance for general farming or crops? : Soil conservation works

  dataset$q6_3_7[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_7']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_7 = sjlabelled::set_labels(
                                                q6_3_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Soil conservation works'
                  ))

chokmah::clean_discrete(dataset[['q6_3_7']])





    ##########  What was the nature of the assistance for general farming or crops? : Water harvesting

  dataset$q6_3_8[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_8']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_8 = sjlabelled::set_labels(
                                                q6_3_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Water harvesting'
                  ))

chokmah::clean_discrete(dataset[['q6_3_8']])





    ##########  What was the nature of the assistance for general farming or crops? : Post harvesting management

  dataset$q6_3_9[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_9']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_9 = sjlabelled::set_labels(
                                                q6_3_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Post harvesting management'
                  ))

chokmah::clean_discrete(dataset[['q6_3_9']])





    ##########  What was the nature of the assistance for general farming or crops? : Post-harvest pest and disease

  dataset$q6_3_10[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_10']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_10 = sjlabelled::set_labels(
                                                q6_3_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Post-harvest pest and disease'
                  ))

chokmah::clean_discrete(dataset[['q6_3_10']])





    ##########  What was the nature of the assistance for general farming or crops? : Climate-smart and protective agricultural techniques

  dataset$q6_3_11[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_11']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_11 = sjlabelled::set_labels(
                                                q6_3_11,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Climate-smart and protective agricultural techniques'
                  ))

chokmah::clean_discrete(dataset[['q6_3_11']])





    ##########  What was the nature of the assistance for general farming or crops? : Soil sampling techniques

  dataset$q6_3_12[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_12']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_12 = sjlabelled::set_labels(
                                                q6_3_12,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Soil sampling techniques'
                  ))

chokmah::clean_discrete(dataset[['q6_3_12']])





    ##########  What was the nature of the assistance for general farming or crops? : Coverage crops

  dataset$q6_3_13[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_13']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_13 = sjlabelled::set_labels(
                                                q6_3_13,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Coverage crops'
                  ))

chokmah::clean_discrete(dataset[['q6_3_13']])





    ##########  What was the nature of the assistance for general farming or crops? : Pest and disease control and management

  dataset$q6_3_14[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_14']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_14 = sjlabelled::set_labels(
                                                q6_3_14,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Pest and disease control and management'
                  ))

chokmah::clean_discrete(dataset[['q6_3_14']])





    ##########  What was the nature of the assistance for general farming or crops? : Farm certification and biosecurity

  dataset$q6_3_15[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_15']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_15 = sjlabelled::set_labels(
                                                q6_3_15,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Farm certification and biosecurity'
                  ))

chokmah::clean_discrete(dataset[['q6_3_15']])





    ##########  What was the nature of the assistance for general farming or crops? : Agro-processing

  dataset$q6_3_16[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_16']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_16 = sjlabelled::set_labels(
                                                q6_3_16,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Agro-processing'
                  ))

chokmah::clean_discrete(dataset[['q6_3_16']])





    ##########  What was the nature of the assistance for general farming or crops? : Basic calibration, estimates, and calculations for fertilizers, chemicals, and other farm needs

  dataset$q6_3_17[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_17']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_17 = sjlabelled::set_labels(
                                                q6_3_17,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Basic calibration, estimates, and calculations for fertilizers, chemicals, and other farm needs'
                  ))

chokmah::clean_discrete(dataset[['q6_3_17']])





    ##########  What was the nature of the assistance for general farming or crops? : Agronomic practices

  dataset$q6_3_18[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_18']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_18 = sjlabelled::set_labels(
                                                q6_3_18,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Agronomic practices'
                  ))

chokmah::clean_discrete(dataset[['q6_3_18']])





    ##########  What was the nature of the assistance for general farming or crops? : Farm sanitation

  dataset$q6_3_19[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_19']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_19 = sjlabelled::set_labels(
                                                q6_3_19,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Farm sanitation'
                  ))

chokmah::clean_discrete(dataset[['q6_3_19']])





    ##########  What was the nature of the assistance for general farming or crops? : Record keeping

  dataset$q6_3_20[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_20']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_20 = sjlabelled::set_labels(
                                                q6_3_20,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Record keeping'
                  ))

chokmah::clean_discrete(dataset[['q6_3_20']])





    ##########  What was the nature of the assistance for general farming or crops? : Introduction of new technologies

  dataset$q6_3_21[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_21']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_21 = sjlabelled::set_labels(
                                                q6_3_21,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Introduction of new technologies'
                  ))

chokmah::clean_discrete(dataset[['q6_3_21']])





    ##########  What was the nature of the assistance for general farming or crops? : Cost of production

  dataset$q6_3_22[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_22']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_22 = sjlabelled::set_labels(
                                                q6_3_22,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Cost of production'
                  ))

chokmah::clean_discrete(dataset[['q6_3_22']])





    ##########  What was the nature of the assistance for general farming or crops? : Other

  dataset$q6_3_23[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_3_23']])

dataset = dataset |>

  dplyr::mutate(
                q6_3_23 = sjlabelled::set_labels(
                                                q6_3_23,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for general farming or crops? : Other'
                  ))

chokmah::clean_discrete(dataset[['q6_3_23']])





    ##########  Specify other assistance

  dataset$q6_3a[dataset$q6_3_23 != 1] = 'Not Applicable'


  dataset$q6_3a[stringr::str_detect(tolower(dataset$q6_3a),"cash|grant")] = "Cash/Cash Grant"
  dataset$q6_3a[stringr::str_detect(tolower(dataset$q6_3a),"fert|manure")] = "Provide fertilizer/manure"
  dataset$q6_3a[stringr::str_detect(tolower(dataset$q6_3a),"lost")] = "Not Applicable"
  dataset$q6_3a[stringr::str_detect(tolower(dataset$q6_3a),"rice")] = "Not Applicable"


chokmah::clean_discrete(dataset[['q6_3a']])

dataset = dataset |>

  dplyr::mutate(
                q6_3a = q6_3a |>
                     sjlabelled::set_label(
                     label = 'Specify other assistance'
                  ))

chokmah::clean_discrete(dataset[['q6_3a']])





    ##########  Count of different kinds of assistance for general farming or crops

  dataset$asstnum[dataset$q6_1_1 != 1 & dataset$q6_1_3 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['asstnum']])

dataset = dataset |>

  dplyr::mutate(
                asstnum = asstnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different kinds of assistance for general farming or crops'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['asstnum']])





    ##########  What was the nature of the assistance for livestock? : Artificial insemination

  dataset$q6_17_1[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_1']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_1 = sjlabelled::set_labels(
                                                q6_17_1,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Artificial insemination'
                  ))

chokmah::clean_discrete(dataset[['q6_17_1']])





    ##########  What was the nature of the assistance for livestock? : Deworming

  dataset$q6_17_2[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_2']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_2 = sjlabelled::set_labels(
                                                q6_17_2,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Deworming'
                  ))

chokmah::clean_discrete(dataset[['q6_17_2']])





    ##########  What was the nature of the assistance for livestock? : Vaccination

  dataset$q6_17_3[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_3']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_3 = sjlabelled::set_labels(
                                                q6_17_3,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Vaccination'
                  ))

chokmah::clean_discrete(dataset[['q6_17_3']])





    ##########  What was the nature of the assistance for livestock? : Brood and brooding

  dataset$q6_17_4[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_4']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_4 = sjlabelled::set_labels(
                                                q6_17_4,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Brood and brooding'
                  ))

chokmah::clean_discrete(dataset[['q6_17_4']])





    ##########  What was the nature of the assistance for livestock? : Supplemental feeding

  dataset$q6_17_5[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_5']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_5 = sjlabelled::set_labels(
                                                q6_17_5,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Supplemental feeding'
                  ))

chokmah::clean_discrete(dataset[['q6_17_5']])





    ##########  What was the nature of the assistance for livestock? : Vampire bat control and management

  dataset$q6_17_6[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_6']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_6 = sjlabelled::set_labels(
                                                q6_17_6,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Vampire bat control and management'
                  ))

chokmah::clean_discrete(dataset[['q6_17_6']])





    ##########  What was the nature of the assistance for livestock? : Branding

  dataset$q6_17_7[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_7']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_7 = sjlabelled::set_labels(
                                                q6_17_7,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Branding'
                  ))

chokmah::clean_discrete(dataset[['q6_17_7']])





    ##########  What was the nature of the assistance for livestock? : Pest and disease control and management

  dataset$q6_17_8[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_8']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_8 = sjlabelled::set_labels(
                                                q6_17_8,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Pest and disease control and management'
                  ))

chokmah::clean_discrete(dataset[['q6_17_8']])





    ##########  What was the nature of the assistance for livestock? : Farm certification and biosecurity

  dataset$q6_17_9[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_9']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_9 = sjlabelled::set_labels(
                                                q6_17_9,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Farm certification and biosecurity'
                  ))

chokmah::clean_discrete(dataset[['q6_17_9']])





    ##########  What was the nature of the assistance for livestock? : Agro-processing

  dataset$q6_17_10[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_10']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_10 = sjlabelled::set_labels(
                                                q6_17_10,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Agro-processing'
                  ))

chokmah::clean_discrete(dataset[['q6_17_10']])





    ##########  What was the nature of the assistance for livestock? : Basic calibration, estimates, and calculations for fertilizers, chemicals, and other farm needs

  dataset$q6_17_11[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_11']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_11 = sjlabelled::set_labels(
                                                q6_17_11,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Basic calibration, estimates, and calculations for fertilizers, chemicals, and other farm needs'
                  ))

chokmah::clean_discrete(dataset[['q6_17_11']])





    ##########  What was the nature of the assistance for livestock? : Agronomic practices

  dataset$q6_17_12[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_12']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_12 = sjlabelled::set_labels(
                                                q6_17_12,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Agronomic practices'
                  ))

chokmah::clean_discrete(dataset[['q6_17_12']])





    ##########  What was the nature of the assistance for livestock? : Farm sanitation

  dataset$q6_17_13[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_13']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_13 = sjlabelled::set_labels(
                                                q6_17_13,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Farm sanitation'
                  ))

chokmah::clean_discrete(dataset[['q6_17_13']])





    ##########  What was the nature of the assistance for livestock? : Record keeping

  dataset$q6_17_14[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_14']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_14 = sjlabelled::set_labels(
                                                q6_17_14,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Record keeping'
                  ))

chokmah::clean_discrete(dataset[['q6_17_14']])





    ##########  What was the nature of the assistance for livestock? : Introduction of new technologies

  dataset$q6_17_15[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_15']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_15 = sjlabelled::set_labels(
                                                q6_17_15,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Introduction of new technologies'
                  ))

chokmah::clean_discrete(dataset[['q6_17_15']])





    ##########  What was the nature of the assistance for livestock? : Cost of production

  dataset$q6_17_16[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_16']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_16 = sjlabelled::set_labels(
                                                q6_17_16,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Cost of production'
                  ))

chokmah::clean_discrete(dataset[['q6_17_16']])





    ##########  What was the nature of the assistance for livestock? : Other

  dataset$q6_17_17[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q6_17_17']])

dataset = dataset |>

  dplyr::mutate(
                q6_17_17 = sjlabelled::set_labels(
                                                q6_17_17,
                                                labels =
                                                ynna
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'What was the nature of the assistance for livestock? : Other'
                  ))

chokmah::clean_discrete(dataset[['q6_17_17']])





    ##########  Specify other assistance for livestock

  dataset$q6_17a[dataset$q6_17_17 != 1] = 'Not Applicable'


  dataset$q6_17a[stringr::str_detect(tolower(dataset$q6_17a),"loss")] = "Not Applicable"
  dataset$q6_17a[stringr::str_detect(tolower(dataset$q6_17a),"spoi")] = "Not Applicable"


chokmah::clean_discrete(dataset[['q6_17a']])

dataset = dataset |>

  dplyr::mutate(
                q6_17a = q6_17a |>
                     sjlabelled::set_label(
                     label = 'Specify other assistance for livestock'
                  ))

chokmah::clean_discrete(dataset[['q6_17a']])





    ##########  Count of different kinds of assistance for livestock

  dataset$animasstnum[dataset$q6_1_2 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['animasstnum']])

dataset = dataset |>

  dplyr::mutate(
                animasstnum = animasstnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Count of different kinds of assistance for livestock'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['animasstnum']])





    ##########  In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : Crop Farming

  NA

  NA

chokmah::clean_discrete(dataset[['q7_0_1']])

dataset = dataset |>

  dplyr::mutate(
                q7_0_1 = sjlabelled::set_labels(
                                                q7_0_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : Crop Farming'
                  ))

chokmah::clean_discrete(dataset[['q7_0_1']])





    ##########  In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : Livestock Production

  NA

  NA

chokmah::clean_discrete(dataset[['q7_0_2']])

dataset = dataset |>

  dplyr::mutate(
                q7_0_2 = sjlabelled::set_labels(
                                                q7_0_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : Livestock Production'
                  ))

chokmah::clean_discrete(dataset[['q7_0_2']])





    ##########  In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : Aquaculture Production

  NA

  NA

chokmah::clean_discrete(dataset[['q7_0_3']])

dataset = dataset |>

  dplyr::mutate(
                q7_0_3 = sjlabelled::set_labels(
                                                q7_0_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : Aquaculture Production'
                  ))

chokmah::clean_discrete(dataset[['q7_0_3']])





    ##########  In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : None

  NA

  NA

chokmah::clean_discrete(dataset[['q7_0_4']])

dataset = dataset |>

  dplyr::mutate(
                q7_0_4 = sjlabelled::set_labels(
                                                q7_0_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'In which of the following activities were (any) household members involved in the last year (July 2021 - June 2022)? : None'
                  ))

chokmah::clean_discrete(dataset[['q7_0_4']])





    ##########  Did you have help from other members of the community (unpaid) or from hired labour for your farm production? : Community members

  NA

  NA

chokmah::clean_discrete(dataset[['q7_24_1']])

dataset = dataset |>

  dplyr::mutate(
                q7_24_1 = sjlabelled::set_labels(
                                                q7_24_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you have help from other members of the community (unpaid) or from hired labour for your farm production? : Community members'
                  ))

chokmah::clean_discrete(dataset[['q7_24_1']])





    ##########  Did you have help from other members of the community (unpaid) or from hired labour for your farm production? : Hired contractors

  NA

  NA

chokmah::clean_discrete(dataset[['q7_24_2']])

dataset = dataset |>

  dplyr::mutate(
                q7_24_2 = sjlabelled::set_labels(
                                                q7_24_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you have help from other members of the community (unpaid) or from hired labour for your farm production? : Hired contractors'
                  ))

chokmah::clean_discrete(dataset[['q7_24_2']])





    ##########  Did you have help from other members of the community (unpaid) or from hired labour for your farm production? : No one

  NA

  NA

chokmah::clean_discrete(dataset[['q7_24_3']])

dataset = dataset |>

  dplyr::mutate(
                q7_24_3 = sjlabelled::set_labels(
                                                q7_24_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you have help from other members of the community (unpaid) or from hired labour for your farm production? : No one'
                  ))

chokmah::clean_discrete(dataset[['q7_24_3']])





    ##########  Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : Crop Farming

  dataset$q7_25_1[dataset$q7_24_1 != 1 & dataset$q7_24_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q7_25_1']])

dataset = dataset |>

  dplyr::mutate(
                q7_25_1 = sjlabelled::set_labels(
                                                q7_25_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : Crop Farming'
                  ))

chokmah::clean_discrete(dataset[['q7_25_1']])





    ##########  Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : Livestock Production

  dataset$q7_25_2[dataset$q7_24_1 != 1 & dataset$q7_24_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q7_25_2']])

dataset = dataset |>

  dplyr::mutate(
                q7_25_2 = sjlabelled::set_labels(
                                                q7_25_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : Livestock Production'
                  ))

chokmah::clean_discrete(dataset[['q7_25_2']])





    ##########  Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : Aquaculture Production

  dataset$q7_25_3[dataset$q7_24_1 != 1 & dataset$q7_24_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q7_25_3']])

dataset = dataset |>

  dplyr::mutate(
                q7_25_3 = sjlabelled::set_labels(
                                                q7_25_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : Aquaculture Production'
                  ))

chokmah::clean_discrete(dataset[['q7_25_3']])





    ##########  Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : None

  dataset$q7_25_4[dataset$q7_24_1 != 1 & dataset$q7_24_2 != 1] = -3

  NA

chokmah::clean_discrete(dataset[['q7_25_4']])

dataset = dataset |>

  dplyr::mutate(
                q7_25_4 = sjlabelled::set_labels(
                                                q7_25_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Which activities did other community members or hired workers help you with in the last year (July 2021- June 2022)? : None'
                  ))

chokmah::clean_discrete(dataset[['q7_25_4']])





    ##########  Counts of different kinds of activities that community members or hired workers helped with in the last year (July 2021-June 2022)

  dataset$helpnum[dataset$q7_24_1 != 1 & dataset$q7_24_2 != 1] = -3

  dataset$helpnum[dataset$q7_25_4 == 1] = 0

chokmah::clean_continuous(dataset[['helpnum']])

dataset = dataset |>

  dplyr::mutate(
                helpnum = helpnum |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'Counts of different kinds of activities that community members or hired workers helped with in the last year (July 2021-June 2022)'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['helpnum']])





    ##########  How much was the daily wage that you paid labourers?

  dataset$q7_46[dataset$q7_24_2 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q7_46']])

dataset = dataset |>

  dplyr::mutate(
                q7_46 = q7_46 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'How much was the daily wage that you paid labourers?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q7_46']])





    ##########  How many labourers did you hire within the last year?

  dataset$q7_47[dataset$q7_24_2 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q7_47']])

dataset = dataset |>

  dplyr::mutate(
                q7_47 = q7_47 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'How many labourers did you hire within the last year?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = dkna
                     )
                  )

chokmah::clean_continuous(dataset[['q7_47']])





    ##########  Did you or another member of your household obtain a loan or credit in the last year (July 2021-June 2022)?

  NA

  NA

chokmah::clean_discrete(dataset[['q7_57']])

dataset = dataset |>

  dplyr::mutate(
                q7_57 = sjlabelled::set_labels(
                                                q7_57,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Did you or another member of your household obtain a loan or credit in the last year (July 2021-June 2022)?'
                  ))

chokmah::clean_discrete(dataset[['q7_57']])





    ##########  How many loans/credits did you obtain in the last year?

  dataset$q7_58[dataset$q7_57 != 1] = -3

  NA

chokmah::clean_continuous(dataset[['q7_58']])

dataset = dataset |>

  dplyr::mutate(
                q7_58 = q7_58 |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = 'How many loans/credits did you obtain in the last year?'
                     ) |>
                     sjlabelled::set_labels(
                     labels = na
                     )
                  )

chokmah::clean_continuous(dataset[['q7_58']])





    ##########  Why did you not obtain a loan or credit? : No need

  dataset$q7_63_1[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_1']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_1 = sjlabelled::set_labels(
                                                q7_63_1,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : No need'
                  ))

chokmah::clean_discrete(dataset[['q7_63_1']])





    ##########  Why did you not obtain a loan or credit? : Lack of guarantees / collateral

  dataset$q7_63_2[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_2']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_2 = sjlabelled::set_labels(
                                                q7_63_2,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Lack of guarantees / collateral'
                  ))

chokmah::clean_discrete(dataset[['q7_63_2']])





    ##########  Why did you not obtain a loan or credit? : Did not want to provide collateral

  dataset$q7_63_3[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_3']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_3 = sjlabelled::set_labels(
                                                q7_63_3,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Did not want to provide collateral'
                  ))

chokmah::clean_discrete(dataset[['q7_63_3']])





    ##########  Why did you not obtain a loan or credit? : Risky debt

  dataset$q7_63_4[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_4']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_4 = sjlabelled::set_labels(
                                                q7_63_4,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Risky debt'
                  ))

chokmah::clean_discrete(dataset[['q7_63_4']])





    ##########  Why did you not obtain a loan or credit? : Problems with previous debts

  dataset$q7_63_5[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_5']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_5 = sjlabelled::set_labels(
                                                q7_63_5,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Problems with previous debts'
                  ))

chokmah::clean_discrete(dataset[['q7_63_5']])





    ##########  Why did you not obtain a loan or credit? : Land cannot serve as collateral

  dataset$q7_63_6[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_6']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_6 = sjlabelled::set_labels(
                                                q7_63_6,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Land cannot serve as collateral'
                  ))

chokmah::clean_discrete(dataset[['q7_63_6']])





    ##########  Why did you not obtain a loan or credit? : Very expensive

  dataset$q7_63_7[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_7']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_7 = sjlabelled::set_labels(
                                                q7_63_7,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Very expensive'
                  ))

chokmah::clean_discrete(dataset[['q7_63_7']])





    ##########  Why did you not obtain a loan or credit? : No institutions available

  dataset$q7_63_8[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_8']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_8 = sjlabelled::set_labels(
                                                q7_63_8,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : No institutions available'
                  ))

chokmah::clean_discrete(dataset[['q7_63_8']])





    ##########  Why did you not obtain a loan or credit? : No credit available

  dataset$q7_63_9[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_9']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_9 = sjlabelled::set_labels(
                                                q7_63_9,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : No credit available'
                  ))

chokmah::clean_discrete(dataset[['q7_63_9']])





    ##########  Why did you not obtain a loan or credit? : Lack of experience

  dataset$q7_63_10[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_10']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_10 = sjlabelled::set_labels(
                                                q7_63_10,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Lack of experience'
                  ))

chokmah::clean_discrete(dataset[['q7_63_10']])





    ##########  Why did you not obtain a loan or credit? : Lack of information

  dataset$q7_63_11[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_11']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_11 = sjlabelled::set_labels(
                                                q7_63_11,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Lack of information'
                  ))

chokmah::clean_discrete(dataset[['q7_63_11']])





    ##########  Why did you not obtain a loan or credit? : Other

  dataset$q7_63_12[dataset$q7_57 != 0] = -3

  NA

chokmah::clean_discrete(dataset[['q7_63_12']])

dataset = dataset |>

  dplyr::mutate(
                q7_63_12 = sjlabelled::set_labels(
                                                q7_63_12,
                                                labels =
                                                yn
                                                  ) |>
                  sjlabelled::set_label(
                     label = 'Why did you not obtain a loan or credit? : Other'
                  ))

chokmah::clean_discrete(dataset[['q7_63_12']])





    ##########  Specify other reason for not obtaining a loan

  dataset$q7_63a[dataset$q7_63_12 != 1] = 'Not Applicable'

  NA

chokmah::clean_discrete(dataset[['q7_63a']])

dataset = dataset |>

  dplyr::mutate(
                q7_63a = q7_63a |>
                     sjlabelled::set_label(
                     label = 'Specify other reason for not obtaining a loan'
                  ))

chokmah::clean_discrete(dataset[['q7_63a']])





    dataset = dataset |>
  dplyr::mutate(
    dplyr::across(
      .cols = meta_data |> dplyr::filter(value_label == 'empty') |> dplyr::pull(var_name),
      .fns = ~ sjlabelled::remove_labels(.x,labels = 'NA')
    )
  )

    saveRDS(
    dataset,
    'clean_main_data/cleaned_datafiles/dataset.rds'
    )


