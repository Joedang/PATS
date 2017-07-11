#
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
})
