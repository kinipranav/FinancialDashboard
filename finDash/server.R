#runApp(host="localhost",port=5050,"finDash")
library(shiny)
library(shinydashboard)
library(quantmod)

shinyServer (function(input,output) {
	income = reactive({
		values <- reactiveValues()
		inc <- paste0(tolower(input$stockList),"_IS")
		return(inc)
	})
	balance = reactive({
		values <- reactiveValues()
		bal <- paste0(tolower(input$stockList),"_BS")
		return(bal)
	})
	cash = reactive({
		values <- reactiveValues()
		cash <- paste0(tolower(input$stockList),"_CF")
		return(cash)
	})
	ratio = reactive({
		values <- reactiveValues()
		ratio <- paste0(tolower(input$stockList),"_ratios")
		return(ratio)
	})
	chart = reactive({
		cht <- input$stockList
		return(cht)
	})
	
	output$plot1 <- renderPlot({
		chartSeries(eval(as.name(chart())), type = "candlesticks", multi.col = TRUE, theme = "white", up.col = 'green', down.col = 'red', subset = 'last 6 months', name = chart())
		dc <- lag(DonchianChannel(cbind(Hi(eval(as.name(chart()))),Lo(eval(as.name(chart()))))))
		plot(addTA(dc$low, on=1, col='purple'))
		plot(addTA(dc$high, on=1, col='green'))
	})
	
	output$bal_sheet <- renderDataTable({eval(as.name(balance()))},
		options = list(
			pageLength = 7, initComplete = I("function(settings,json) {$(this.api().table().header()).css({'background-color': '#000', 'color' : 'GREEN'});}")
		))
	output$inc_stmt <- renderDataTable({eval(as.name(income()))},
		options = list(
			pageLength = 7, initComplete = I("function(settings,json) {$(this.api().table().header()).css({'background-color': '#000', 'color' : 'GREEN'});}")
		))
	output$cash_flow <- renderDataTable({eval(as.name(cash()))},
		options = list(
			pageLength = 7, initComplete = I("function(settings,json) {$(this.api().table().header()).css({'background-color': '#000', 'color' : 'GREEN'});}")
		))
	#output$ratios <- renderDataTable({eval(as.name(ratio()))},
	#	options = list(scrollX=TRUE,
	#		pageLength = 9, initComplete = I("function(settings,json) {$(this.api().table().header()).css({'background-color': '#000', 'color' : 'GREEN', 'font-size' : '12px'});}")
	#	))
	})