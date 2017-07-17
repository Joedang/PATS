#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("global.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
	fluidRow(
	# fluffy title stuff
		column(1, tags$img(
			height = 100, 
			width = 100, 
			src = "psas_insignia.svg"
			)),
		column(11, titlePanel("PSAS Asset Tracking System"))
	),
	mainPanel(tabsetPanel(
	tabPanel("PATS Event Form", # value="eventTab",
		# display the PATS label of the asset
		tags$h3("Asset label:", textOutput("label")),

		# dropdown of projects
		selectInput("projectNum", "Project:", projNums),

		# dynamic dropdown of assets
		# selectInput("assetNum", "Asset Number:", c()),
		uiOutput("assetNumInput"), # assetNum

		# label extension
		textInput("labelExt", "Label Extension:"),

		# asset name (auto-filled)
		# textInput("assetName", "Asset Name:"),
		uiOutput("assetNameInput"), # assetName

		# name of submitter
		textInput("yourName", "Your name:"),

		# date of event
		dateInput("date", "Date of event:"),	

		# event type dropdown
		selectInput("eventType", "Event Type:", 
			    list(
				logging= c("service","incident"), 
				custody= c("check-out","check-in"),
				administration= c("creation", "destruction", "merge", "relabel"),
				other= c("other")
				)
			    ),
		
		# message
		textAreaInput("message", "Message:"),
		HTML("<p>Tip: use tools like <a href= 'http://imgur.com'>Imgur</a>, \
		     <a href= 'http://google.com/drive'>Google Drive</a>, \
		     <a href= 'http://youtube.com'>YouTube</a>, \
		     and <a href= 'http://asciiflow.com'>ASCIIFlow</a>\
		       to link/include extra content in your message.</p>"),

		# form submit button
		actionButton("submit", "Submit"),
		uiOutput("submitRefresh")
	),

	tabPanel("Event Database", # value="dataTab",
		# display the current data
		dataTableOutput("dataTable")
	),

	tabPanel("Asset Index", # value="indexTab",
		# display the asset index
		# HTML(paste(
		# 	   "<p>", 
		# 	   paste(collapse="</p><p>",
		# 		 unlist( strsplit( as.yaml(index) ,"\n") ) 
		# 		 ), 
		# 	   "</p>"
		# 	   ))
		# HTML(gsub("\n", "\n\n", as.yaml(index)))
		HTML("<pre>", as.yaml(index), "</pre>")
	),
	
	tabPanel("Debug",
		#  I want this to show the contents of the input and output objects...
		# textOutput(str(input)),
		# dataTableOutput("debugTable")
		 titlePanel("not implemented yet :(")
	)
))))
