import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynote/SharedPreferences/logoutPage/homePage.dart';
import 'package:mynote/SharedPreferences/logoutPage/logoutPage.dart';
import 'package:shared_preferences/shared_preferences.dart';





void main (){
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Splashpage(),
    );
  }
}

class Splashpage extends StatefulWidget{

  @override
  State<Splashpage> createState() => _SplashPageState();
}

class _SplashPageState extends State<Splashpage> {


  @override
  void initState()  {

    super.initState();
    getValueFromPrefs();
  }

  void getValueFromPrefs() {

    Timer( Duration(seconds: 2),()async{
      SharedPreferences prefs=await SharedPreferences.getInstance();

      bool check=prefs.getBool(LogOutPage.LOGOUTKEY) ?? false;


      Widget NavigatorTo=LogOutPage(); //flase

      if(check){    //true
        NavigatorTo=HomePage();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigatorTo,));


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(

          child: Text('LogOut',style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w900,
          ),),
        ),
      ) ,
    );
  }
}