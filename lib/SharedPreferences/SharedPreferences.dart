
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

  //result:
  String name='';
  @override

  //app open huar loge loge get hoi jai
  void initState() {
    super.initState();

    //nije function bonai
    getValueFromPrefs();

    ///value fect
  }
  void getValueFromPrefs()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();

    //if null =key judi corect nhoi aru key judi value get hua nai tatia
    //null dekha dibo blank value ,judi value ahi jai tatia value get hobo
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

          //shoew value:
          //not equal blank mane judi blank equal nhoi tatia name ahi jabo ,
          //judi blank equal hoi blank show kuribo
          Text(name !=  ''?  'Welcom , $name' :""),

          TextField(

            controller: nameController,
          ),

          Divider(),


          //Async okl nije bona functiont he binabo pare:
          ElevatedButton(onPressed: ()async{

            //prefernc kam hoingl :
            SharedPreferences prefs= await  SharedPreferences.getInstance();

            //prefrence ki store kurino khitu mantion :
            prefs.setString('name', nameController.text);
          },
              //value store
              child: Text('get value'))


        ],
      ),
    );
  }
}