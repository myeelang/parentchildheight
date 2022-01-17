#
# This is the user-interface definition of a Shiny web application for
# modeling and prediction using Galton's height data for parents and
# children
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Modeling and Prediction using Galton's Height Data for Parents and Children"),
    sidebarLayout(
        sidebarPanel(
            h3("Model Results from Step 1:"),
            h4("Intercept:"),
            textOutput("intOut"),
            h4("Slope:"),
            textOutput("slopeOut"),
            h2("Step 2: Prediction:"),
            sliderInput("pheight",
                        "Slide to pick parents' height (in inches):",
                        min = 1,
                        max = 100,
                        value = 65),
            h3("Child's height prediction from Step 2:"),
            textOutput("cheight")        ),
        mainPanel(
            h2("Step 1: Drag a box to select data sample for the prediction model:"),
            plotOutput("plot1", brush = brushOpts(
                id = "brush1")
            )
        )
    )
))