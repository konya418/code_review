library(shiny)

shinyUI(fluidPage(

titlePanel('p-hackeR'), 
# you could write text directly but I like using .md for big text chuncks
includeMarkdown(file.path('markdowns/p_hack_md1.md')), 
radioButtons(
  inputId = 'population0',
  label = NULL,
  choices = list(
    'Simulate a distribution of studies' = T, 
    'Simulate one study at a time' = F
  ), 
  inline = T
), 
fluidRow(
  sidebarPanel(
    conditionalPanel(condition = "input.population0 == 'TRUE'", 
                     sliderInput(
                       inputId = 'n.sims0',
                       label = 'Independent Studies:',
                       value = 10000,
                       min = 1000,
                       max = 20000,
                       step = 500
                     ),   
    ), 
    sliderInput(
      inputId = 'n0',
      label = 'Sample Size in Each Study',
      value = 40,
      min = 20,
      max = 400, 
      step = 10),

    actionButton(inputId = 'sim0', label = 'Collect Data!')
  ), 
  column(width = 8, 
         plotOutput('p1')
  )
), 
br(), 
includeMarkdown(file.path('markdowns/multiple_outcomes.md')),
br(), 
radioButtons(
  inputId = 'population1',
  label = NULL,
  choices = list(
    'Simulate a distribution of studies' = T, 
    'Simulate a single study' = F
  ), 
  inline = T
), 
fluidRow(
         sidebarPanel(
           conditionalPanel(condition = "input.population1 == 'TRUE'", 
                            sliderInput(
                              inputId = 'n.sims',
                              label = 'Independent Studies:',
                              value = 10000,
                              min = 1000,
                              max = 20000,
                              step = 500
                            ),   
                            ), 
           sliderInput(
             inputId = 'n',
             label = 'Sample Size:',
             value = 40,
             min = 20,
             max = 400, 
             step = 10
             ),
           sliderInput(
             inputId = 'n.dependent',
             label = 'Number of Outcomes:',
             min = 1,
             max = 5,
             value = 2, 
             step = 1
           ),
           sliderInput(
             inputId = 'rho',
             label = 'Correlation of Outcomes:',
             min = 0,
             max = 1,
             value = .5,
             step = .1
           ), 
           actionButton(inputId = 'sim1.1', label = 'Collect Data!')
         ), 
  column(width = 8, 
         plotOutput('p2')
         )
), 
br(), 
includeMarkdown(file.path('markdowns/additional_data.md')),
br(), 
radioButtons(
  inputId = 'population2',
  label = NULL,
  choices = list(
    'Simulate a distribution of studies' = T, 
    'Simulate one study at a time' = F
  ), 
  inline = T
), 
fluidRow(
         sidebarPanel(
           conditionalPanel(condition = "input.population2 == 'TRUE'",
           sliderInput(
             inputId = 'n.sims_2',
             label = 'Independent Studies:',
             value = 10000,
             min = 1000,
             max = 20000,
             step = 500
           ),),
           
           sliderInput(
             inputId = 'n_2',
             label = 'Sample Size:',
             value = 40,
             min = 20,
             max = 400, 
             step = 10
           ),
           sliderInput(
             inputId = 'n_secound',
             label = 'Add to  Sample Size:',
             min = 10,
             max = 100,
             value = 20
           ),
           actionButton(inputId = 'sim2.1', label = 'Collect Data!')
         ), 
  column(width = 8, 
         plotOutput('p3')
  )
), 

br(), 
includeMarkdown(file.path('markdowns/interactions.md')),
br(), 
radioButtons(
  inputId = 'population3',
  label = NULL,
  choices = list(
    'Simulate a distribution of studies' = T, 
    'Simulate one study at a time' = F
  ), 
  inline = T
), 
fluidRow(
  sidebarPanel(
    conditionalPanel(condition = "input.population3 == 'TRUE'",
        sliderInput(
          inputId = 'n.sims_3',
          label = 'Independent Studies:',
          value = 10000,
          min = 1000,
          max = 20000,
          step = 500
        ),),
        sliderInput(inputId = 'n_3', 
                    label = 'Sample Size:',
                    value = 40,
                    min = 20,
                    max = 400,
                    step = 10), 
        actionButton(inputId = 'sim3.1', label = 'Collect Data!')
  ), 
  column(width = 8, 
         plotOutput('p4')
  )
  ), 
br(), 
includeMarkdown(file.path('markdowns/subset.md')),
br(), 
radioButtons(
  inputId = 'population4',
  label = NULL,
  choices = list(
    'Simulate a distribution of studies' = T, 
    'Simulate one study at a time' = F
  ), 
  inline = T
), 
fluidRow(
  sidebarPanel(
    conditionalPanel(condition = "input.population4 == 'TRUE'",
    sliderInput(
      inputId = 'n.sims_4',
      label = 'Independent Studies:',
      value = 10000,
      min = 1000,
      max = 20000,
      step = 500
    ),),
    sliderInput(inputId = 'n_4', 
                label = 'Sample Size:',
                value = 40,
                min = 20,
                max = 400,
                step = 10), 
    actionButton(inputId = 'sim4.1', label = 'Collect Data!')
  ), 
  column(width = 8, 
         plotOutput('p5')
  )
), 
br(), 
includeMarkdown(file.path('markdowns/how_bad_can_it_be.md')),
br(), 
fluidRow(
  column(width = 3, 
         strong('Multiple Outcomes'), 
         materialSwitch(inputId = 'A',status = 'primary', value = T)), 
column(width = 3, 
       strong("Collect Additional Data"), 
       materialSwitch(inputId = 'B', status = 'primary', value = T)), 
column(width = 3, 
       strong('Optional Interactions'), 
       materialSwitch(inputId = 'C', status = 'primary', value = T)),
column(width = 3, 
       strong('Compare Different Subsets'), 
       materialSwitch(inputId = 'D', status = 'primary', value = T))), 
radioButtons(
  inputId = 'population5',
  label = NULL,
  choices = list(
    'Simulate a distribution of studies' = T, 
    'Simulate one study at a time' = F
  ), 
  inline = T
), 
uiOutput('all_4_ui')

))
