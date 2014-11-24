library(shiny)

ZW1 <- function(f, X1, C1) sqrt(X1/(2*pi*f*C1*1e-6))

beta1 <- function(f, X1, C1) sqrt(X1*2*pi*f*C1*1e-6)*180/pi*100

Pnat <- function(f, Um, X1, C1) Um^2/sqrt(X1/(2*pi*f*C1*1e-6))

Ic <- function(f, Um, X1, C1, l) 1/(sqrt(X1/(2*pi*f*C1*1e-6)))*tan(sqrt(X1*2*pi*f*C1*1e-6)*l)*Um*1000/sqrt(3)

currents <- function(f, Um, X1, C1, Id, l){
  x <- seq(0,400,1)
  Ic <- Ic(f, Um, X1, C1, x)
  plot(x, Ic, type = "l", col = "blue", main = "continuous current carrying capacity and charging current", ylab = "current in Ampere", xlab = "cable length in km")
  abline(a = Id, b = 0, col = "red")
  legend("topleft", legend = c("continuous current carrying capacity","charging current"), col=c("red","blue"), lty=1)
  lines(c(l, l), c(0, Ic[length(Ic)]), col = "green", lwd = 2)
}

shinyServer(
  function(input, output) {
    output$ZW1 <- renderPrint({ZW1(input$f, input$X1, input$C1)})
    output$beta1 <- renderPrint({beta1(input$f, input$X1, input$C1)})
    output$Pnat <- renderPrint({Pnat(input$f, input$Um, input$X1, input$C1)})
    output$Ic <- renderPrint({Ic(input$f, input$Um, input$X1, input$C1, input$l)})
    output$currents <- renderPlot({currents(input$f, input$Um, input$X1, input$C1, input$Id, input$l)})
  }
)

