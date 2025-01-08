rm(list=ls())
options(dplyr.show_progress = F)
options(dplyr.summarise.inform = FALSE)
options(message=FALSE, warning=FALSE)

library(read.dbc)
library(tidyverse)
`%notin%` = Negate(`%in%`)


arq_rda <- str_remove(toupper(list.files('../../Dados Públicos/SIASUS_PS/rda/')), '.RDA')
arq_dbc <- str_remove(toupper(list.files('../../Dados Públicos/SIASUS_PS/fonte/')), '.DBC')
nomes_arquivos <- arq_dbc[arq_dbc %notin% arq_rda]

indices <- which(toupper(list.files('../../Dados Públicos/SIASUS_PS/fonte/')) %in% paste0(nomes_arquivos, '.DBC'))
arquivos <- list.files('../../Dados Públicos/SIASUS_PS/fonte/', full.names = T)[indices]

for(arq in arquivos){
  nome = paste0('../../Dados Públicos/SIASUS_PS/rda/',str_extract(arq, 'PS[A-Z]{2}[0-9]{4}'), '.RDA')
  print((nome))

  temp <- read.dbc(arq)
  save(temp, file = nome)
  
}
