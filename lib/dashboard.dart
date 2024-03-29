import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_two/cart.dart';
import 'package:project_two/change_password.dart';
import 'package:project_two/checkout.dart';
import 'package:project_two/custom_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_two/login.dart';
import 'package:project_two/wishlist.dart';

import 'category.dart';

class Dashboard extends StatelessWidget {
  FlutterSecureStorage storage = new FlutterSecureStorage();
  Dashboard({super.key});
  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              maxRadius: 10,
              backgroundColor: Colors.white,
              child: FlutterLogo(),
            ),
          ),
          title: Text(
            "Online Shop",
            style: GoogleFonts.titilliumWeb(
              textStyle: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color(0xff6c164b),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("Privacy policy")),
                  PopupMenuItem(child: Text("About us")),
                  PopupMenuItem(child: Text("Contact us")),
                  PopupMenuItem(child: Text("Logout"),onTap: () {
                    storage.write(key: 'userid', value: '-1');
                    toast("Logout successfull");
                    Get.offAll(Login());
                  },),
                ];
              },
              color: Colors.white,
              iconColor: Colors.white,
            )
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            return  doubleBackToExit(context);
          },
          child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                color: Color(0xffFAE7F3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                                _navigateToScreen(context, Category());
                            },
                            child: Container(
                              height: (constraints.maxHeight - 32) / 3,
                              width: (constraints.maxWidth - 4) / 2,
                              decoration: BoxDecoration(
                                color: Color(0xfff6d2e8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/store.png"),
                                  FittedText("Shop", Color(0xff651446), 45),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Add your onTap functionality here
                            },
                            child: Container(
                              height: (constraints.maxHeight - 32) / 3,
                              width: (constraints.maxWidth - 4) / 2,
                              decoration: BoxDecoration(
                                color: Color(0xfff6d2e8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/categories.png"),
                                  FittedText("History", Color(0xff651446), 45),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              // Add your onTap functionality here
                              _navigateToScreen(context, Cart());
          
                            },
                            child: Container(
                              height: (constraints.maxHeight - 32) / 3,
                              width: (constraints.maxWidth - 4) / 2,
                              decoration: BoxDecoration(
                                color: Color(0xfff6d2e8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/trolley.png"),
                                  FittedText("Cart", Color(0xff651446), 45),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Add your onTap functionality here
                              _navigateToScreen(context, Wishlist());
                            },
                            child: Container(
                              height: (constraints.maxHeight - 32) / 3,
                              width: (constraints.maxWidth - 4) / 2,
                              decoration: BoxDecoration(
                                color: Color(0xfff6d2e8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/shopping-cart.png"),
                                  FittedText("Wishlist", Color(0xff651446), 45),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              // Add your onTap functionality here
                              _navigateToScreen(context, Checkout());
          
                            },
                            child: Container(
                              height: (constraints.maxHeight - 32) / 3,
                              width: (constraints.maxWidth - 4) / 2,
                              decoration: BoxDecoration(
                                color: Color(0xfff6d2e8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/check-out.png"),
                                  FittedText("Checkout", Color(0xff651446), 45),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _navigateToScreen(context, ChangePassword());
                            },
                            child: Container(
                              height: (constraints.maxHeight - 32) / 3,
                              width: (constraints.maxWidth - 4) / 2,
                              decoration: BoxDecoration(
                                color: Color(0xfff6d2e8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/change_password_icon.png"),
                                  FittedText("Change password", Color(0xff651446), 45),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  DateTime? currentBackPressTime;
    Future<bool> doubleBackToExit(BuildContext context) async {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        showToast("Press back again to exit");
        return false;
      }
      return true;
    }
  }
  void showToast(String message) {
    // You can use your preferred method to display a toast
    // For simplicity, we use Get.snackbar here
    Get.snackbar(
      'Info',
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10),
    );
  }