library(shiny)
shinyUI(pageWithSidebar(

  headerPanel("Cables in electric power transmission"),
  
  sidebarPanel(
    numericInput('f', 'system frequency in Hertz', 50, min = 50, max = 60, step = 10),
    numericInput('Um', 'highest voltage for equipment Um in kV', 24, min = 12, max = 420, step = 1),
    numericInput('X1', 'positive sequence reactance in ohm per km', 0.122, min = 0, max = 1, step = 0.001),
    numericInput('C1', 'positive sequence capacitance in microfarad per km', 0.254, min = 0, max = 1, step = 0.001),
    numericInput('Id', 'continuous current carrying capacity in Ampere', 366, min = 0, max = 1500, step = 1),
    sliderInput('l', 'length in km', value = 100, min = 0, max = 400, step = 5)
  ),
  mainPanel(
    h3('cable parameters for a lossless line'),
    h4('characteristic impedance ZW1 in Ohms'),
    verbatimTextOutput("ZW1"),
    h4('propagation constant beta1 in degrees per 100km'),
    verbatimTextOutput("beta1"),
    h4('natural loading Pnat in Megawatts'),
    verbatimTextOutput("Pnat"),
    h4('charging current Ic in Ampere'),
    verbatimTextOutput("Ic"),
    plotOutput('currents')
  )
))
  