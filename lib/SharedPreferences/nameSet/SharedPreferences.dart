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
      home:HomePage() ,
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var nameController=TextEditingController();

  String name='';
  @override

  void initState() {
    super.initState();
    getValueFromPrefs();
  }
  void getValueFromPrefs()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();

    name=prefs.getString('name') ??'';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),

      body: Column(
        children: [

          Text(name !=  ''?  'Welcom , $name' :""),

          TextField(

            controller: nameController,
          ),

          Divider(),

          ElevatedButton(onPressed: ()async{
            SharedPreferences prefs= await  SharedPreferences.getInstance();
            prefs.setString('name', nameController.text);
          },

              child: Text('get value'))
        ],
      ),
    );
  }
}