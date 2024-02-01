import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
import 'custom_widget.dart';
import 'dart:convert';
class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  //list
  var categories = []; //empty list
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  Future<void> SendRequest() async {
      String ApiAddress = "http://www.theeasylearnacademy.com/shop/ws/category.php";
      var url = Uri.parse(ApiAddress);
      var response = await http.get(url);
      print(response.statusCode);
      print(response.body);
      /*
      [
      0 {"error":"no"},
      1 {"total":7},
      2 {"id":"195","title":"my category","photo":"Namkeen Mart.png","islive":"1","isdeleted":"0"},
      3 {"id":"1","title":"farsan","photo":"farsan.jpg","islive":"1","isdeleted":"0"},
      {"id":"2","title":"wafers","photo":"wafers.jpg","islive":"1","isdeleted":"0"},
      {"id":"3","title":"chocolate","photo":"chocolate.jpg","islive":"1","isdeleted":"0"},
      {"id":"4","title":"biscuit","photo":"biscuit.jpg","islive":"1","isdeleted":"0"},
      {"id":"5","title":"pickles","photo":"pickles.jpg","islive":"1","isdeleted":"0"},
      {"id":"6","title":"sweets","photo":"sweets.jpg","islive":"1","isdeleted":"0"}]
       */
      //convert to json
      var data = json.decode(response.body);
      print(data[0]['error']);
      print(data[1]['total']);
      print(data[2]['title'] + " " + data[2]['photo'] + " " + data[2]['id']);
      if(data[0]['error'] != 'no')
      {
        toast(data[0]['error']);
      }
      else if(data[1]['total']==0)
      {
        toast("No category found");
      }
      else
      {
           print("we have no error");
           data.remove(0);
           data.remove(0);
           setState(() {
              categories = data;
           });
      }
  }
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
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.61),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network("http://theeasylearnacademy.com/shop/images/category/" + categories[index]['photo']),
                  Container(
                  alignment: Alignment.center,
                  color: Color(0xff651446),
                    padding: EdgeInsets.all(08),
                    child:   MyText(categories[index]['title'],Colors.white),
                  )
                ],
              );
            }),
      ),
    );
  }
}