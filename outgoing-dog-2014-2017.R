library(shiny)
library(ggplot2)
library(ggthemes)
outgoing_dog<- read.csv('D:\\Data Science sm2\\FIT5120\\datasets\\dog\\Geelong-dog.csv')
data <- outgoing_dog
ui <- fluidPage(    
  
  # Give the page a title
  titlePanel("Geelong GSPCA Statistics Data"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("year", "Year:", 
                  c("None" = "None",
                    "2017" = "2017",
                    "2016" = "2016",
                    "2015" = "2015",
                    "2014" = "2014"
                    )),
      hr(),
      helpText("Choose the year")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)
server <- function(input, output) {
  
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({if (input$year == "None") {#judge the option which user choose and change the dataset
    
    new_data <- data
  }
  else if (input$year == "2017"){
    
    new_data <- data[data['Year']=='2017',]
    
  }else if (input$year == "2016"){
    
    new_data <- data[data['Year']=='2016',]
    
  }else if (input$year == "2015"){
    
    new_data <- data[data['Year']=='2015',]
    
  }else if (input$year == "2014"){
    
    new_data <- data[data['Year']=='2014',]
    
  }
    new_data <-new_data[order(new_data$Number.of.Canines),]
    #new_data$Outgoing.Canines <- factor(new_data$Outgoing.Canines, levels = new_data$Outgoing.Canines)
    # Render a barplot
    p<-ggplot(data = new_data, mapping = aes(x = Year, y = Number.of.Canines, 
                                              fill = Outgoing.Canines)) + geom_bar(stat = 'identity',
                                            position = 'dodge',width = 0.5)+ theme_economist() + 
                        geom_text(aes(label = Number.of.Canines, ,vjust = -0.8, hjust = 0.5, color = Outgoing.Canines), show_guide = FALSE)+
                        ylim(min(new_data$Number.of.Canines, 0)*1.1, max(new_data$Number.of.Canines)*1.1)
                                              
    print(p)
  })
}
shinyApp(ui = ui, server = server)