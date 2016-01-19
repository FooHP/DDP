library(shiny)
data(euro) # Load Euro data
library(ggplot2) # Load ggplot2

Euro <- data.frame(EuroCountryCurrency=names(euro), ConvRate=euro, row.names=NULL)
Convformula <- function(euroamt,EuroCC)  euroamt*euro[EuroCC]
g1 <- ggplot(Euro, aes(x=ConvRate,y=EuroCountryCurrency))
g1 <- g1 + geom_segment(aes(yend=EuroCountryCurrency,xend=0),size=8,color="blue") 
g1 <- g1 + scale_x_continuous(breaks = seq(0, 2000, 200))
g1 <- g1 + labs(x="Conversion Rate",y="Euro Country Currency")
g1 <- g1 + labs(title= "euro data: 1 Euro in currency unit")

server<-function(input, output) {
  output$outtbl1 <- renderTable({Euro})
  output$outchart1 <- renderPlot({g1})
  x <- reactive({input$euroamt})
  output$inputValue <- renderText({x()})
  output$outValue <- renderPrint({Convformula(x(),input$EuroCC)})
}

