import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='Loading...';
  void getworldtime() async{
    WorldTime instance=WorldTime(location: 'Kolkata',url: 'Asia/Kolkata',flag: 'alpha.jpg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',
      arguments: {
      'location':instance.location,
       'flag': instance.flag,
      'time':instance.time,
        'isDayTime':instance.isDayTime,
    },
    );
    print(instance.time);
    setState(() {
      time=instance.time;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('hello init');
    getworldtime();
  }
  @override
  Widget build(BuildContext context) {
    // print('build running');
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child:SpinKitPumpingHeart(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
