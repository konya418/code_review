population_plot <- function(p.values, compare = F) {
  fp <- round((sum(p.values < .05)/length(p.values)), 3) * 100
  p <-
    tibble(p = p.values,
           error = ifelse(p < .05, 'false positive', 'true negative')) %>%
    ggplot(aes(p)) +
    geom_histogram(breaks = seq(0, 1, .05),
                   aes(fill = error),
                   color = 'black') +
    scale_x_continuous(
      breaks = seq(0, 1, .05),
      limits = c(-.01, 1.01),
      expand = expansion()
    ) +
    geom_vline(
      xintercept = .05,
      color = 1,
      linetype = 2,
      size = 1
    ) +
    labs(
      x = 'P values',
      title = paste(paste0(fp, '%'), 'of studies are false positives'),
      fill = element_blank()
    ) +
    scale_fill_manual(values = c(2, 4)) +
    theme_classic() +
    theme(legend.position = 'top')


  if(isTRUE(compare)){
    p.ref <-
      unlist(mclapply(1:length(p.values), function(i) {
        dgp(n = n)
      }, mc.cores = detectCores()))
    
    fp.comp <- round((sum(p.ref < .05)/length(p.ref))* 100, 0)
    p2 <-
      tibble(p = p.ref,
             error = ifelse(p < .05, 'false positive', 'true negative')) %>%
      ggplot(aes(p)) +
      geom_histogram(breaks = seq(0, 1, .05),
                     fill = error,
                     color = 'black') +
      scale_x_continuous(
        breaks = seq(0, 1, .05),
        limits = c(-.01, 1.01),
        expand = expansion()
      ) +
      geom_vline(
        xintercept = .05,
        color = 1,
        linetype = 2,
        size = 1
      ) +
      labs(
        x = 'P values',
        title = "Comparision with no p-hacking",
        subtitle = paste(paste0(fp.comp, '%'), 'of studies are false positives'),
        fill = element_blank()
      ) +
      scale_fill_manual(values = c(2, 4)) +
      coord_cartesian(ylim = layer_scales(p)$y$range$range) + 
      theme_classic() +
      theme(legend.position = 'top')
    p <- p + p2
  }
  
  return(p)
  
}
