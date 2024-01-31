import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'custom_widget.dart';
class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

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