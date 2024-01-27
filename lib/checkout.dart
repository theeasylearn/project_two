import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_widget.dart';

class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            maxRadius: 10,
            backgroundColor: Colors.white,
            child: FlutterLogo(),
          ),
        ),
        title: MyText("Checkout", Colors.white, 40),
        backgroundColor: Color(0xff6c164b),
      ),
      body: LayoutBuilder(
        builder: (BuildContext bc, BoxConstraints contraints ) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: contraints.maxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Fullname',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.location_solid, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Address 1',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.location_solid, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Address 2',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                            CupertinoIcons.phone_circle_fill, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Mobile',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.location_solid, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                            CupertinoIcons.map_pin_ellipse, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Pincode',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.edit, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Remarks',
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xff6c164b),
                      child: Text(
                        "Place order",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
