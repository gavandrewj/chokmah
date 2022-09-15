snippet clean_cat
########## 	${1:variable_info}
chokmah::clean_discrete(${2:dataset}[["${3:var}"]])

${2:dataset} = ${2:dataset} |> 
  dplyr::mutate(
    ${3:var} = dplyr::recode(
      ${3:var},
      !!!${4:value_label}
    )) |> 
  
  dplyr::mutate(	
    ${3:var} = sjlabelled::set_labels(
      ${3:var},
      labels = 
        ${4:value_label}
    )) 

chokmah::clean_discrete(${2:dataset}[["${3:var}"]])


snippet clean_group_cat
########## 	${1:variable_info}

${2:dataset} = ${2:dataset} |> 
  
  mutate(
    
    across(
      .cols = ${3:vars},
      .fns = ~ dplyr::recode(
        .x,
        !!!${4:value_labels}
      ))) |> 
  
  mutate(
    
    across(
      .cols = ${3:vars},
      .fns = ~ sjlabelled::set_labels(
        .x,
        labels = ${4:value_labels}
        
      )))



snippet clean_con
########## 	${1:variable_info}
chokmah::clean_continuous(${2:dataset}[["${3:var}"]])

dataset = dataset |> 
  
  dplyr::mutate(
    ${3:var} = ${3:var} |> 
      
      as.numeric() 
  )

chokmah::clean_continuous(${2:dataset}[["${3:var}"]])