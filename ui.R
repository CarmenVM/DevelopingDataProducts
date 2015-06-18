#Controls layout

library(shiny)
library(circular)
shinyUI(pageWithSidebar(
  headerPanel("Activity patterns in Barro Colorado Island"),

  sidebarPanel(
    selectInput('id1', 'Select species', choices = c("agouti", "armadillo", "brocket", "coati", "ocelot", "opossum", "paca", "peccary", "tamandua", "tayra")),
    sliderInput('id2', 'Select breaks', value=10, min=5, max=30, step=5),
    h4('Circular mean'),
    verbatimTextOutput("id3"),
    h4('Circular variation'),
    verbatimTextOutput("id4")
    ),
    mainPanel(
      p('Package activity contains a dataset of animal species present in Barro Colorado Island (Panama) and the times at which automatic cameras took a picture of said animals.'),
      p('This app allows you to select a species and see the density of pictures taken across time of day (in radians).'),
      p('First select the species. The slider controls the breaks in the histogram. The values of mean direction (or circular mean, also in radians) and mean variation (a measure of the spread of the data) are calculated per species'),
      plotOutput('res'))
  ))

