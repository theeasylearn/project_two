import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import 'common_functions.dart';
import 'custom_widget.dart';
import 'dashboard.dart';

class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController FullnameController = new TextEditingController();
  TextEditingController Address1Controller = new TextEditingController();
  TextEditingController Address2Controller = new TextEditingController();
  TextEditingController CityController = new TextEditingController();
  TextEditingController PincodeController = new TextEditingController();
  TextEditingController RemarksController = new TextEditingController();
  TextEditingController MobileController = new TextEditingController();
  FlutterSecureStorage storage = new FlutterSecureStorage();
  String fullname='',address1='',address2='',city='',pincode='',remarks='',mobile='',userid='';
  @override
  void initState() {
    super.initState();

    FullnameController.addListener(() {
      if (FullnameController.text.isNotEmpty) {
        setState(() {
          fullname = FullnameController.text;
        });
      }
    });

    Address1Controller.addListener(() {
      if (Address1Controller.text.isNotEmpty) {
        setState(() {
          address1 = Address1Controller.text;
        });
      }
    });

    Address2Controller.addListener(() {
      if (Address2Controller.text.isNotEmpty) {
        setState(() {
          address2 = Address2Controller.text;
        });
      }
    });

    CityController.addListener(() {
      if (CityController.text.isNotEmpty) {
        setState(() {
          city = CityController.text;
        });
      }
    });

    PincodeController.addListener(() {
      if (PincodeController.text.isNotEmpty) {
        setState(() {
          pincode = PincodeController.text;
        });
      }
    });

    RemarksController.addListener(() {
      if (RemarksController.text.isNotEmpty) {
        setState(() {
          remarks = RemarksController.text;
        });
      }
    });

    MobileController.addListener(() {
      if (MobileController.text.isNotEmpty) {
        setState(() {
          mobile = MobileController.text;
        });
      }
    });

    storage.read(key: 'userid').then((value) async {
      setState(() {
        print('original value = $value');
        userid = value.toString();
        print('userid = $userid fetched successfully.....');
      });
    });
  }
  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed to avoid memory leaks
    FullnameController.dispose();
    Address1Controller.dispose();
    Address2Controller.dispose();
    CityController.dispose();
    PincodeController.dispose();
    RemarksController.dispose();
    MobileController.dispose();
    super.dispose();
  }

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
                  children:  [
                    TextField(
                      controller: FullnameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Fullname',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: Address1Controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.location_solid, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Address 1',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: Address2Controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.location_solid, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Address 2',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: MobileController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.phone_circle_fill, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Mobile',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: CityController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.location_solid, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: PincodeController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.map_pin_ellipse, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Pincode',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: RemarksController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.edit, size: 32),
                        border: OutlineInputBorder(),
                        labelText: 'Remarks',
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        // Perform actions when the button is pressed, e.g., place order
                        bool isValid = isValidInput();
                        if(isValid == true)
                          SendRequest();
                      },
                      color: Color(0xff6c164b),
                      child: Text(
                        "Place order",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
  bool isValidInput() {

    if (fullname.isEmpty) {
      toast('Please enter your Fullname');
      return false;
    }

    if (address1.isEmpty) {
      toast('Please enter Address 1');
      return false;
    }

    if (address2.isEmpty) {
      toast('Please enter Address 2');
      return false;
    }

    if (mobile.isEmpty) {
      toast('Please enter your Mobile number');
      return false;
    }

    if (city.isEmpty) {
      toast('Please enter your City');
      return false;
    }

    if (pincode.isEmpty) {
      toast('Please enter your Pincode');
      return false;
    }

    if (remarks.isEmpty) {
      toast('Please enter your Remarks');
      return false;
    }
    return true;
  }

  Future<void> SendRequest() async {
    String apiAddress = Common.getBase() + "checkout.php";
    Map<String, Object> form = new Map();
    form['fullname'] = fullname;
    form['address1'] = address1;
    form['address2'] = address2;
    form['city'] = city;
    form['pincode'] = pincode;
    form['remarks'] = remarks;
    form['mobile'] = mobile;
    form['usersid'] = userid;
    // Add other required inputs as needed
    print(form);
    // Call the API
    try {
      var response = await http.post(Uri.parse(apiAddress), body: form);
      print(response.body);

      // Convert response into JSON
      try {
        var data = json.decode(response.body);

        // Handle API response
        String error = data[0]['error'];
        if (error != 'no') {
          toast(error);
        } else {
          String success = data[1]['success'];
          String message = data[2]['message'];
          toast(message);

          if (success == 'yes') {
            // Additional logic for successful API response
            // For example, navigating to a success screen
            Get.offAll(Dashboard());
          }
        }
      } catch (error) {
        toast("Oops, something went wrong. Please contact the administrator.");
        print(error);
      }
    } catch (error) {
      print("Error decoding JSON: $error");
      toast("Oops, something went wrong. Please contact the administrator.");
    }
  }

}
