library(shiny)
library(shinyjs)
library(DT)
library(shinydashboard)
library(sodium)
library(rhandsontable)
library(data.table)
library(formattable)
library(shinyWidgets)
#library(g3viz)
#library(rtracklayer)
#library(trackViewer)
library(tidyverse)
library(stringi)
library(stringr)
#library(karyoploteR)
#library(BiocManager)

#options(repos = BiocManager::repositories())

banking.df<-data %>% select(Gene, Chrom,Start,End,Impact,Ref,Alt,AA,Clinvar.Disease,Num.Times.in.Database)
d1 = banking.df
d1$Date = Sys.time() + seq_len(nrow(d1))

