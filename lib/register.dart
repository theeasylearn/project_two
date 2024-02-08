import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Controller
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  TextEditingController ConfirmPasswordController = new TextEditingController();
  TextEditingController MobileController = new TextEditingController();

  String email = '', password = '', mobile = '', confirmpassword = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //set listener
    EmailController.addListener(() {
      if (EmailController.text != '') email = EmailController.text;
    });

    PasswordController.addListener(() {
      if (PasswordController.text != '') password = PasswordController.text;
    });

    ConfirmPasswordController.addListener(() {
      if (ConfirmPasswordController.text != '')
        confirmpassword = ConfirmPasswordController.text;
    });

    MobileController.addListener(() {
      if (MobileController.text != '') mobile = MobileController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(
              "assets/register.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            LayoutBuilder(
                builder: (BuildContext bc, BoxConstraints constraints) {
              return SizedBox(
                height: constraints.maxHeight * 0.80,
                width: constraints.maxWidth,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/app_icon.png",
                          height: 150,
                          width: 150,
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
                          controller: MobileController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android, size: 32),
                            border: OutlineInputBorder(),
                            labelText: 'Mobile',
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
                        TextField(
                          controller: ConfirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password, size: 32),
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth,
                          child: MaterialButton(
                            onPressed: () {
                              print(email +
                                  " " +
                                  mobile +
                                  " " +
                                  password +
                                  " " +
                                  confirmpassword);
                              bool isValid = isValidInput();
                              if (isValid == true) SendRequest();
                            },
                            color: Colors.blueAccent,
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void SendRequest() {
    String apiAddress =
        "http://www.theeasylearnacademy.com/shop/ws/register.php";
    Map<String, Object> form = new Map();
    form['email'] = email;
    form['password'] = password;
    form['mobile'] = mobile;
    //call api
    try {
      var response = http.post(Uri.parse(apiAddress), body: form);
      print(response);
      /*
      1) [{"error":"input is missing"}]
        2) [{"error":"no"},{"success":"yes"},{"message":"registered successfully"}]
        3) [{"error":"no"},{"success":"no"},{"message":"email or mobile is already registered with us"}]
       */
    } catch (error) {
      print("Error decoding JSON: $e");
      toast("oops, something went wrong, please contact administrator...");
    }
  }

  bool isValidInput() {
    //for input validation
    bool isValid = true;
    if (email.trim().length == 0) {
      toast("email can not be blank");
      return false;
    }
    if (mobile.trim().length == 0) {
      toast("mobile can not be blank");
      return false;
    }
    if (password.trim().length == 0) {
      toast("password can not be blank");
      return false;
    }
    if (confirmpassword.trim().length == 0) {
      toast("confirm password can not be blank");
      return false;
    }
    if (isValidEmail(email) == false) {
      toast("it is invalid email address");
      return false;
    }
    if (mobile.trim().length != 10) {
      toast("it is invalid mobile no");
      return false;
    }
    if (password.trim() != confirmpassword.trim()) {
      toast("password and confirm password do not match");
      return false;
    }
    return isValid;
  }

  bool isValidEmail(String email) {
    // Regular expression for a simple email validation
    RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}
