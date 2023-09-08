import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPage extends StatelessWidget {
  var _auth = FirebaseAuth.instance;

  var emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Forgot Page"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: emailEditingController,),
            ElevatedButton(onPressed: (){
              _auth.sendPasswordResetEmail(email: emailEditingController.text).then((val){
                print("Password Sucessfullys sent");
              });
            }, child: Text("Submit")),
          ],
        ),
      ),
    );
  }

}
