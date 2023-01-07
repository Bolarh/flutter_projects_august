import 'dart:convert';

import 'package:august_project/controllers/foodControllers/user%20pref.dart';
import 'package:august_project/food_ui/signup.dart';
import 'package:august_project/main%20screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:august_project/foodClassModels/user mode.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/foodControllers/get storage.dart';
import '../services/auth services.dart';


class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);


  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {

  TextEditingController passController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController nameController = TextEditingController();


  
  login() async{
    
    var response = await http.post(Uri.parse("http://192.168.204.251/api/foods/loginUserFoods.php"), body:{
    'username': nameController.text.trim(),
    'password': passController.text.trim()
    }
    );

    if(response.statusCode == 200){
      var resBody = json.decode(response.body);
      if(resBody['success'] == true){
        Fluttertoast.showToast(msg: "Logged in",);
        Get.to(()=> mainScreen());

        setState(() {
          nameController.clear();
          passController.clear();
        });

      User userInfo = User.fromJson(resBody["userData"]);
     GetStorage().write('user',userInfo);


   //await RememberUser.saveRemUser(userInfo);


      } else {
        Fluttertoast.showToast(msg: "Check email and password");
      }
    }
    
    
  }

  bool isToggle = false;

void _toggle(){
  setState(() {
    isToggle = !isToggle;
  });
}

@override
  void initState() {
    // TODO: implement initState
  _toggle();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //logo icon

                    // hello text
                  Text(
                    "Hello Again!",
                    style: TextStyle(
                        fontSize: 35,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo
                    ),
                  ),
                    SizedBox(height:15),
                    // welcome back text
                    _welcome(),
                    SizedBox(height: 70.0,),
                    //textfield
                    Padding(
                      padding: const EdgeInsets.only(left:10.0, right:10),
                      child: TextField(
                         controller: nameController,
                          decoration: InputDecoration(
                              hintText: "Username",hintStyle: TextStyle(
                              color: Colors.black45
                          )
                          )
                      ),
                    ),

                    SizedBox(height:MediaQuery.of(context).size.height*0.03),

                    //  _email(),

                    Padding(
                      padding: const EdgeInsets.only(left:10.0, right:10),
                      child: TextField(
                        obscureText: isToggle,
                          controller: passController,
                          decoration: InputDecoration(
                              hintText: "Password",hintStyle: TextStyle(
                              color: Colors.black45
                          ),
                            suffixIcon: IconButton(
                                icon: Icon(isToggle? Icons.visibility_off: Icons.visibility, color: Colors.indigo,),
                              onPressed: () {
                                  _toggle();
                              },
                            ),


                          )
                      ),
                    ),

                    SizedBox(height:MediaQuery.of(context).size.height*0.04),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10.0, right:10),
                              child: Text("Sign in", style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),

                              ),
                            ),

                            InkWell(
                              onTap: (){
                                login();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.indigo,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                    SizedBox(height:MediaQuery.of(context).size.height*0.08),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10.0, right:10),
                          child: InkWell(
                            onTap: (){
                              Get.to(()=> SignUp());
                            },
                            child: Text("Sign up", style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),

                            ),
                          ),
                        ),

                        Text("Forgot Password", style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),

                        ),



                      ],
                    )


                  ],
                ),
              ),
            ),
          ),
        )

    );
  }



  _welcome() {
    return Text(
      "Login and make your order",
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }

  void wrongEmailMsg() {
    showDialog(context: context, builder: (context){
     return AlertDialog(
        title: Text("Email doesn't exist"),
      );
    }
    );


  }

  void wrongPassword() {
    showDialog(context: context , builder: (context)
    {
      return AlertDialog(
        title: Text("Wrong password"),
      );
    }
    );


  }

  // _userTextField() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(11),
  //           color: Colors.grey[200],
  //           border: Border.all(color: Colors.white)
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 11),
  //         child: TextField(
  //             decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 hintText: "Enter username"
  //             )
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // _passwordTextField() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal:25.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(11.0),
  //         border: Border.all(color: Colors.white),
  //         color: Colors.grey[200],
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.only(left:8.0),
  //         child: const TextField(
  //           obscureText: true,
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             hintText: "Enter Password",
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // _signInButton() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal:25.0),
  //     child: GestureDetector(
  //       onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => mainScreen())),
  //       child: Container(
  //         padding: EdgeInsets.all(18),
  //         decoration: BoxDecoration(
  //           color: Colors.deepPurple,
  //           borderRadius: BorderRadius.circular(11.0),
  //         ),
  //         child: Center(
  //           child: Text(
  //             "Login", style: TextStyle(
  //             fontSize: 14,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //           ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // _signUp() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//             "Not a member?", style: TextStyle(
//           fontWeight: FontWeight.bold,
//         )
//         ),
//         Text("Register",
//             style: TextStyle(
//               color: Colors.lightBlueAccent,
//               fontWeight: FontWeight.bold,
//             ))
//       ],
//     );
//   }
 }

class newLogin extends StatefulWidget {
  const newLogin({Key? key}) : super(key: key);

  @override
  _newLoginState createState() => _newLoginState();
}

class _newLoginState extends State<newLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Icon(Icons.android,
                  size: 100,),
                SizedBox(height: 70.0),

                // Hello Again
                _HelloAgain(),
                SizedBox(height: 15.0),

                //welcome
                _welcome(),
                SizedBox(height:20),

                //usermane
                _username(),
                SizedBox(height:15),

                //password textfield
                _password(),
                SizedBox(height:20),

                //button
                _button(),
                SizedBox(height: 10.0),
                //signup
                _signUp(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  _HelloAgain() {
    return Text(
        "Hello Again!" ,style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    )
    );
  }

  _welcome() {
    return Text(
        "welcome to the new android world", style: TextStyle(
      fontSize: 12,
    )
    );
  }

  _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:25.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
            border: Border.all(color: Colors.white)
        ),

        child: Padding(
          padding: const EdgeInsets.only(left:10.0, right:10),
          child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "enter username"
              )
          ),
        ),
      ),
    );
  }

  _password() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:25.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
            border: Border.all(color: Colors.white)
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter password"
              )
          ),
        ),
      ),
    );
  }

  _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:25.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple,
        ),
        child: Center(
          child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
              )
          ),
        ),
      ),
    );
  }

  _signUp() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text("Not a member?", style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
          Text("Register", style: TextStyle(
            color:Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ))
        ]
    );
  }
}