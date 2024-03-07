import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_two/cart.dart';
import 'package:project_two/category.dart';
import 'package:project_two/change_password.dart';
import 'package:project_two/checkout.dart';
import 'package:project_two/custom_widget.dart';
import 'package:project_two/forgot_password.dart';
import 'package:project_two/login.dart';
import 'package:project_two/product.dart';
import 'package:project_two/product_detail.dart';
import 'package:project_two/register.dart';
import 'package:project_two/row_column_example.dart';
import 'package:project_two/wishlist.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_two/dashboard.dart';

void  main() {
  // runApp(OverlaySupport.global(child: GetMaterialApp(home: RowColumnExample())));
   runApp(OverlaySupport.global(child: GetMaterialApp(home: HomeScreen())));
  //runApp(OverlaySupport.global(child: GetMaterialApp(home: Dashboard())));

}
class HomeScreen extends StatelessWidget {
  FlutterSecureStorage storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: storage.read(key: 'userid'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // Handle error if any
            return Text('Error: ${snapshot.error}');
          } else {
            // Retrieve the value from the storage
            String? value = snapshot.data;

            Widget screenToOpen;
            if (value == null)
              screenToOpen = Register();
            else if (value == '-1')
              screenToOpen = Login();
            else
              screenToOpen = Dashboard();

            // Execute code after .then method executed
            // For example, you can print a message or perform additional actions
            print('Code after .then executed');

            return screenToOpen;
          }
        } else {
          // Show a loading indicator while waiting for the future to complete
          return CircularProgressIndicator();
        }
      },
    );
  }
}
