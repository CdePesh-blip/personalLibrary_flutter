import 'package:get/get.dart';
import 'package:personal_library/views/collections.dart';
import 'package:personal_library/views/homescreen.dart';
import 'package:personal_library/views/login.dart';
import 'package:personal_library/views/profile.dart';
import 'package:personal_library/views/signup.dart';

var routes = [
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignupScreen()),
  GetPage(name: "/homescreen", page: () => Homescreen()),
  GetPage(name: "/collections", page: () => Collections()),
  GetPage(name: "/profile", page: () => ProfileScreen()),
];
