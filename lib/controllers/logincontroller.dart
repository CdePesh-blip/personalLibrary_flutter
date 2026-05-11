import 'package:get/get.dart';

class Logincontroller extends GetxController {
  // there has to be member function and member variable
  late String username;
  late String password;
  var isPasswordVisible = false.obs; // obs to observe the change
  var userId = ''.obs;
  var userEmail = ''.obs;

  bool login(String user, String pass) {
    username = user;
    password = pass;

    if (username == "admin" && password == "12345") {
      return true;
    } else {
      return false;
    }
  }

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
