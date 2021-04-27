import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'pages/home.dart';
void main() {
  runApp(MaterialApp(
    // home:Home(),
    // initialRoute: '/home',
    routes: {
      '/':(context){
        return Loading();
      },
      '/location':(context){
        return ChooseLocation();
      },
      '/loading':(context){
        return Loading();
      },
      '/home':(context){
        return Home();
      }
    },
  ));
}


