import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: HomePageDB(),
     );
  }
}

class  HomePageDB extends StatefulWidget{
  @override
  State<HomePageDB> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDB> {

  int count =0;
  Color? backGroungColors;
  Color? myColors;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mangeCount();
  }

  mangeCount()async{

    SharedPreferences prefs=await SharedPreferences.getInstance();
   count =prefs.getInt("count") ?? 0;

    count++;

    prefs.setInt('count', count);
    //
    // if(count % 3==0){
    //   backGroungColors=Colors.primaries[Random().nextInt(Colors.primaries.length)];
    // }else{
    //   Colors.white;
    // }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    //  backgroundColor:backGroungColors ,
     backgroundColor:   count % 3==0  ? Colors.primaries [Random().nextInt(Colors.primaries.length)]: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Colors Page'),
      ),

    );
  }
}