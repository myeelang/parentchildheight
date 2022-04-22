#
# This is the server logic of a Shiny web application for
# modeling and prediction using Galton's height data for parents and
# children
#

library(shiny)
library(UsingR)

shinyServer(function(input, output) {
    data("galton")
    model <- lm(child ~ parent, data = galton)
    output$plot1 <- renderPlot({
        plot(galton$parent, galton$child, xlab = "Parent (in inches)",
             ylab = "Child (in inches)", main = "Galton's Heights Data of Parents & their Children",
             cex = 1.0, pch = 16, bty = "n")
        if(input$lmline){
            abline(model, col = "blue", lwd = 2)
            }
            })
    output$cheight <- renderText({
        model[[1]][1] + model[[1]][2]*input$pheight
        })
    })
