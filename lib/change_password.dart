import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'common_functions.dart';
class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  TextEditingController PasswordController = new TextEditingController();
  TextEditingController ConfirmNewPasswordController = new TextEditingController();
  TextEditingController NewPasswordController = new TextEditingController();
  String Password='',NewPassword='', ConfirmNewPassword='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PasswordController.addListener(() {
        if(PasswordController.text != '')
          Password = PasswordController.text;
    });
    NewPasswordController.addListener(() {
      if(NewPasswordController.text != '')
        NewPassword = NewPasswordController.text;
    });
    ConfirmNewPasswordController.addListener(() {
      if(ConfirmNewPasswordController.text != '')
        ConfirmNewPassword = ConfirmNewPasswordController.text;
    });

  }
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        Image.asset(
          "assets/change_password.gif",
          fit: BoxFit.cover, // Try using BoxFit.cover for a better fit
          width: double.infinity, // Make sure the image takes the full width
          height: double.infinity, // Make sure the image takes the full height
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Image.asset(
                    "assets/app_icon.png",
                    height: 120,
                  ),
                  Text(
                    "Change Password",
                    style: GoogleFonts.titilliumWeb(
                        textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          controller: PasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password, size: 32),
                            border: OutlineInputBorder(),
                            labelText: 'Enter old password',
                          ),
                        ),
                        TextField(
                          controller: NewPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password, size: 32),
                            border: OutlineInputBorder(),
                            labelText: 'Enter new password',
                          ),
                        ),
                        TextField(
                          controller: ConfirmNewPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password, size: 32),
                            border: OutlineInputBorder(),
                            labelText: 'Re-enter new password',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 40,
                            weight: 70,
                          ),
                          height: 65,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff3B5DBA),
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: (){
                              bool isValid = isValidInput();
                              if(isValid == true)
                              {
                                  SendRequest();
                              }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Change Password",style: GoogleFonts.titilliumWeb(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                            height: 65,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Color(0xffF15487),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  bool isValidInput() {
      if(Password.trim().length==0)
      {
        toast("password can not be blank");
        return false;
      }
      if(NewPassword.trim().length==0)
      {
        toast("New password can not be blank");
        return false;
      }
      if(ConfirmNewPassword.trim().length==0)
      {
        toast("Confirm New password can not be blank");
        return false;
      }
      if(NewPassword != ConfirmNewPassword)
      {
        toast("New password and confirm new password are not same");
        return false;
      }
      return true;
  }
  void SendRequest() {
    String ApiAddress = Common.getBase() + "change_password.php";
  }
}
