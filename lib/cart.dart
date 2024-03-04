import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
import 'custom_widget.dart';
import 'common_functions.dart';
import 'dart:convert';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  FlutterSecureStorage storage = new FlutterSecureStorage();
  var userid;
  var cart = []; //empty list
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItemsFromCart();
  }
  Future<void> getItemsFromCart() async
  {
    storage.read(key:'userid').then((id) async {
      userid = id;
      String ApiAddress = Common.getBase() + "cart.php?usersid=$id";
      var response = await http.get(Uri.parse(ApiAddress));
      print(response.body);
      var data = json.decode(response.body);
      print(data);
      String error = data[0]['error'];
      if(error != 'no')
        toast(error);
      else if(data[0]['total'] == 0)
      {
          toast("cart is empty");
      }
      else
      {
        //delete 1st 2 items
        data.removeAt(0);
        data.removeAt(0);
        setState(() {
            cart = data;
        });
      }
    });

  }
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
                itemCount: cart.length,
                itemBuilder: (context, index) {
              return Container(
                height: 250,
                width: double.infinity,
                child: Card(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            "https://theeasylearnacademy.com/shop/images/product/" + cart[index]['photo'],
                            fit: BoxFit.cover,
                            height: constraints.maxHeight, // Set the height to match the parent Card
                            width: constraints.maxWidth * 0.5, // Adjust the width as needed
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FittedText(cart[index]['title'], Colors.black,18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedText(cart[index]['price'], Colors.black, 20),
                                  FittedText("x " + cart[index]['quantity'], Colors.black, 20),
                                  FittedText("=" + (int.parse(cart[index]['price']) * int.parse(cart[index]['quantity'])).toString(), Colors.black, 20),
                                ],
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.5,
                                child: Text(cart[index]['detail'].toString().substring(0,100) + "..."),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(child: Text("Send to Wishlist"),
                                      onPressed: () {
                                          String apiAddress =
                                              "https://www.theeasylearnacademy.com/shop/ws/move_to_wishlist.php?usersid="
                                              + userid + "&productid= " + cart[index]['productid'];
                                          SendRequest(apiAddress);

                                      },),
                                    ElevatedButton(child: Text("Trash"),
                                      onPressed: () {
                                        String apiAddress =
                                            "https://www.theeasylearnacademy.com/shop/ws/delete_from_cart.php?cartid="
                                                 + cart[index]['id'];
                                        SendRequest(apiAddress);

                                      },)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
                }),
          )
      ),
    );
  }

  Future<void> SendRequest(String apiAddress) async
  {
      print(apiAddress);
      var response = await http.get(Uri.parse(apiAddress));
      print(response.body);
      var data = json.decode(response.body);
      print(data);
      String error = data[0]['error'];
      if(error !='no')
        toast(error);
      else
        {
          toast(data[1]['message']);

        }
  }
}