#COMMENT: all scripts should generally start off with a comment describing the purpose, author(s), and any additional notes regarding structure/libraries

#COMMENT: libraries used were not included in the beginning. Include GGPLOT2 library since it is being heavily utilized in this script

place_holder <- function(){
  ggplot(x = seq(0, 1, .1), y = seq(0, 1, .1)) + 
    geom_vline(xintercept = .05, linetype = 'dashed') + 
    scale_x_continuous(breaks=seq(0,1,.05), limits = c(-.01, 1.01), expand = expansion()) + #The expansion function comes from ggplot2- the library should be noted  
    scale_y_continuous(labels = NULL, breaks = NULL) + 
    labs(y = "", x = 'P value', 
         title = 'Collect Data to See Results!') + 
    theme_classic() + 
    theme(axis.line.y=element_blank(),
          axis.text.y=element_blank(),
          axis.title.y=element_blank(),
          axis.ticks.y=element_blank())
    
}
