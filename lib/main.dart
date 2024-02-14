import 'package:flutter/material.dart';
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
import 'package:project_two/wishlist.dart';
import 'package:overlay_support/overlay_support.dart';
void  main() {
  runApp(OverlaySupport.global(child: GetMaterialApp(home: Category())));
}
