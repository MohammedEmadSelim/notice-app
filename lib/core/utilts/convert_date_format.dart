import 'package:intl/intl.dart';

String convertDateFormat(String dateString) {
  String formattedDate = dateString;
  var dateTime = [];
  try{
    if(dateString.contains("-")){
      dateTime = dateString.split("-");
    }else if (dateString.contains(" ")){
      dateTime = dateString.split(" ");
    }
    else {dateTime = dateString.split("/");}

    if(dateTime[0].length == 4 && dateTime[1].length == 2 ){
      formattedDate = DateFormat('yyyy-MM-dd', 'en_US').format(DateTime.parse(dateString));
    }else if(dateTime[0].length == 10){
      formattedDate = dateTime[0];
    }else{
      formattedDate = "${DateFormat.yMd().parse(dateString)}";
    }
    return formattedDate;

  }catch(e) {
    return dateString;
  }
}
// String aaa(String dateString){
//   var format = DateFormat.yMd('en_US');
//   var date = format.format(DateTime.parse(dateString));
//
// }