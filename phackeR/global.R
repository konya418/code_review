library(shiny)
library(parallel)
library(tidyverse)
library(shinyWidgets)
library(markdown)

# load all functions
map(list.files('R', recursive = TRUE), function(file) source(file.path('R', file)))



