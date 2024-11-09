import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mynote/SharedPreferences/share_login/homePage.dart';
import 'package:mynote/SharedPreferences/share_login/logingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

     return MaterialApp(
       home: SplashPage(),
     );
  }
}

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),() async{

      SharedPreferences prefs=await SharedPreferences.getInstance();

      bool check=prefs.getBool(LoginPage.LOGING) ?? false;

      Widget NavigatTo =LoginPage();



      // if(check){
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => HomePage1()));
      // }else{
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      // }

      //short:
      if(check){
        NavigatTo=HomePage1();
      }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>NavigatTo ,));
    },);

  }


  @override
  Widget build(BuildContext context) {


  return Scaffold(
    backgroundColor: Colors.green,

    body:Center(
      child: Container(
        color: Colors.orange,
        child: FlutterLogo(size: 200,),
      ),
    ) ,
  );
  }
}

