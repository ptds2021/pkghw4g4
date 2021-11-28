library(shiny)
library(pkghw4g4)

shinyServer(function(input, output) {





    simulate <- reactive( estimate_area(input$B, input$seed))
    measure <- reactive(system.time(estimate_area(input$B, input$seed))[3])




    output$plot <- renderPlot({
        plot.area(simulate())
        # plot area

    })

    output$time <- renderText({
        options(digits.secs=18)
        paste("Execution time is:", measure(), "seconds")
        # extract the time of the execution

    })

    output$area <- renderText({
        paste("Estimated area is:", simulate()$estimated_area)
        # extract the estimated value

    })

})
