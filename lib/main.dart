// ignore: import_of_legacy_library_into_null_safe
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String  clockType="Digital";
  bool isChecked=false;
  var dateAndTime = DateTime.now();

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.green[900],
            title: Text('Clock'),
          ),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 400),
              Container(
                width: 210,
                height: 210,
                child:isChecked==false?
                AnalogClock(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.black),
                      color: Colors.black,
                      shape: BoxShape.circle),
                  width: 200.0,
                  isLive: true,
                  hourHandColor: Colors.white,
                  minuteHandColor: Colors.white,
                  showSecondHand: true,
                  numberColor: Colors.white,
                  showNumbers: true,
                  textScaleFactor: 1.5,
                  showTicks: true,
                  // showDigitalClock: true,
                  // digitalClockColor: Colors.white,
                  datetime: DateTime(2020, 8, 4, 9, 11, 0),
                ):Container(
                  width: 200,
                  height: 50,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DigitalClock(
                          digitAnimationStyle: Curves.elasticOut,
                          is24HourTimeFormat: false,
                          areaDecoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          hourMinuteDigitTextStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 50,
                          ),
                          amPmDigitTextStyle: TextStyle(
                              color: Colors.blueGrey, fontWeight: FontWeight.bold),
                        ),


                      ],
                    ),
                  ),
                )
              ),
              Container(
                width: 150,
                height: 30,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.5),
                  color: Colors.white,
                ),
                child: Center(
                    child: Text(
                  " ${dateAndTime.day}-${dateAndTime.month}-${dateAndTime.year}",
                  style: TextStyle(fontSize: 18),
                )),
              ),

              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RaisedButton(onPressed: (){
                    setState(() {
                      if(isChecked==false){
                        isChecked=true;
                        clockType="Analog";
                      }
                      else{
                        isChecked=false;
                        clockType="Digital";

                      }
                    });
                  },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    splashColor: Colors.orange,
                    color: Colors.lightGreen,
                  child: Text("$clockType"),),
                ],
              )
            ],
          ),
        ),
      );
}
