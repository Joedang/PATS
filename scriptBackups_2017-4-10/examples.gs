function examples() {
  Logger.log('asdf'.length)
  Logger.log(Utilities.formatString('%4d', 1))
  Logger.log(padQuad('1'))
  var s="asdf"
  Logger.log(s.length)
  
//  // show me what you got:
//  // Logger.log("SpreadsheetID is " + spreadID)
//  // Logger.log("Spreadsheet name is " + spread.getName())
//  // Logger.log("sheet name is " + sheet.getSheetName())
//  var Brange=sheet.getRange("B2:B")
//  // Logger.log("column of B is " + Brange.getColumn())
//  // Logger.log("row of B is " + Brange.getRow())
//  // Logger.log(Brange.getValues())
//    Logger.log("The names of the data are " + dataNames)
//  Logger.log("The data are " + dataMatrix)
//  Logger.log("element 2,3 of that is " + dataMatrix[2][3])
//  Logger.log(spread)
//  
//    Logger.log(sheet)
//  for (var i=1; i<=5; i++) {
//    Logger.log(i)
//  }
//  Logger.log("length of dataNames is " + dataNames.length)
//  Logger.log("<length-1> position of dataNames is " + dataNames[dataNames.length-1])
//  Logger.log("zeroth of dataNames is " + dataNames[0])
//  var x=[1,2,3,4,5,'','']
//  y=['a','b','c','d']
//  Logger.log("x is " + x)
//  Logger.log("x.slice(0,2) is " + x.slice(0,2))
//  Logger.log("trimTrailingEmpties(x) is " + trimTrailingEmpties(x))
////  Logger.log(x)
////  Logger.log(x.length)
////  Logger.log(isin(x, 3)) // true
////  Logger.log(isin(x, 50)) // false
////  Logger.log(isin(dataNames, "Timestamp")) // true
////  Logger.log(form.getItems(FormApp.ItemType.LIST)[1].getTitle()) // dummy dropdown
//  var dummyDropdown=form.getItems(FormApp.ItemType.LIST)[1].asListItem()
//  dummyDropdown.setChoiceValues(['stuff','things','places']) // This is how you set the values of a dropdown!
}

