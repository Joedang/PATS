# global.R
library("yaml")

index <- yaml.load_file("data/index.yaml")
projNums <- sapply(index$projects, function(x) x$label)
names(projNums) <- sapply(index$projects, function(x) x$name)

loadData <- function()
{
	read.csv("data/sampleData.csv")
}

saveData <- function()
{}

updateIndex <- function(dat, index)
{

	projects <- levels(as.factor(dat$asset.number[which(dat$project.number == prj$label)]))
	l <- list()
	for (prj in projects)
	{

	}
	
	return(newind)
}

# df2nested <- function(dat, hier)
# {
# 	lev <- levels(as.factor(dat[[heir[0]]]))
# 	l <- list()
# 	names(l) <- rep(heir[1], length(l))
# }

# printElem <- function(l, n=0)
# {
# 	out <- NULL
# 	if (typeof(l)=="list" && length(l)>0)
# 	{
# 		cat("names of l: \n", names(l), "\n")
# 		for (i in 1:length(l))
# 		{
# 			out <- paste(sep="", 
# 				      out, 
# 				      rep("  ", n), names(l)[i], "\n",
# 				      rep("  ", n+1), printElem(l[[i]], n+1), "\n"
# 			      )
# 		}
# 	} else {
# 
# 		cat(names(l), ": ", l, "\n")
# 		out <- l
# 	}
# 	return(out)
# }

# lookupProj <- function(pnum, input){
# 	projInd <- which(sapply(
# 			index$projects, 
# 			function(x) x$label==input$pnum
# 			))
# 	currentProjAssets <- sapply(
# 				index$projects[[projInd]]$assets, 
# 				function(x) x$label
# 				)
# 	names(currentProjAssets) <- paste(
# 			currentProjAssets,
# 			sapply(
# 				index$projects[[projInd]]$assets, 
# 				function(x) x$name
# 				),
# 			sep= " -- "
# 			)
# }

# projNames <- c("lv3.0-airframe", "rv3k", "gps")
# projNums <- c(1,2,3)
# projects <- as.list(projNums)
# names(projects) <- projNames
# lv3 <- list(
# 	name= "lv3.0-airframe", 
# 	label= "0001", 
# 	assets= list(
# 		list(label="0001", name= "18 inch module"),
# 		list(label="0002", name= "24 inch module"),
# 		list(label="0003", name= "nosecone")
# 		)
# 	)
# rv3k <- list(name= "rv3k ", label= "0002", assets= list())
# gps <- list(name= "gps ", label= "0003", assets= list())
# 
# index$projects <- list(lv3, rv3k, gps)
# write(as.yaml(index), "data/index.yaml")
