# global.R
library("yaml")

index <- yaml.load_file("data/index.yaml")
projNums <- sapply(index$projects, function(x) x$label)
names(projNums) <- sapply(index$projects, function(x) x$name)

loadData <- loadData_csv
saveData <- saveData_csv
dat <- loadData() 
# HEADS UP: dat gets modiefied from within the UI element for the submit button via the global assignment operator (<<-).

