import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_widget.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 75,
        width: double.infinity,
        color:Color(0xff6c164b),
        child: Center(
          child: Container(
            height: 50,
            width: 225,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xfff6d2e8),
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("Checkout ",style: GoogleFonts.titilliumWeb(
              textStyle: TextStyle(
                fontSize: 30,
                color: Colors.black,
                  fontWeight: FontWeight.bold,
              )
            ),),
          ),
        ),
      ),
      body: Material(
          child: Container(
            height: 725,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
              return Container(
                height: 250,
                width: double.infinity,
                child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network("https://loremflickr.com/150/150"),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FittedText("Product - 1", Colors.black, 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedText("2500", Colors.black, 20),
                                  FittedText("x 2", Colors.black, 20),
                                  FittedText("=5000", Colors.black, 20),
                                ],
                              ),
                              SizedBox(
                                width: 200,
                                child: Text("Product Description goes here. "
                                    "\n it can be many lines. and provide detail "
                                    "\n about product"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 180,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xff6c164b),
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Text("0",style: GoogleFonts.titilliumWeb(
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),),),
                                    ),
                                    CircleAvatar(
                                      child: Icon(Icons.remove),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ]
                  ),
                ),
              );
            }),
          )
      ),
    );
  }
}