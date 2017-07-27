library(shiny)

shinyUI(fluidPage(
    # Application title
    titlePanel("Bayesian inference for Binomial proportion"),
    p("See Example E of section 3.5 of Rice 3rd edition, page 94-95"),
    sidebarLayout(
        sidebarPanel(
            numericInput("alpha", "alpha parameter for Beta prior:", 1,
                min = 1, max = 100),
            numericInput("beta", "beta parameter for Beta prior:", 1,
                min = 1, max = 100),
            numericInput("y", "number of successes observed:", 13,
                min = 1, max = 100),
            numericInput("n", "out of this many trials (must be larger than # successes):", 20,
                min = 1, max = 100)),
        # Show a plot of the generated distribution
        mainPanel(plotOutput("distPlot"))
    ),
    HTML('<p>Adapted by <a href="http://reichlab.io">Nicholas Reich</a> from <a href="https://r.amherst.edu/apps/nhorton/Shiny-Bayes/">Shiny-Bayes app</a> by Nicholas Horton'),
    HTML('<p>Source code available on <a href="https://github.com/nickreich/bayes-beta-binomial">GitHub</a> under an MIT license.')
    
))