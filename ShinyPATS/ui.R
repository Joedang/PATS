#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
	tags$img(
		height = 100, 
		width = 100, 
		src = "psas_insignia.svg"
		),
	titlePanel("PSAS Asset Tracking System"),
	selectInput("projectNum", "Project Number:", c(1,2,3)),
	selectInput("assetNum", "Asset Number:", c(1,2,3)),
	textInput("labelExt", "Label Extension:"),
	textInput("assetName", "Asset Name:"),
	textInput("yourName", "Your name:"),
	dateInput("date", "Date:"),	
	selectInput("eventType", "Event Type:", 
		    list(
		    	logging= c("service","incident"), 
		    	custody= c("check-out","check-in"),
		    	administration= c("creation", "destruction", "merge", "relabel"),
		    	other= c("other")
		    	)
		    ),
	textAreaInput("message", "Message:"),
	textOutput("baseLabel")
))
