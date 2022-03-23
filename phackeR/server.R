# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  store <- reactiveValues()
  
  observeEvent(input$sim0, {
    if(input$population0 == 'TRUE'){
      progressSweetAlert(
        id = "sim0.1_load",
        title = paste("Collecting Data"),
        value = 0,
        total = input$n.sims
      )
      store$draw_sim0.1 <- lapply(1:input$n.sims0, function(i) {
        draw <- dgp(
          n = input$n0,
        )
        
        
        updateProgressBar(id = "sim0.1_load",
                          value = i,
                          total = input$n.sims)# / (input$n.sims/100))
        
        return(draw)
        
      })
      closeSweetAlert()
    } else{
      store$draw_sim0.2 <- dgp(
        n = input$n0,

      )
    }
    
  })
  
  output$p1 <- renderPlot({
    if (length(store$draw_sim0.2) != 0 & input$population0 == 'FALSE') {
      p <- individual_plot(unlist(store$draw_sim0.2))
    } else if (length(store$draw_sim0.1) != 0 &input$population0 == 'TRUE') {
      p <- population_plot(unlist(store$draw_sim0.1))
    } else{
      p <- place_holder()
    }
    
    return(p)
  })

    #observeEvent(input$sim1.1, {browser()})
    observeEvent(input$sim1.1, {
      if (input$population1 == 'TRUE') {
        progressSweetAlert(
          id = "sim1.1_load",
          title = paste("Collecting Data"),
          value = 0,
          total = input$n.sims
        )
        store$draw_sim1.1 <- lapply(1:input$n.sims, function(i) {
          draw <- dgp(
            n = input$n,
            rho = input$rho,
            n.dependent = input$n.dependent,
            type = 'A'
          )
          
          
          updateProgressBar(id = "sim1.1_load",
                            value = i,
                            total = input$n.sims)# / (input$n.sims/100))
          
          return(draw)
          
        })
        closeSweetAlert()
      } else{
        store$draw_sim1.2 <- dgp(
          n = input$n,
          rho = input$rho,
          n.dependent = input$n.dependent,
          type = 'A'
        )
      }
      
    })
    
    output$p2 <- renderPlot({
      if (length(store$draw_sim1.2) != 0 & input$population1 == 'FALSE') {
        p <- individual_plot(unlist(store$draw_sim1.2))
      } else if (length(store$draw_sim1.1) != 0 &input$population1 == 'TRUE') {
        p <- population_plot(unlist(store$draw_sim1.1))
      } else{
        p <- place_holder()
      }
      
      return(p)
    })
      
      
      observeEvent(input$sim2.1, {
        if(input$population2 == 'TRUE'){
        progressSweetAlert( id = "sim2.1_load",
                            title = paste("Collecting Data"),
                            value = 0, total = input$n.sims_2
        )
        store$draw_sim2.1 <- lapply(1:input$n.sims_2, function(i) {
          
          
          draw <- dgp(
            n = input$n_2,
            n2 = input$n_secound, 
            type = 'B'
          )
          
          
          updateProgressBar(id = "sim2.1_load",
                            value = i, total = input$n.sims_2)# / (input$n.sims/100))
          
          return(draw)

          
        })
  
        closeSweetAlert()
        }else{
          store$draw_sim2.2 <- dgp(
            n = input$n_2,
            n2 = input$n_secound, 
            type = 'B'
          )
        }
      })
      

    
      output$p3 <- renderPlot({
        if (length(store$draw_sim2.2) != 0 & input$population2 == 'FALSE') {
          p <- individual_plot(unlist(store$draw_sim2.2))
        } else if (length(store$draw_sim2.1) != 0 &input$population2 == 'TRUE') {
          p <- population_plot(unlist(store$draw_sim2.1))
        } else{
          p <- place_holder()
        }
        
        return(p)
      })
    
    
    observeEvent(input$sim3.1, {
      if(input$population3 == 'TRUE'){
      progressSweetAlert( id = "sim3.1_load",
                          title = paste("Collecting Data"),
                          value = 0, total = input$n.sims_3
      )
      store$draw_sim3.1 <- lapply(1:input$n.sims_3, function(i) {
        
        
        draw <- dgp(
          n = input$n_3,
          type = 'C'
        )
        
        
        updateProgressBar(id = "sim3.1_load",
                          value = i, total = input$n.sims_3)# / (input$n.sims/100))
        
        return(draw)
        
      })
      
      closeSweetAlert()
      }else{
        store$draw_sim3.2 <- dgp(n = input$n_3, type = 'C')
      }
    })
    
    
    
    output$p4 <- renderPlot({
      if (length(store$draw_sim3.2) != 0 & input$population3 == 'FALSE') {
        p <- individual_plot(unlist(store$draw_sim3.2))
      } else if (length(store$draw_sim3.1) != 0 &input$population3 == 'TRUE') {
        p <- population_plot(unlist(store$draw_sim3.1))
      } else{
        p <- place_holder()
      }
      
      return(p)
    })
    
    
    
    observeEvent(input$sim4.1, {
      if(input$population4 == 'TRUE'){
      progressSweetAlert( id = "sim4.1_load",
                          title = paste("Collecting Data"),
                          value = 0, total = input$n.sims_4
      )
      store$draw_sim4.1 <- lapply(1:input$n.sims_4, function(i) {
        
        
        draw <- dgp(
          n = input$n_4,
          type = 'D'
        )
        
        
        updateProgressBar(id = "sim4.1_load",
                          value = i, total = input$n.sims_4)# / (input$n.sims/100))
        
        return(draw)
        
      })
      
      closeSweetAlert()
      }else{
        store$draw_sim4.2 <- dgp(
          n = input$n_4,
          type = 'D'
        )
        
      }
    })
    
    
    
    output$p5 <- renderPlot({
      if (length(store$draw_sim4.2) != 0 & input$population4 == 'FALSE') {
        p <- individual_plot(unlist(store$draw_sim4.2))
      } else if (length(store$draw_sim4.1) != 0 &input$population4 == 'TRUE') {
        p <- population_plot(unlist(store$draw_sim4.1))
      } else{
        p <- place_holder()
      }
      
      return(p)
    })
    

    output$all_4_ui <- renderUI({
      fluidRow(
        sidebarPanel(
          conditionalPanel("input.population5 == 'TRUE'", 
                           sliderInput(
                             inputId = 'n.sims_5',
                             label = 'Independent Studies:',
                             value = 10000,
                             min = 1000,
                             max = 20000,
                             step = 500
                           ),  ),
       
          sliderInput(inputId = 'n_5', 
                      label = 'Sample Size:',
                      value = 40,
                      min = 20,
                      max = 400,
                      step = 10), 
          conditionalPanel(condition = "input.B == true", 
                           sliderInput('B_out', 
                                       label = 'Add to Sample Size:',
                                       min = 10, 
                                       max = 100, 
                                       value = 20, 
                                       step = 10)),
            conditionalPanel(condition = "input.A == true", 
                             sliderInput(inputId = 'A_out', 
                                         label = 'Number of Outcomes:', 
                                         min = 1, max = 5, 
                                         step = 1, value = 2), 
                             sliderInput(inputId = 'A_rho', label = 'Correlation of Outcomes', 
                                         min = 0, max = 1, value = .5, step = .1) , 
                             ), 

          actionButton(inputId = 'sim5.1', label = 'Collect Data!')
        ), 
        column(width = 8, 
               plotOutput('p6')
        )
      )
    })
    
    observeEvent(input$sim5.1, {
      if(isTRUE(input$B)) {.n2 <- input$B_out}else{.n2 <- NULL}
      if(isTRUE(input$A)) {.dependent <- input$A_out}else{.dependent <- NULL}
      if(input$population5 == 'TRUE'){
      progressSweetAlert( id = "sim5.1_load",
                          title = paste("Collecting Data"),
                          value = 0, total = input$n.sims_5
      )
      store$draw_sim5.1 <- lapply(1:input$n.sims_5, function(i) {
        input$n_5
        draw <- dgp(
          n = input$n_5,
          n2 = .n2,
          n.dependent = .dependent, 
          rho = input$A_rho, 
          type = c('A', 'B', 'C', 'D')[c(input$A, input$B, input$C, input$D)]
        )
        
        
        updateProgressBar(id = "sim5.1_load",
                          value = i, total = input$n.sims_5)# / (input$n.sims/100))
        
        return(draw)
        
      })
      
      closeSweetAlert()
      }else{
        store$draw_sim5.2 <-
          dgp(
            n = input$n_5,
            n2 = .n2,
            n.dependent = .dependent,
            rho = input$A_rho,
            type = c('A', 'B', 'C', 'D')[c(input$A, input$B, input$C, input$D)]
          )
      }
    })
    
    output$p6 <- renderPlot({
      if (length(store$draw_sim5.2) != 0 & input$population5 == 'FALSE') {
        p <- individual_plot(unlist(store$draw_sim5.2))
      } else if (length(store$draw_sim5.1) != 0 &input$population5 == 'TRUE') {
        p <- population_plot(unlist(store$draw_sim5.1))
      } else{
        p <- place_holder()
      }
      
      return(p)
    })
   
    
})
