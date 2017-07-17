# server.R
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# function to find the index of the project with the given label:
projInd <- function(input) 
{
	which(sapply(
		index$projects, 
		function(x) x$label==input$projectNum
	))
}

shinyServer(function(input, output) {

	# generate the PATS label based on user input
	output$label <- reactive({
		lab <- paste("PSAS", input$projectNum, input$assetNum, sep="-")
		# if the extension isn't empty, add it on, else use the base label
		if (nchar(input$labelExt)!=0)
			paste(lab, input$labelExt, sep="-")
		else
			lab
		})
	
	# generate the asset number dropdown based on the project number dropdown
	output$assetNumInput <- renderUI({
		currentProjAssets <- sapply(
					index$projects[[projInd(input)]]$assets, 
					function(x) x$label
					)
		# name the elements of that vector "#### -- ASSET NAME"
		names(currentProjAssets) <- paste(
				currentProjAssets,
				sapply( # get the names of the assets
					index$projects[[projInd(input)]]$assets, 
					function(x) x$name
					),
				sep= " -- "
				)
		# display this named vector as a drop down
		selectInput("assetNum", "Asset Number:", currentProjAssets)
	})

	# generate the auto-filled asset name based on the project and asset dropdowns
	output$assetNameInput <- renderUI({
		# get a T/F mask of which assets match the asset number:
		assetMask <- sapply(index$projects[[projInd(input)]]$assets, function(x) x$label==input$assetNum)
		# if you got a match, get it's name. Otherwise, give it an empty name.
		if (typeof(assetMask)=="logical") {
			assetInd <- which(assetMask)
			currentAssetName <- index$projects[[projInd(input)]]$assets[[assetInd]]$name
		} else 
			currentAssetName <- ""

		# return the UI element for the dropdown
		textInput(
			  "assetName", "Asset Name:", 
			  value= currentAssetName
			  )
	})

	# display the database as a table
	output$dataTable <- renderDataTable({
			input$submit # this just makes the table reactive to the submit button
			subset(dat, select= -message)
		})
	output$indexTable <- renderDataTable({index})

	output$submitRefresh <- renderUI({
		if (input$submit > 0) 
		{
			# saveRDS(input$date, "dateSample.RData")
			# if (!grep("^[0-9][4]", input$projectNum)) # check that a good proj number leads
			# 	warning("The project label seems to have a bad format.\n", input$projectNum)
			data_proj <- data.frame(
						project.number= input$projectNum,
						asset.number= input$assetNum,
						extension= input$labelExt,
						asset.name= input$assetName,
						submitter= input$yourName,
						date= input$date,
						type= input$eventType,
						message= input$message,
						timestamp= Sys.time()
						)
			dat <<- rbind(dat, data_proj) # UPDATE THE GLOBAL VARIABLE `dat` (ooh, so naughty!)
			cat("SAVING THE DATA!\n")
			saveData(dat)
			HTML("<script>location.reload()</script>")
		}
	})

# 	output$debugTable <- renderDataTable({
# 		input
# 	})
})
