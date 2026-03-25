import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:personal_library/configs/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              Image.asset('assets/app.png', height: 100, width: 150),
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
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter password here",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 30),
              // MaterialButton(
              //   onPressed: () {},
              //   color: Colors.brown,
              //   textColor: Colors.white,
              //   child: Text("Login"),
              // ), // we must specify what this butoon does when it is pressed. () for no name
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
