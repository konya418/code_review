draw <- function(sims){
  mclapply(1:sims, function(i) {
  dgp(
    n = input$n,
    rho = input$rho,
    n.dependent = input$n.dependent,
    type = 'A'
  )
}, mc.cores = detectCores())
  
}