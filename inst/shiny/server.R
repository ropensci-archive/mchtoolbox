library("shiny")
library("shinythemes")
library("ggplot2")
library("mchtoolbox")

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
      ggplot(mchData, aes(height, weight)) + geom_point(aes(colour = factor(sex))) + theme_gray()
    } else if (input$plot_theme == "bw") {
      req(input$file1)
      df <- read.csv(
        input$file1$datapath,
        header = input$header,
        sep = input$sep,
        quote = input$quote
      )
      mchData = create_cdc_growth(df)
      ggplot(mchData, aes(height, weight)) + geom_point(aes(colour = factor(sex))) + theme_bw()
    } else if (input$plot_theme == "light") {
      req(input$file1)
      df <- read.csv(
        input$file1$datapath,
        header = input$header,
        sep = input$sep,
        quote = input$quote
      )
      mchData = create_cdc_growth(df)
      ggplot(mchData, aes(height, weight)) + geom_point(aes(colour = factor(sex))) + theme_light()
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
    nearPoints(mchData1, input$plot_click, threshold = 10, maxpoints = 1,
               addDist = TRUE)
  })

  # output$selected_var <- renderText({
  #   paste("Height", input$plot_click$x, "Weight", input$plot_click$y)
  # })


})
