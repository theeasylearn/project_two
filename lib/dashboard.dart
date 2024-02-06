import 'package:flutter/material.dart';
import 'package:project_two/custom_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
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
                ];
              },
              color: Colors.white,
              iconColor: Colors.white,
            )
          ],
        ),
        body: LayoutBuilder(
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
                        Container(
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
                              FittedText("Shop",Color(0xff651446),45),
                            ],
                          ),
                        ),
                        Container(
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
                              FittedText("Categries",Color(0xff651446),45),
                            ],
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
                        Container(
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
                              FittedText("Cart",Color(0xff651446),45),
                            ],
                          ),
                        ),
                        Container(
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
                              FittedText("Wishlist",Color(0xff651446),45),

                            ],
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
                        Container(
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
                              FittedText("Checkout",Color(0xff651446),45),

                            ],
                          ),
                        ),
                        Container(
                          height: (constraints.maxHeight - 32) / 3,
                          width: (constraints.maxWidth - 4) / 2,
                          decoration: BoxDecoration(
                            color: Color(0xfff6d2e8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/forgot-password.png"),
                              Column(
                                children: [
                                  FittedText("Forgot password",Color(0xff651446),45),
                                ],
                              ),
                            ],
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
    );
  }
}