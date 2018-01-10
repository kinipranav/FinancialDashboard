library(shiny)
library(shinydashboard)
shinyUI(dashboardPage(
	dashboardHeader(title = "Trading Dashboard"),
	dashboardSidebar(
		selectInput(inputId = "stockList",label = "Dow Jones Industrial..",symbols, selected = "GS", multiple = FALSE)
		),
	dashboardBody(
		#Boxes have to be put in a row or column
		fluidRow(
			box(title = "Technical Chart" , plotOutput("plot1",height=450)),
			tabBox(
				title = "Financial Statements",
				id = "tabset1",
				side = "right", height = "400px",
				selected = "Balance Sheet", 
				tabPanel("Balance Sheet", dataTableOutput("bal_sheet")),
				tabPanel("Income Statement", dataTableOutput("inc_stmt")),
				tabPanel("CashFlow Statement", dataTableOutput("cash_flow"))
			)
		)#,
		#fluidRow(
		#	box(title = "Solvency Ratios", dataTableOutput("ratios")),
		#	box(TextOutput("myText"))
		#)
		
	)
))	