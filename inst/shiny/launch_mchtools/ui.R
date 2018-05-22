library("shiny")
library("shinythemes")


shinyUI(
  navbarPage(
    theme = shinytheme("paper"),
    title = div(
      img(src = "http://kylehamilton.com/files/mch_icon40.png"),
      "Maternal and Child Health Toolbox"
    ),
    windowTitle = "Maternal and Child Health Toolbox v0.1.0",

    tabPanel(
      "Main",
      icon = icon("stats", lib = "glyphicon"),
      #sidebarLayout(

      # Sidebar panel for inputs ----
      sidebarPanel(
        # Input: Select a file ----
        fileInput(
          "file1",
          "Choose CSV File",
          multiple = FALSE,
          accept = c("text/csv",
                     "text/comma-separated-values,text/plain",
                     ".csv")
        ),

        # Horizontal line ----
        tags$hr(),

        # Input: Checkbox if file has header ----
        checkboxInput("header", "Header", TRUE),

        # Input: Select separator ----
        radioButtons(
          "sep",
          "Separator",
          choices = c(
            Comma = ",",
            Semicolon = ";",
            Tab = "\t"
          ),
          selected = ","
        ),

        # Input: Select quotes ----
        radioButtons(
          "quote",
          "Quote",
          choices = c(
            None = "",
            "Double Quote" = '"',
            "Single Quote" = "'"
          ),
          selected = '"'
        ),

        # Horizontal line ----
        tags$hr(),

        # Input: Select number of rows to display ----
        radioButtons(
          "disp",
          "Display",
          choices = c(Head = "head",
                      All = "all"),
          selected = "head"
        )

      ),
      br(),

      tableOutput("contents"),
      br()
    ),

    navbarMenu(
      "About mchtools",
      icon = icon("dot-circle-o", lib = "font-awesome"),
      tabPanel(
        "About mchtools",
        icon = icon("bar-chart-o", lib = "font-awesome"),

        strong('About mchtools'),
        img(src = 'https://raw.githubusercontent.com/ropenscilabs/mchtoolbox/master/man/figures/imgHexSmall.png', align = "right"),
        p(
          "The mchtoolbox package is used to calculate percentiles and z-scores for a child’s sex and age for BMI, weight, height, and head circumference based on the CDC growth charts."
        ),
        p(
          a(
            "Based on the SAS Program for the 2000 CDC Growth Charts from the CDC",
            href = "https://www.cdc.gov/nccdphp/dnpao/growthcharts/resources/sas.htm",
            target = "_blank"
          )
        ),
        br(),



        br()

      ),
      tabPanel(
        "Authors and Contributors",
        icon = icon("users", lib = "font-awesome"),

        strong('Authors'),
        br(),

        HTML(
          '<div style="clear: left;"><img src="http://kylehamilton.com/files/monica-gerber.jpg" alt="" style="float: left; margin-right:5px" /></div>'
        ),
        p(
          a(
            "Monica Gerber - Massachusetts General Hospital",
            href = "https://www.massgeneral.org/children/research/researchlab.aspx?id=1577",
            target = "_blank"
          )
        ),
        p("Monica was the leader of this project"),
        # br(),
        br(),
        HTML(
          '<div style="clear: left;"><img src="http://kylehamilton.com/files/jennifer-thompson.jpg" alt="" style="float: left; margin-right:5px" /></div>'
        ),
        p(
          a(
            "Jennifer Thompson - Vanderbilt University Medical Center",
            href = "https://jenthompson.me/",
            target = "_blank"
          )
        ),
        #p("Jennifer Thompson has authored things"),
        br(),
        br(),
        HTML(
          '<div style="clear: left;"><img src="http://kylehamilton.com/files/maelle-salmon.jpg" alt="" style="float: left; margin-right:5px" /></div>'
        ),
        p(
          a(
            "Maëlle Salmon - rOpenSci",
            href = "http://www.masalmon.eu/",
            target = "_blank"
          )
        ),
        #p("Jennifer Thompson has authored things"),
        br(),
        br(),
        HTML(
          '<div style="clear: left;"><img src="http://kylehamilton.com/files/charles-gray.jpg" alt="" style="float: left; margin-right:5px" /></div>'
        ),
        p(
          a(
            "Charles Gray - La Trobe University",
            href = "http://www.latrobe.edu.au/",
            target = "_blank"
          )
        ),
        #p("Charles Gray has authored things"),
        br(),
        br(),
        HTML(
          '<div style="clear: left;"><img src="http://kylehamilton.com/files/jenny-draper.png" alt="" style="float: left; margin-right:5px" /></div>'
        ),
        p(
          a("Jenny Draper - ESR NZ", href = "https://www.esr.cri.nz/", target = "_blank")
        ),
        #p("Jenny Draper has authored things"),
        br(),
        br(),
        HTML(
          '<div style="clear: left;"><img src="http://kylehamilton.com/files/kyle-hamilton.jpg" alt="" style="float: left; margin-right:5px" /></div>'
        ),
        p(
          a(
            "W. Kyle Hamilton - University of California, Merced",
            href = "http://www.kylehamilton.com",
            target = "_blank"
          )
        ),
        #p("W. Kyle Hamilton has authored things"),
        br(),

        br()
      ),


      p(br())

    )
  )
)
