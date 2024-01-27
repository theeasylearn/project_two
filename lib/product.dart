import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_two/custom_widget.dart';

class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return  Material(child: Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              maxRadius: 10,
              backgroundColor: Colors.white,
              child: FlutterLogo(),
            ),
          ),
          title: MyText("Online Shop",Colors.white,40),
          backgroundColor: Color(0xff6c164b)),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.40
          ),delegate: SliverChildBuilderDelegate((context,index)
          {
              return InkWell(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Image.network("https://loremflickr.com/200/400"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText("IPhone - 15"),
                              InkWell(
                                child: Icon(Icons.shopping_bag_outlined),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("Rs 1,48,000",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),textDirection: TextDirection.ltr,),
                        )
                    ],
                ),
              );
          },childCount:6),)
        ],
      ),
    ),);
  }
}
