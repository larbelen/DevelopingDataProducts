
library(shiny)

shinyUI(
  navbarPage("Database Explorer",
            
             ## DEFINE THE FIRST MAIN PANEL
             
            tabPanel("DATA",
        
  ## DEFINE TITLE
  
  titlePanel(title= h4("Violent Crime Rates by US State", align="center")),
  
   ## DEFINE SIDEBAR
      
  sidebarPanel(
    selectInput("var","1. Select the Kind of Crime - Apply only for Data and plot",choices =c("Murder"=1,"Assault"=2,"Urbanpop"=3,"Rape"=4),selected=1),
    br(),
   
    sliderInput("bins","2. Select the number of BINs for histogram - Apply only for plot", min=20, max = 25, value =20),
    
    br(),
    radioButtons("color","3. Select the colour of histogram - Apply only for plot",choices=c("Green","Red","Yellow"),selected="Green"),
    tags$style("body{background-color:linen; color:black}")
    
    ),
  
    ## DEFINE MAIN PANEL
      
  
    mainPanel(
      
      ## DEFINE THE DIFERENTS PANEL TAHT THE USERS SEE
      
      tabsetPanel(type="tab", 
                  
                  tabPanel("summary", verbatimTextOutput("sum")),
                  
                  tabPanel("Structure", verbatimTextOutput("str")),
                  
                  tabPanel("Data",tableOutput("data")),
                  
                  tabPanel("Plot", plotOutput("myhist"))
                  
                  )
    )
  
            
      
      ),
      
       ## DEFINE THE SECOND MAIN PANEL
      
      tabPanel("ABOUT",
               mainPanel(
                 includeMarkdown("Include.Rmd")
                
               )
    )))
  
