import 'package:flutter/material.dart';
import 'package:login_register_pro/widgets/forgot.dart';
import 'package:login_register_pro/widgets/home.dart';
import 'package:login_register_pro/widgets/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  var _auth = FirebaseAuth.instance;
  var EmailEditingController = TextEditingController();
  var PassEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: EmailEditingController,),
            TextField(controller: PassEditingController,),
            ElevatedButton(
                onPressed: () {
                  _auth.signInWithEmailAndPassword(email: EmailEditingController.text, password: PassEditingController.text).then((val){
                    var user = val.user;
                    if (user != null){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                    else{
                      print("Something is Wrong");
                    }
                  });
                },
                child: Text("Login")),
            SizedBox(height: 12,),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text("No Account? Register Now")),
            TextButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => ForgotPage()));
            }, child: Text("Forgot Your Password")),
          ],
        ),
      ),
    );
  }
}
