import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});
  @override
  State<Wishlist> createState() => _WishlistState();
}
//fllowing api should be called
/*
    get list of items from wishlist
    http://dholerasmartcities.in/shop/ws/wishlist.php?usersid=1

    delete from wishlist
    http://dholerasmartcities.in/shop/ws/delete_from_wishlist.php?wishlistid=1

    Move to cart
    http://dholerasmartcities.in/shop/ws/move_to_wishlist.php?usersid=3&productid=1
*/

class _WishlistState extends State<Wishlist> {
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
            child: Text("Cart ",style: GoogleFonts.titilliumWeb(
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
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 38.5,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Color(0xff6c164b),
                                              borderRadius: BorderRadius.circular(35)
                                          ),
                                          alignment: Alignment.center,
                                          child: Text("Add to Cart",style: GoogleFonts.titilliumWeb(
                                            textStyle: TextStyle(
                                              color: Colors.white,

                                            )
                                          ),),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          height: 38.5,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Color(0xff6c164b),
                                              borderRadius: BorderRadius.circular(35)
                                          ),
                                          alignment: Alignment.center,
                                          child: Text("Remove from wishlist ",style: GoogleFonts.titilliumWeb(
                                              textStyle: TextStyle(
                                                color: Colors.white,

                                              )
                                          ),),
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
