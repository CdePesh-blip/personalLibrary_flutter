import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Signupcontroller extends GetxController {
  late String fullname;
  late String email;
  late String password;
  late String confirmPassword;

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  bool signup(String name, String mail, String pass, String confirm) {
    fullname = name;
    email = name;
    password = pass;
    confirmPassword = confirm;

    if (fullname.isEmpty || email.isEmpty || password.isEmpty) {
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return false;
    }
    return true;
  }

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
}
