# Controls function
library(shiny)

library("activity")
library("circular")

data(BCItime)

shinyServer(
  function(input, output) {
    output$res<-renderPlot({
      spc<-input$id1
      times<-BCItime[BCItime$species==spc,2]*2*pi
      br<-input$id2
      hist(times, breaks=br, main=paste("Daily Activity of the ", spc, "in BCI"), col="seagreen", freq=FALSE)    
    })
    output$id3<-renderPrint({
      spc<-input$id1
      res<-mean.circular(BCItime[BCItime$species==spc,2])
      res
      })
    output$id4<-renderPrint({
      spc<-input$id1
      var.circular(2*pi*BCItime[BCItime$species==spc,2])  
    })
      
   }
)
