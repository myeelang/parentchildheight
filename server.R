#
# This is the server logic of a Shiny web application for
# modeling and prediction using Galton's height data for parents and
# children
#

library(shiny)
library(UsingR)

shinyServer(function(input, output) {
        data("galton")
        model <- reactive({
        brushed_data <- brushedPoints(galton, input$brush1,
                                      xvar = "parent", yvar = "child")
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(child ~ parent, data = brushed_data)
    })
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })
    output$cheight <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
        model()[[1]][1] + model()[[1]][2]*input$pheight
        }
    })
        output$plot1 <- renderPlot({
        plot(galton$parent, galton$child, xlab = "Parent (in inches)",
             ylab = "Child (in inches)", main = "Galton's Heights Data of Parents & their Children",
             cex = 1.0, pch = 16, bty = "n")
        if(!is.null(model())){
            abline(model(), col = "blue", lwd = 2)
        }
    })
})
