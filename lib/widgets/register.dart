import 'package:flutter/material.dart';
import 'package:login_register_pro/widgets/forgot.dart';
import 'package:login_register_pro/widgets/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
 var _auth = FirebaseAuth.instance;
 var emailEditingController = TextEditingController();
 var passEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: emailEditingController,),
            TextField(controller: passEditingController,),
            ElevatedButton(
                onPressed: () {
                  _auth.createUserWithEmailAndPassword(email: emailEditingController.text, password: passEditingController.text).then((val){
                    var user = val.user ;
                    if (user != null ){
                      print("Successfully Registered");
                    }
                    else{
                      print("Something is wrong");
                    }
                  });

                  },
                child: Text("Register")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPage()));
                },
                child: Text("Forgot Your Password")),
          ],
        ),
      ),
    );
  }
}
