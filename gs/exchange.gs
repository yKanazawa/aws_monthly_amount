function getExchange() {
  var urlExchange = "https://api.fixer.io/latest?base=USD";
  var sheetExchange = SpreadsheetApp.getActive().getSheetByName('Exchange');
  var html = UrlFetchApp.fetch(urlExchange).getContentText();
//Browser.msgBox("test");  
  var retjson = JSON.parse(html);

  sheetExchange.getRange(1, 1, 100, 7).clear();
  sheetExchange.getRange(1, 1).setValue(retjson.date);
  sheetExchange.getRange(1, 2).setValue('1 ' + retjson.base + ' =');
  
  row = 1
  for (key in retjson.rates) {
    sheetExchange.getRange(row, 3).setValue(retjson.rates[key]);
    sheetExchange.getRange(row, 4).setValue(key);
    row++;
  }
}
