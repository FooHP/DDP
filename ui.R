library(shiny)
fluidPage(
  titlePanel("Conversion Rate of Euro Currencies"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId="euroamt", label = "Input a numeric amount in (Euro)", value = 1),
      selectInput(inputId = "EuroCC",label = "Euro Country Currency", 
                  choices = names(euro),selected = "BEF"),
      
      p('Below are currencies of the countries participating in the European monetary union:'), 
      p('Austrian Schilling (ATS), Belgian Franc (BEF),'), 
      p('German Mark (DEM), Spanish Peseta (ESP),'),
      p('Finnish Markka (FIM), French Franc (FRF),'),
      p('Irish Punt (IEP), Italian Lira (ITL),'),
      p('Luxembourg Franc (LUF),'),
      p('Dutch Guilder (NLG), Portuguese Escudo (PTE)'), 
      p('These conversion rates were fixed by the European Union on December 31, 1998.')         
    ),
    
    
    mainPanel(
      tabsetPanel(        
        tabPanel("Converter", 
                 h3('Convert Euro to Euro Country Currency'),
                 h4('You entered in Euro'),
                 verbatimTextOutput("inputValue"),
                 h4('Amount in Country Currency '),
                 verbatimTextOutput("outValue")),
        tabPanel("Plot", plotOutput("outchart1")),
        tabPanel("Table", tableOutput("outtbl1")),
        tabPanel("Instruction", includeMarkdown("INSTR.md"))
      )
    )
  )
)
