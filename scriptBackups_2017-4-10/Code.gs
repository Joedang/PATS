function myFunction() {
  // check out https://developers.google.com/apps-script/reference/forms/
  // for documentation of Google Apps Scripts (GAS)
  
  // ~~~~~ Open the relevant stuff ~~~~~ //
  // get the form this script is bound to:
  var form=FormApp.getActiveForm()
  // get the form's user interface:
  var ui=FormApp.getUi()
  // get the Spreadsheet that holds the form inputs:
  var spreadID=form.getDestinationId()
  var spread=SpreadsheetApp.openById(spreadID)
  var sheet=spread.getSheets()[0]
  var dataNames=sheet.getRange("A1:1").getValues()[0]
  var dataMatrix=sheet.getRange("A2:I").getValues()


  // ~~~~~ Generate the Project Dropdown ~~~~~ //
  var indexSheet=spread.getSheets()[1]
  var projChoiceArr=[]
  var projNumArr=indexSheet.getRange("B1:1").getValues()[0]
  projNumArr=trimTrailingEmpties(projNumArr)
  var projRepoArr=indexSheet.getRange("B2:2").getValues()[0]
  projRepoArr=trimTrailingEmpties(projRepoArr)
  
  for (var i=0; i<projNumArr.length; i++) {
    projChoiceArr=projChoiceArr.concat(projNumArr[i] + " " + projRepoArr[i])
  }
  var projDropdown=form.getItems(FormApp.ItemType.LIST)[0].asListItem()
  if (projDropdown.getTitle() == "Project Number") {
    projDropdown.setChoiceValues(projChoiceArr)
  }
  
  // ~~~~~ Generate the Parts Dropdown ~~~~~ //
  var dataSheet=spread.getSheets()[0]
//  Logger.log("dataSheet name is " + dataSheet.getSheetName())
  var dataAssets=dataSheet.getRange("C2:C").getValues()
  dataAssets=trimTrailingEmpties(dataAssets)
  var dataAssetNames=dataSheet.getRange("D2:D").getValues()
  dataAssetNames=trimTrailingEmpties(dataAssetNames)
//  Logger.log("asset numbers are " + dataAssets)
//  Logger.log("dataAssets[0] " + dataAssets[0])
//  Logger.log("dataAssets.length " + dataAssets.length)
//  Logger.log("padQuad(dataAssets[0]) " + padQuad(dataAssets[0][0]))
  for (var i=0; i<dataAssets.length; i++) {
//    Logger.log("dataAssets[i] is " + dataAssets[i] + "with i="+i)
    dataAssets[i]=padQuad(dataAssets[i][0])
  }
  Logger.log("asset numbers are " + dataAssets)
  var dataProjects=dataSheet.getRange("B2:B").getValues()
//  Logger.log("extractColumn(dataProjects,0) is " + extractColumn(dataProjects,0))
  dataProjects=trimTrailingEmpties(extractColumn(dataProjects,0))
  Logger.log("dataProjects are " + dataProjects)
  var dataProjNums=[]
  for (var i=0; i<dataProjects.length; i++) {
    dataProjNums=dataProjNums.concat(dataProjects[i].split(" ")[0])
  }
  Logger.log("project numbers are " + dataProjNums)
  var basicLabels=[]
  var uniqueLabelList=[]
  var labelsAndProjAndAss=[]
  var uniqueLPA=[]
//  for (var i=0; i<dataAssets.length; i++) {
    for (var i=dataAssets.length-1; i>=0; i--) {
    var basicLabel=dataProjNums[i]+"-"+dataAssets[i]
    basicLabels=basicLabels.concat(basicLabel)
    Logger.log("i="+i)
    labelsAndProjAndAss=labelsAndProjAndAss.concat(basicLabel+" "+dataProjects[i].split(" ")[1]+" "+dataAssetNames[i])
    if (!isin(uniqueLabelList, basicLabel)) {
      uniqueLabelList=uniqueLabelList.concat(basicLabel)
      uniqueLPA=uniqueLPA.concat(labelsAndProjAndAss[i])
    }
  }
  Logger.log("the basic labels are " + basicLabels)
  Logger.log("the unique labels are " + uniqueLabelList)
  var partDropdown=form.getItems(FormApp.ItemType.LIST)[1].asListItem()
  Logger.log(partDropdown.getTitle())
  if (partDropdown.getTitle() == "Asset Dropdown") {
    partDropdown.setChoiceValues(uniqueLPA)
  }
}
