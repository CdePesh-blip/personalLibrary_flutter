import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:personal_library/configs/colors.dart';
import 'package:personal_library/controllers/logincontroller.dart';

import 'package:http/http.dart' as http;
import 'package:personal_library/views/signup.dart';

Logincontroller logincontroller = Get.put(Logincontroller());
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      /*appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            "Login Screen",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),*/
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/app.png', height: 100, width: 150),
              /*
                Text(
                  "Login Screen",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                */
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Enter username",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ), //makes the edges softer
                  hintText: "Use email or phone number",
                  prefixIcon: Icon(Icons.person), //desplays the icins
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  0,
                  0,
                  0,
                ), //applies padding to all sides
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => TextField(
                  controller: password,
                  obscureText: !logincontroller.isPasswordVisible.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter password here",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(
                        logincontroller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        logincontroller.togglePassword();
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              MaterialButton(
                onPressed: () async {
                  if (username.text.isEmpty) {
                    Get.snackbar("Error", "Enter username");
                  } else if (password.text.isEmpty) {
                    Get.snackbar("Error", "Enter password");
                  } else {
                    final response = await http.get(
                      Uri.parse(
                        "http://10.0.2.2/library_api/login.php?phone=${phone.text}&password=${password.text}",
                      ),
                    );
                    if (response.statusCode == 200) {
                      final serverData = jsonDecode(response.body);
                      if (serverData['code'] == 1) {
                        String phone = serverData["userdetails"][0]["phone"];
                        print(phone); //store in shared preferences
                        Get.toNamed('/homescreen');
                      } else {
                        Get.snackbar(
                          "Wrong Credentials",
                          serverData["message"],
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Server Error",
                        "Error occured while logging in",
                      );
                    }
                  }
                },
              ), // we must specify what this butoon does when it is pressed. () for no name
              Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor3,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Get.offAndToNamed("/homescreen");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Row(
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 5),
                    GestureDetector(
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                      onTap: () {
                        Get.toNamed("/signup");
                      },
                    ),
                    Spacer(),
                    Text("Forgot password?"),
                    SizedBox(width: 5),
                    Text("Reset", style: TextStyle(color: Colors.pinkAccent)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
