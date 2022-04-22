#
# This is the user-interface definition of a Shiny web application for
# modeling and prediction using Galton's height data for parents and
# children
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Predicting Child Height using Parents' Height"),
    sidebarLayout(
        sidebarPanel(
            h3("Slide the bar to select Parent's Height"),

            sliderInput("pheight",
                        "Parents' height (in inches):",
                        min = 1,
                        max = 100,
                        value = 65),
            h3("Check to display Linear Model line"),           
            checkboxInput("lmline", "Show/Hide Linear Model line")
        ),
        mainPanel(
            h3("Predicted Child's height:"),
            textOutput("cheight"),
            plotOutput("plot1")
            )
        )
    )
)