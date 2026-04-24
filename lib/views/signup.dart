import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:personal_library/configs/colors.dart';

import 'package:http/http.dart' as http;
import 'package:personal_library/controllers/signupcontroller.dart';

Signupcontroller signupController = Get.put(Signupcontroller());
TextEditingController fullname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController title = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmPassword = TextEditingController();

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor2,
      //   title: Text(
      //     "Sign in",
      //     style: TextStyle(fontSize: 30, color: Colors.white),
      //   ),
      //   centerTitle: true,
      // ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Image.asset("assets/boss.png", height: 100, width: 100),
                      //SizedBox(height: 20),
                      Text(
                        "Full Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: fullname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter your full name",
                    hintStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter your email",
                    hintStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Phone ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: phone,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter your phone number",
                    hintStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Title ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: title,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Mr, Ms, Mrs",
                    hintStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.title),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: password,
                  obscureText: signupController.isPasswordVisible.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: confirmPassword,
                  obscureText: signupController.isPasswordVisible.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter password again",
                    hintStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      if (fullname.text.isEmpty) {
                        Get.snackbar("Error", "Please enter first name");
                      } else if (email.text.isEmpty) {
                        Get.snackbar("Error", "Please enter email name");
                      } else if (password.text.isEmpty ||
                          confirmPassword.text.isEmpty ||
                          password.text.toString().compareTo(
                                confirmPassword.text.toString(),
                              ) !=
                              0) {
                        Get.snackbar(
                          "Error",
                          "Password and Password confirmation be none empty and matching",
                        );
                      } else {
                        final response = await http.get(
                          Uri.parse(
                            "http://10.7.18.6/library_api/signup.php?fullname=${fullname.text}&email=${email.text}&password=${password.text}&title=${title.text}&phone=${phone.text}",
                          ),
                        );
                        if (response.statusCode == 200) {
                          final serverData = jsonDecode(response.body);
                          if (serverData['success'] == 1) {
                            Get.snackbar("Success", "You are registered");
                            Get.offAndToNamed("/");
                          }
                        } else {
                          Get.snackbar("Registration", "Registration  Failed");
                        }
                      }
                    },
                    textColor: AppColors.primaryColor3,
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey.shade400),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("or", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey.shade400),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     FlutterSocialButton(
                //       onTap: () {},
                //       mini: true,
                //       buttonType: ButtonType.apple,
                //     ),
                //     GestureDetector(
                //       onTap: () {},
                //       child: Image.asset('assets/google.png', height: 30),
                //     ),
                //   ],
                // ),
                Text("Already have an acount?"),
                GestureDetector(
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                  onTap: () {
                    Get.toNamed("/");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
