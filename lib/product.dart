import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_two/custom_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_two/product_detail.dart';
class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product>
{
  FlutterSecureStorage storage = new FlutterSecureStorage();
  var product = []; //empty list (array)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get category id from storage
    storage.read(key: 'categoryid').then((categoryid){
          SendRequest(categoryid);
    });
  }
  Future<void> SendRequest(String? categoryid) async
  {
    String ApiAddress = "http://www.theeasylearnacademy.com/shop/ws/product.php?categoryid=$categoryid";
    print(ApiAddress);
    //call api
    var response = await http.get(Uri.parse(ApiAddress));
    print(response.body);
    var data = json.decode(response.body);
    print(data);
    //create variable to store error detail
    String error = data[0]['error'];
    if(error !='no')
      toast(error);
    else if(data[1]['total'] == 0)
    {
      toast('no product available in this category');
    }
    else
    {
      //remove 1st object
      data.removeAt(0);
      data.removeAt(0);
      setState(() {
        product = data;
      });
    }
  }
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
            childAspectRatio: 0.50
          ),delegate: SliverChildBuilderDelegate((context,index)
          {
              return InkWell(
                onTap: (){
                  Navigator.push(context,new MaterialPageRoute(builder: (context) => new ProductDetail(product[index]['id'])));
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Expanded(child:
                        Image.network("http://www.theeasylearnacademy.com/shop/images/product/" + product[index]['photo'],
                        fit: BoxFit.cover,)
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(product[index]['title']),
                              InkWell(
                                child: Icon(Icons.shopping_bag_outlined),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("Rs" + product[index]['price'],style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),textDirection: TextDirection.ltr,),
                        )
                    ],
                ),
              );
          },childCount:product.length),)
        ],
      ),
    ),);
  }
}
