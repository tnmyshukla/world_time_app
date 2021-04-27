import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String location;
  String flag;
  String time;
  String url;
  bool isDayTime;
  WorldTime({this.location,this.flag,this.url});
  Future <void> getTime() async{
    // print('hello');
    Response response=await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));

    // print(response.body);
    Map data=jsonDecode(response.body);
    DateTime now=DateTime.parse(data['datetime']);

    String offset=data['utc_offset'];
    String hour=offset.substring(1,3);
    String minute=offset.substring(4,6);
    // print(hour);
    // print(minute);
    now=now.add( Duration(hours: int.parse(hour),minutes: int.parse(minute)));
    isDayTime=now.hour>6&&now.hour<20?true:false;
    // print(data['userId']);
    // print(now);
    // print('hello');
    // time=now.toString();
    time=DateFormat.jm().format(now);
  }

}