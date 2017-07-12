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
	output$assetNumInput <- renderUI({
		# find the index of the project with the given label:
		projInd <- which(sapply(
				index$projects, 
				function(x) x$label==input$projectNum
				))
		# get a vector of the labels of the assets in this project:
		currentProjAssets <- sapply(
					index$projects[[projInd]]$assets, 
					function(x) x$label
					)
		# name the elements of that vector "#### -- ASSET NAME"
		names(currentProjAssets) <- paste(
				currentProjAssets,
				sapply( # get the names of the assets
					index$projects[[projInd]]$assets, 
					function(x) x$name
					),
				sep= " -- "
				)
		# display this named vector as a drop down
		selectInput("assetNum", "Asset Number:", currentProjAssets)
	})
	output$assetNameInput <- renderUI({

		# find the index of the project with the given label:
		projInd <- which(sapply(
				index$projects, 
				function(x) x$label==input$projectNum
				))

		# get a T/F mask of which assets match the asset number:
		assetMask <- sapply(index$projects[[projInd]]$assets, function(x) x$label==input$assetNum)
		# if you got a match, get it's name. Otherwise, give it an empty name.
		if (typeof(assetMask)=="logical") {
			assetInd <- which(assetMask)
			currentAssetName <- index$projects[[projInd]]$assets[[assetInd]]$name
		} else 
			currentAssetName <- ""

		textInput(
			  "assetName", "Asset Name:", 
			  value= currentAssetName
			  )
	})

})
