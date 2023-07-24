import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage01/loginpage.dart';

class registerpage extends StatefulWidget{
  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  var user_name = TextEditingController();

  var user_pass = TextEditingController();
  var conf_pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Icon(
                  Icons.lock,
                  size: 150,
                ),
                SizedBox(
                  height: 19,
                ),
                Text("wellcome to Our Community",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,

                  child: TextField(
                      obscureText: true,
                      controller: conf_pass,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "confirm password",

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
                  height: 25,
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(onPressed: (){
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: user_name.text,
                        password: user_pass.text,);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => loginpage()),
                    );




                  }, child:
                  Text("Sign Up")),

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
                      height: 15,
                      width: 55,
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'lib/images/apple.png',
                        height: 70,
                      ),
                    )

                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Alredy a member?"),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap:(){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginpage()),
                        );


                      },
                      child: Text(
                        "Login Now",
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


}