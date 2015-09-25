library(shiny)

shinyServer(
    function(input, output) {
        simulate <- reactive({
            sums <- rowSums(replicate(input$dice, sample(1:input$sides, input$rolls, replace = TRUE)))
            sums
        })
        output$histogram <- renderPlot(
            hist(
                simulate(), 
                breaks = seq(as.numeric(input$dice) - .5, as.numeric(input$sides) * as.numeric(input$dice) + .5, 1),
                xlab = 'Total value per roll',
                main = paste('Histogram of rolling', input$dice, 'dice with', input$sides, 'sides', input$rolls, 'times'),
                col = 'blue'
            )
        )
        output$mean <- renderText(
            paste(
                'Mean:',
                mean(simulate())
            )
        )
        output$sd <- renderText(
            paste(
                'Standard deviation:',
                sd(simulate())
            )
        )
        output$outcomes <- renderText(simulate())
    }
)