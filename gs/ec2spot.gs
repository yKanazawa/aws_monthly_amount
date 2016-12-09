var sheetSpot = SpreadsheetApp.getActive().getSheetByName('EC2Spot');
var urlSpot   = "http://spot-price.s3.amazonaws.com/spot.js";  // Spot Instance(last 5 minutes)

function getPriceEc2Spot() { 
  row = 2
  retjson = _getJsonEc2Spot(urlSpot);
  var types = retjson.config.regions[6].instanceTypes;
  for (n_type = 0; n_type < types.length; n_type++) {
    var type = types[n_type].type;
    var sizes = types[n_type].sizes;
    col = 1;
    sheetSpot.getRange(row, col++).setValue(type);        
    for (n_size = 0; n_size < sizes.length; n_size++) {
      col = 2;
      sheetSpot.getRange(row, col++).setValue(sizes[n_size].size);
      // linux
//      sheetSpot.getRange(row, col++).setValue(sizes[n_size].valueColumns[0].name);
      sheetSpot.getRange(row, col++).setValue(sizes[n_size].valueColumns[0].prices.USD);
      // mswin
//      sheetSpot.getRange(row, col++).setValue(sizes[n_size].valueColumns[1].name);
      sheetSpot.getRange(row, col++).setValue(sizes[n_size].valueColumns[1].prices.USD);
      row++;
    }
  }  
}

function _getJsonEc2Spot(url) {
  var html = UrlFetchApp.fetch(url).getContentText();
  // remove callback
  html = html.replace(/^callback\(/,'');
  html = html.replace(/\)/,'');
  // remove CR+LF
  html = html.replace(/[\n\r]/g,'');
  // remove space
  html = html.replace(/\s+/g,'');
  // JSON.parse
  var retjson = JSON.parse(html);
  
  return retjson
}
