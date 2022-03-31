#COMMENT: all scripts should generally start off with a comment describing the purpose, author(s)
library(shiny)
library(parallel)
library(tidyverse)
library(shinyWidgets)
library(markdown)

# load all functions
map(list.files('R', recursive = TRUE), function(file) source(file.path('R', file)))



