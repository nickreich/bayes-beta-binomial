shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        require(ggplot2)
        require(tidyr)
        theme_set(theme_minimal())
        x <- seq(0, 1, by=.01)
        prior <- dbeta(x, input$alpha, input$beta)
        posterior <- dbeta(x, (input$alpha + input$y), (input$beta + input$n - input$y))
        dat <- data.frame(x, prior, posterior)
        dat_long <- gather(dat, distribution, value, -x)
        
        ggplot(dat_long) + geom_line(aes(x=x, y=value, color=distribution)) +
            xlab(expression(pi)) + ylab(NULL) + 
            theme(legend.justification=c(0,1), legend.position=c(0,1))
    })
}
)