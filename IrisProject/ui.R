
library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Iris Species Prediction Application"),
    
    sidebarLayout(
        sidebarPanel(h1("Select Petal parameters"),
                     sliderInput("petalLength", label = "Select Petal length",1,7,1),
                     sliderInput("petalWidth", label = "Select Petal Width",0.1,3,0.1),
                     
        ),
        
        mainPanel(
            h3("Sample belongs to following Iris species:"),
            h2(textOutput("text1"))
        )
    )
))
