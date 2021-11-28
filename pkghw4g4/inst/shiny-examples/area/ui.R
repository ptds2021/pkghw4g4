#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Area Estimation"),
    
    sidebarLayout(
        
        sidebarPanel(
            
            numericInput("seed", "Set a seed:", 10 ),
            
            sliderInput("B", "Number of points to simulate:", 1, 1000000, 5000)
            
        ),
        
        mainPanel(
            
            plotOutput("plot"),
            
            textOutput("time"),
            
            textOutput("area")
        )
    )
))
