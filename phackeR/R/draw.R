#COMMENT: all scripts should generally start off with a comment describing the purpose, author(s), and any additional notes regarding structure/libraries

#In this situation, the purpose of this script draw data for the simulations
#Dependency scripts should be noted to ensure comprehensive understanding of all the sources for created functions

draw <- function(sims){
  mclapply(1:sims, function(i) {
  dgp( #COMMENT: this function was created in dgp_phack.R. A comment on the dependency should be included in the beginning of this script. 
    n = input$n,
    rho = input$rho,
    n.dependent = input$n.dependent,
    type = 'A'
  )
}, mc.cores = detectCores())
  
}
