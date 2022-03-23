place_holder <- function(){
  ggplot(x = seq(0, 1, .1), y = seq(0, 1, .1)) + 
    geom_vline(xintercept = .05, linetype = 'dashed') + 
    scale_x_continuous(breaks=seq(0,1,.05), limits = c(-.01, 1.01), expand = expansion()) + 
    scale_y_continuous(labels = NULL, breaks = NULL) + 
    labs(y = "", x = 'P value', 
         title = 'Collect Data to See Results!') + 
    theme_classic() + 
    theme(axis.line.y=element_blank(),
          axis.text.y=element_blank(),
          axis.title.y=element_blank(),
          axis.ticks.y=element_blank())
    
}
