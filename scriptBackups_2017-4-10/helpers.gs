
function isin(arr, targ) {
  for (var i=0; i<arr.length; i++) {
    if (arr[i] == targ)
      return true
  }
  return false
}

function trimTrailingEmpties(arr) {
  var lastNonEmpty=0
  for (var i=0; i<arr.length; i++) {
    if (arr[i]!='') {
      lastNonEmpty=i
    }
  }
  return arr.slice(0,lastNonEmpty+1)
}

function trimLeadingEmpties(arr) {
  var lastNonEmpty=arr.length-1
  for (var i=arr.length-1; i>=0; i--) {
    if (arr[i]!='') {
      lastNonEmpty=i
    }
  }
  return arr.slice(lastNonEmpty)
}

function padQuad(base){
  base=base.toString()
  var blen=base.length
//  Logger.log("blen is " + blen)
//  Logger.log("base starts as " + base)
  if (blen < 4) {
    for (var i=1; i <= 4-blen; i++) {
      base='0'.concat(base)
    }
  }
//  Logger.log("base becomes " + base)
  return base
}

function extractColumn(mat, c) {
  out=[]
//  Logger.log("mat length is " + mat.length)
//  Logger.log("out is " + out)
  for (var i=0; i<mat.length; i++) {
//    Logger.log("mat[i][c] is " + mat[i][c] + "with i="+i+" and c="+c)
    out=out.concat(mat[i][c])
//    Logger.log("out is " + out)
  }
  return out
}
