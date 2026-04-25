import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:personal_library/configs/colors.dart';
import 'package:personal_library/controllers/logincontroller.dart';

import 'package:http/http.dart' as http;

Logincontroller logincontroller = Get.put(Logincontroller());
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF945c9c),
      //backgroundColor: AppColors.loginBackground,
      /*appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            "Login Screen",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),*/
      body: Center(
        child: SizedBox(
          width: 450,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFefc6f5),
                  Color(0xFFbb84c2),
                  Color(0xFF945c9c),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/book_logo.jpg',
                      height: 100,
                      width: 150,
                    ),
                    /*
                    Text(
                      "Login Screen",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                    */
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(15),
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
                      controller: emailController,
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
                        controller: passwordController,
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
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                        ),

                        onPressed: () async {
                          print("Button tapped!");
                          print("Email: ${emailController.text}");
                          try {
                            final url =
                                "http://10.7.13.20/library_api/login.php?email=${emailController.text}&password=${passwordController.text}";
                            print("Calling: $url");
                            final response = await http.get(Uri.parse(url));
                            print("Status: ${response.statusCode}");
                            print("Body: ${response.body}");
                            final serverData = jsonDecode(response.body);
                            if (serverData['code'] == 1) {
                              Get.offAndToNamed('/homescreen');
                            } else {
                              Get.snackbar(
                                "Wrong Credentials",
                                serverData["message"] ?? "Invalid",
                              );
                            }
                          } catch (e) {
                            print("ERROR: $e");
                            Get.snackbar("Error", e.toString());
                          }
                        },
                        child: Text(
                          "log in",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),

                    // we must specify what this butoon does when it is pressed. () for no name
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: Row(
                        children: [
                          Flexible(child: Text("Don't have an account?")),
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
                          Text(
                            "Reset",
                            style: TextStyle(color: Colors.pinkAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
