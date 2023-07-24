import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage01/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginpage01/registerpage.dart';



class loginpage extends StatefulWidget{
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  var user_name = TextEditingController();

  var user_pass = TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  SingleChildScrollView(
        child: Center(
          child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                Icon(
                  Icons.lock,
                  size: 150,
                ),
                SizedBox(
                  height: 19,
                ),
                Text("wellcome Back User",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                SizedBox(height: 39,),
                Container(
                  width: 300,

                  child: TextField(
                      controller: user_name,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "username or email",

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.black12
                            )


                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.grey

                            )
                        ),
                        focusedBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.blue
                            )
                        ),

                      )


                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  width: 300,

                  child: TextField(
                      obscureText: true,
                      controller: user_pass,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "password",

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Colors.black12
                            )


                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.grey

                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.blue
                            )
                        ),

                      )


                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot password?"),
                    ],
                  ),
                ),

                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(onPressed: (){

                    setState(() {
                      signin();
                    });




                  }, child:
                  Text("Login")),

                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 0.1,
                ),
                Text("or continue with"),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'lib/images/google.png',
                        height: 70,
                      ),
                    ),
                    SizedBox(
                      height: 35,

                    ),

                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?"),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => registerpage()),
                        );

                      },
                      child: Text(
                        "Register now",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                        ),

                      ),
                    )
                  ],
                )

              ]
          ),
        ),
      ),

    );
  }

    Future signin() async {

    showDialog(context: context, builder: (context){
      return Center(child: const CircularProgressIndicator());

    },
    );
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user_name.text,
        password: user_pass.text,


      );

      Navigator.pop(context);

    } on FirebaseAuthException catch(e){

      if(e.code == 'user-not-found' ){

        wronguser();
        print('user not found');
      }else if(e.code ==  'wrong-password'){

        wronpass();
        print('passowrd is wrong');
      }
    }


  }

  void wronguser() {
    showDialog(
      context: context,
      builder:(context) {

    return AlertDialog(
      title: Text('Incorrect user'),
    );


    },
    );
  }

  void wronpass() {
    showDialog(
      context: context,
      builder:(context) {

        return AlertDialog(
          title: Text('Incorrect password'),
        );


      },
    );
  }
}