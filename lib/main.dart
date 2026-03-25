import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:personal_library/configs/routes.dart';
import 'package:personal_library/views/login.dart';

void main() {
  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: routes,
    home: LoginScreen(),
  );
}
