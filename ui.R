library(shiny)

data(euro)

shinyUI(
    pageWithSidebar(
        headerPanel('Simulation of dice roll values'),
        sidebarPanel(
            p('Please select the number of dice, the number of sides per dice and the number of rolls you would like to simulate.'),
            numericInput('dice', 'Number of dice', min = 1, step = 1, value = 1),
            selectInput('sides', 'Number of sides per dice', c(6, 8, 10, 12, 20)),
            numericInput('rolls', 'Number of rolls to simulate', min = 0, max = 10000, step = 1, value = 1000),
            submitButton('Simulate'),
            h3('Documentation'),
            p('This application simulates rolls of one or more dice with 6, 8, 10, 12 or 20 sides per dice, assuming fair dice with values starting from 1 and incrementing with 1.'),
            p('To use this application you simply inpu tthe number of dice you would like to roll, the number of sides per dice and the number of rolls you would like to simulate.'),
            p('The application will run the simulation and show you a histogram of the results, the mean and the average of the simulated values. You will also find all the values of dice rolls so you can reuse this random data if you like.'),
            p('Note that the values returned by this application are the total value of the dice rolls.')
        ),
        mainPanel(
            plotOutput('histogram'),
            h3('Statistics'),
            textOutput('mean'),
            textOutput('sd'),
            h3('Simulated outcomes'),
            textOutput('outcomes')
        )
    )
)