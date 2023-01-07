import 'package:august_project/controllers/foodControllers/currrent%20user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:august_project/foodClassModels/user mode.dart';

import '../controllers/foodControllers/login controller.dart';

class profilePage extends StatelessWidget {
  //const profilePage({Key? key}) : super(key: key);

  //final CurrentUser _currentUser = Get.put(CurrentUser());


  

  final data = GetStorage().read('user');








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back),
                        Text(
                          "Edit",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.019,
                    ),

                    //first section

                    Row(
                      children: [
                        //avatar
                        CircleAvatar(
                          // backgroundImage: ,
                          backgroundColor: Colors.grey[800],
                        ),

                        SizedBox(width: 25),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name of user
                            Text(
                              'yes',
                              // logincontroller.signinacc.value ?.displayName ??'',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.019,
                            ),

                            Text(
                             "$data['username']",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 18.0),
                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.019),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email),
                            SizedBox(
                              width: 20,
                            ),
                            Text("_currentUser.user.email"

                                ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 12.0),
                            child: Text(
                              "VERIFY",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.019),

            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Text("Location"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.person,
                            color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Text("Change password"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet,
                            color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Text("Shipping"),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet,
                            color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Text("Payment"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.019),

            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("App Notifications"),
                          Icon(Icons.toggle_off_outlined,
                              color: Theme.of(context).primaryColor),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Location Tracking",
                        ),
                        Icon(Icons.toggle_on_outlined,
                            color: Theme.of(context).primaryColor),
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.019),
            //lastContainer()
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Log out",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.021,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Delete account",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
