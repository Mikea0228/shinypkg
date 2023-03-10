


#' shinypkg
#'
#' call this function, launch a shiny app
#'
#' @return null
#' @export
#'
#' @examples
#' \dontrun{
#' shinypkg()
#' }
shinypkg <- function(){
  ui <- shiny::fluidPage(

    # Application title
    shiny::titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::sliderInput("bins",
                    "Number of bins:",
                    min = 1,
                    max = 50,
                    value = 30)
      ),

      # Show a plot of the generated distribution
      shiny::mainPanel(
        shiny::plotOutput("distPlot")
      )
    )
  )

  # Define server logic required to draw a histogram
  server <- function(input, output) {

    output$distPlot <- shiny::renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- datasets::faithful[, 2]
      bins <- seq(min(x), max(x), length.out = input$bins + 1)

      # draw the histogram with the specified number of bins
      graphics::hist(x, breaks = bins, col = 'darkgray', border = 'white',
           xlab = 'Waiting time to next eruption (in mins)',
           main = 'Histogram of waiting times')
    })
  }

  # Run the application
  shiny::shinyApp(ui = ui, server = server)

}
