import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  String bgimg;
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);
    // data=ModalRoute.of(context).settings.arguments;//:data;

    bgimg=data['isDayTime']?'day.png':'night.png';
    return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$bgimg'),
                  fit: BoxFit.cover,
                )
              ),

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,120,0,0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlatButton.icon(
                          onPressed: ()async{
                            dynamic result=await Navigator.pushNamed(context, '/location');
                            setState(() {
                              data={
                                'location':result['location'],
                                'flag':result['flag'],
                                'time':result['time'],
                                'isDayTime':result['isDayTime'],
                              };
                            });
                          },
                          icon: Icon(Icons.edit_location_rounded),
                          label: Text('Choose Location')),
                      SizedBox(height:20.0),
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 32.0,
                          letterSpacing: 2.0,
                          // color: Colors.amber,
                        ),
                      ),
                      SizedBox(height:6.0),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 66.0,
                          // letterSpacing: 2.0,
                          // color:Colors.amber,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

  }
}
