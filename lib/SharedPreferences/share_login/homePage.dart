import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage1 extends StatefulWidget{
  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  var no1Controller=TextEditingController();
  String name='';

 @override
  void initState() {

    super.initState();
   getValueFromPrefs();


  }
  void getValueFromPrefs()async{
   SharedPreferences prefs=await SharedPreferences.getInstance();

   //if null

  name= prefs.getString('name') ?? "";

  setState(() {});
  }


  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: Text('HomePage'),
       ),
       backgroundColor: Colors.yellow,
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             //trenary operation:
             Text(name != '' ? 'welcom, $name':''),

             TextField(
               controller:no1Controller,
             ),

           Center(
             child: ElevatedButton(onPressed: ()async{
               SharedPreferences prefs=  await SharedPreferences.getInstance();
               prefs.setString('name', no1Controller.text);

               setState(() {});

             },child: Text('save')),
           )


           ],
         ),
       ),
     );
  }
}