individual_plot <- function(p.value){
  if (p.value < .05) {
    result <- 2
    interpretation <- 'false positive!'
  } else{
    result <- 3
    interpretation <- 'true negative.'
  }
  
  p <- ggplot(x = seq(0, 1, .1), y = seq(0, 1, .1)) + 
    geom_vline(xintercept = p.value, color = result) + 
    geom_vline(xintercept = .05, linetype = 'dashed') + 
    scale_x_continuous(breaks=seq(0,1,.05), limits = c(-.01, 1.01), expand = expansion()) + 
    scale_y_continuous(labels = NULL, breaks = NULL) + 
    labs(y = "", x = 'P value', 
         title = paste('p value = ', round(p.value, 4), 'this is a', interpretation)) + 
    theme_classic() + 
    theme(axis.line.y=element_blank(),
          axis.text.y=element_blank(),
          axis.title.y=element_blank(),
          axis.ticks.y=element_blank(), 
          plot.title = element_text(color = result, size = 18))
  
  return(p)
}

