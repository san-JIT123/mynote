import 'package:flutter/material.dart';
import 'package:mynote/SharedPreferences/logoutPage/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LogOutPage extends StatelessWidget {
  static const String LOGOUTKEY = 'logout';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          centerTitle: true,
          title: Text('LoginPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool(LOGOUTKEY, true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    LOGOUTKEY,
                    style: TextStyle(fontSize: 50),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
