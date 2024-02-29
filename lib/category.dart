import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
import 'custom_widget.dart';
import 'dart:convert';
import 'package:project_two/product.dart';
class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  //list
  var categories = []; //empty list
  FlutterSecureStorage storage = new FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  Future<void> SendRequest() async {
    String ApiAddress = "http://www.theeasylearnacademy.com/shop/ws/category.php";
    var url = Uri.parse(ApiAddress);
    try
    {
      var response = await http.get(url);
      print(response.statusCode);
      print(response.body);

      try {
        var data = json.decode(response.body);
        print(data);

          // Parsing successful
          print(data[0]['error']);
          print(data[1]['total']);
          print(data[2]['title'] + " " + data[2]['photo'] + " " + data[2]['id']);

          if (data[0]['error'] != 'no') {
            toast(data[0]['error']);
          } else if (data[1]['total'] == 0) {
            toast("No category found");
          } else {
            print("We have no error");
            data.removeAt(0);
            data.removeAt(0);

            setState(() {
              categories = data;
            });
          }
      } catch (e) {
        // Handle JSON decoding exception
        print("Error decoding JSON: $e");
        toast("oops, something went wrong, please contact administrator...");
      }
    } catch (e) {
      // Handle HTTP request exception
      print("Error making HTTP request: $e");
      toast("Error making HTTP request");
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
              return InkWell(
                onTap: () {
                    storage.write(key: 'categoryid', value: categories[index]['id']);
                    Navigator.push(context,new MaterialPageRoute(builder: (context) => Product()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child:
                    Image.network("http://theeasylearnacademy.com/shop/images/category/" + categories[index]['photo']
                    ,fit: BoxFit.cover,
                    )),
                    Container(
                    alignment: Alignment.center,
                    color: Color(0xff651446),
                      padding: EdgeInsets.all(08),
                      child:   MyText(categories[index]['title'],Colors.white),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}