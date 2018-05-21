library("shiny")


shinyUI(navbarPage(title=div(img(src="http://kylehamilton.com/files/mch_icon40.png"), "Maternal and Child Health Toolbox"), windowTitle="Maternal and Child Health Toolbox v0.1.0",

      tabPanel("Main", icon = icon("stats", lib = "glyphicon"),
               #sidebarLayout(

                 # Sidebar panel for inputs ----
                 sidebarPanel(

                   # Input: Select a file ----
                   fileInput("file1", "Choose CSV File",
                             multiple = FALSE,
                             accept = c("text/csv",
                                        "text/comma-separated-values,text/plain",
                                        ".csv")),

                   # Horizontal line ----
                   tags$hr(),

                   # Input: Checkbox if file has header ----
                   checkboxInput("header", "Header", TRUE),

                   # Input: Select separator ----
                   radioButtons("sep", "Separator",
                                choices = c(Comma = ",",
                                            Semicolon = ";",
                                            Tab = "\t"),
                                selected = ","),

                   # Input: Select quotes ----
                   radioButtons("quote", "Quote",
                                choices = c(None = "",
                                            "Double Quote" = '"',
                                            "Single Quote" = "'"),
                                selected = '"'),

                   # Horizontal line ----
                   tags$hr(),

                   # Input: Select number of rows to display ----
                   radioButtons("disp", "Display",
                                choices = c(Head = "head",
                                            All = "all"),
                                selected = "head")

                 ),
               br(),

       tableOutput("contents"),
       br()
      ),

navbarMenu("About mchtools", icon = icon("dot-circle-o", lib = "font-awesome"),
           tabPanel("About mchtools", icon = icon("bar-chart-o", lib = "font-awesome"),

strong('About mchtools'),
p("WORDS"),
br(),



br()

           ),
           tabPanel("Authors and Contributors", icon = icon("users", lib = "font-awesome"),

strong('Authors'),

HTML('<div style="clear: left;"><img src="http://kylehamilton.com/wp-content/uploads/2014/11/kyle80.jpg" alt="" style="float: left; margin-right:5px" /></div>'),
p(a("W. Kyle Hamilton - University of California, Merced", href="http://www.kylehamilton.com", target="_blank")),
p("W. Kyle Hamilton has authored things"),
br(),

br()
           ),


p(br())

)
)
)

