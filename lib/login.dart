import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import 'package:project_two/dashboard.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  String email = '', password = '';
  FlutterSecureStorage storage = new FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EmailController.addListener(() {
      if (EmailController.text != '') {
        email = EmailController.text;
      }
    });

    PasswordController.addListener(() {
      if (PasswordController.text != '') {
        password = PasswordController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            "assets/login_bg.jpg",
            fit: BoxFit.cover, // Try using BoxFit.cover for a better fit
            width: double.infinity, // Make sure the image takes the full width
            height:
                double.infinity, // Make sure the image takes the full height
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: LayoutBuilder(
                  builder: (BuildContext bc, BoxConstraints constraint) {
                return SizedBox(
                  height: constraint.maxHeight * 0.60,
                  width: constraint.maxWidth,
                  child: Card(
                    color: Colors.white.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Baseline(
                        baseline: 150,
                        baselineType: TextBaseline.alphabetic,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/app_icon.png",
                              height: 200,
                              width: 200,
                            ),
                            TextField(
                              controller: EmailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email, size: 32),
                                border: OutlineInputBorder(),
                                labelText: 'Email Address',
                              ),
                            ),
                            TextField(
                              controller: PasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password, size: 32),
                                border: OutlineInputBorder(),
                                labelText: 'password',
                              ),
                            ),
                            SizedBox(
                              width: constraint.maxWidth,
                              child: MaterialButton(
                                onPressed: () {
                                  print("Button Pressed!");
                                  print("email " +
                                      email +
                                      " password " +
                                      password);
                                  SendRequest(context);
                                },
                                color: Colors.cyan,
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraint.maxWidth,
                              child: MaterialButton(
                                onPressed: () {
                                  //toast("testing");
                                },
                                color: Colors.red,
                                child: Text(
                                  "Forgot password? click here",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Future<void> SendRequest(BuildContext context) async {
    String ApiAddress = "https://www.theeasylearnacademy.com/shop/ws/login.php";

    var url = Uri.parse(ApiAddress);
    //api call
    try {
      // email,password(required)
      Map <String,Object> form = new Map();
      form['email'] = email;
      form['password'] = password;
      var response = await http.post(url,body: form);
      print(response.statusCode);
      print(response.body);
      //convert response into json format
      try
          {
            var data = json.decode(response.body);
            /*
                [0{"error":"input is missing"}]
                [0{"error":"no"},1{"success":"no"},{"message":"invalid login attempt"}]
                [0{"error":"no"},1{"success":"yes"},{"message":"login successful"},{"id":"3"}]
             */
            String error = data[0]['error'];
            if(error !='no') //yes there is an error
              toast(error);
            else
            {
                 String success = data[1]['success'];
                 String message = data[2]['message'];
                 toast(message);
                 if(success=='yes')
                 {
                   //store id of the user into storage so that it can be used in future
                    storage.write(key: 'userid', value: data[3]['id']);
                    // Navigator.push(context,new MaterialPageRoute(builder: (context)=> Dashboard()));
                   Get.offAll(Dashboard());
                 }
            }
          }
          catch(error)
          {
            print(error);
            toast("oops, something went wrong, please contact administrator...");
          }
    } catch (error) {
      toast("Internet is not available (networking error)");
      print(error);
    }
  }
}
