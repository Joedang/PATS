# server.R
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
	output$baseLabel <- reactive({
		if (nchar(input$labelExt)==0)
			paste(
				"PSAS", input$projectNum, 
				input$assetNum, sep="-"
				)
		else
			paste("PSAS", input$projectNum, 
			      input$assetNum, input$labelExt, 
			      sep="-"
			      )
		})
#	output$projAssets <- reactive({
#		projInd <- which(sapply(index$projects, function(x) x$label==input$projectNum))
#		currentProjAssets <- sapply(index$projects[[projInd]]$assets, function(x) x$label)
#		updateSelectInput(input, "assetNum", choices= c(1,2,3))
#		})
	output$assetInput <- renderUI({
		projInd <- which(sapply(index$projects, function(x) x$label==input$projectNum))
		currentProjAssets <- sapply(index$projects[[projInd]]$assets, function(x) x$label)
		selectInput("assetNum", "Asset Number:", currentProjAssets)
	})
})
