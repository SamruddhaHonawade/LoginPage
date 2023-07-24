import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';
import 'main.dart';

class authpage extends StatelessWidget{
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
        StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){

            //user logged in
            if(snapshot.hasData){
              return MyHomePage(title: 'SAMRUDDHA');
              print("samm");

            }
            else
              return  loginpage();
          },
        )
    );
  }

}