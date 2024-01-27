import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_widget.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
            title:  MyText("Online Shop",Colors.white,40),
            backgroundColor: Color(0xff6c164b)),
        body: GridView.builder(
            itemCount: 24,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.61),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network("https://loremflickr.com/240/320"),
                  Container(
                  alignment: Alignment.center,
                  color: Color(0xff651446),
                    padding: EdgeInsets.all(08),
                    child:   MyText("Shop",Colors.white),
                  )
                ],
              );
            }),
      ),
    );
  }
}