library("shiny")
library("shinythemes")
library("ggplot2")
library("mchtoolbox")
library("dplyr")
library("viridisLite")

shinyServer(function(input, output, session) {

  output$contents <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.

    req(input$file1)

    # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    tryCatch({
      df <- read.csv(
        input$file1$datapath,
        header = input$header,
        sep = input$sep,
        quote = input$quote
      )
      mchData = create_cdc_growth(df)
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    })

    if (input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }

  })



  output$plot1 <- renderPlot({
    if (input$plot_theme == "gray") {
      req(input$file1)
      df <- read.csv(
        input$file1$datapath,
        header = input$header,
        sep = input$sep,
        quote = input$quote
      )
      mchData = create_cdc_growth(df)
      ggplot(mchData, aes(height, weight)) +
        geom_point(aes(colour = factor(sex)), alpha = 0.7, size = 3) +
        scale_colour_viridis_d(
          name = "Sex",
          labels = c("Male", "Female"),
          end = 0.75
        ) +
        labs(x = "Height (cm)", y = "Weight (kg)") +
        theme_gray() +
        theme(
          legend.position = c(0.9, 0.1),
          legend.background = element_blank(),
          legend.title = element_text(face = "bold", size = 16),
          legend.text = element_text(face = "bold", size = 14),
          axis.title.x = element_text(
            face = "bold",
            size = 16,
            vjust = 0
          ),
          axis.title.y = element_text(face = "bold", size = 16),
          axis.text = element_text(size = 14)
        )
    } else if (input$plot_theme == "bw") {
      req(input$file1)
      df <- read.csv(
        input$file1$datapath,
        header = input$header,
        sep = input$sep,
        quote = input$quote
      )
      mchData = create_cdc_growth(df)
      ggplot(mchData, aes(height, weight)) +
        geom_point(aes(colour = factor(sex)), alpha = 0.7, size = 3) +
        scale_colour_viridis_d(
          name = "Sex",
          labels = c("Male", "Female"),
          end = 0.75
        ) +
        labs(x = "Height (cm)", y = "Weight (kg)") +
        theme_bw() +
        theme(
          legend.position = c(0.9, 0.1),
          legend.background = element_blank(),
          legend.title = element_text(face = "bold", size = 16),
          legend.text = element_text(face = "bold", size = 14),
          axis.title.x = element_text(
            face = "bold",
            size = 16,
            vjust = 0
          ),
          axis.title.y = element_text(face = "bold", size = 16),
          axis.text = element_text(size = 14)
        )
    } else if (input$plot_theme == "light") {
      req(input$file1)
      df <- read.csv(
        input$file1$datapath,
        header = input$header,
        sep = input$sep,
        quote = input$quote
      )
      mchData = create_cdc_growth(df)
      ggplot(mchData, aes(height, weight)) +
        geom_point(aes(colour = factor(sex)), alpha = 0.7, size = 3) +
        scale_colour_viridis_d(
          name = "Sex",
          labels = c("Male", "Female"),
          end = 0.75
        ) +
        labs(x = "Height (cm)", y = "Weight (kg)") +
        theme_light() +
        theme(
          legend.position = c(0.9, 0.1),
          legend.background = element_blank(),
          legend.title = element_text(face = "bold", size = 16),
          legend.text = element_text(face = "bold", size = 14),
          axis.title.x = element_text(
            face = "bold",
            size = 16,
            vjust = 0
          ),
          axis.title.y = element_text(face = "bold", size = 16),
          axis.text = element_text(size = 14)
        )
    }
  })

  output$click_info <- renderPrint({
    cat("input$plot_click:\n")
    str(input$plot_click)
  })

  output$click_info_new <- renderPrint({
    req(input$file1)
    df <- read.csv(
      input$file1$datapath,
      header = input$header,
      sep = input$sep,
      quote = input$quote
    )
    mchData = create_cdc_growth(df)
    myvars <- c("cid", "height", "weight", "sex", "bmiz", "waz")
    mchData1 <- mchData[myvars]
    nearPoints(
      mchData1,
      input$plot_click,
      threshold = 10,
      maxpoints = 1,
      addDist = TRUE
    )
  })

  # output$selected_var <- renderText({
  #   paste("Height", input$plot_click$x, "Weight", input$plot_click$y)
  # })


})
