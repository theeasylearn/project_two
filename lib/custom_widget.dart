import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget MyText(String msg, [Color textcolor = Colors.black,double fontsize=14])
{
  return Text(
    msg,
    style: GoogleFonts.titilliumWeb(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: textcolor,
        fontSize: fontsize
        // Text color set to white
      ),
    ),
  );
}
Widget FittedText(String msg,[Color textcolor = Colors.black,double fontsize=14]) {
  return FittedBox(
    fit: BoxFit.fitWidth,
    child: MyText(msg, textcolor,fontsize),
  );
}