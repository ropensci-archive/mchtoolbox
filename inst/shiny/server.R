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
      ggplot(mtcars, aes(wt, mpg)) + geom_point() + theme_gray()
    } else if (input$plot_theme == "bw") {
      ggplot(mtcars, aes(wt, mpg)) + geom_point() + theme_bw()
    } else if (input$plot_theme == "light") {
      ggplot(mtcars, aes(wt, mpg)) + geom_point() + theme_light()
    }
  })

  output$click_info <- renderPrint({
    cat("input$plot_click:\n")
    str(input$plot_click)
  })
  output$hover_info <- renderPrint({
    cat("input$plot_hover:\n")
    str(input$plot_hover)
  })
  output$dblclick_info <- renderPrint({
    cat("input$plot_dblclick:\n")
    str(input$plot_dblclick)
  })
  output$brush_info <- renderPrint({
    cat("input$plot_brush:\n")
    str(input$plot_brush)
  })

})
