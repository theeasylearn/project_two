import 'package:flutter/material.dart';
class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
/*
  http://dholerasmartcities.in/shop/ws/forgot_password.php?email=ankit3395@gmail.com
  [{"error":"input is missing"}]
  [{"error":"no"},{"success":"yes"},{"message":"please check email for password"}]
  [{"error":"no"},{"success":"no"},{"message":"invalid email address"}]
  if success is yes then display login screen & user should not be able to press back button

 */
class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            "assets/login_bg.jpg",
            fit: BoxFit.cover, // Try using BoxFit.cover for a better fit
            width: double.infinity, // Make sure the image takes the full width
            height: double.infinity, // Make sure the image takes the full height
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Center(
              child: LayoutBuilder(builder: (BuildContext bc, BoxConstraints constraint){
                return SizedBox(
                  height: constraint.maxHeight * 0.60,
                  width: constraint.maxWidth,
                  child: Card(
                    color: Colors.white.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Baseline(
                        baseline: 150,
                        baselineType: TextBaseline.alphabetic,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/app_icon.png", height: 200, width: 200,),
                            Text("Give your register email address, to get password recoveery email",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                            TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email, size: 32),
                                border: OutlineInputBorder(),
                                labelText: 'Email Address',
                              ),
                            ),
                            SizedBox(
                              width: constraint.maxWidth,
                              child: MaterialButton(
                                onPressed: () {},
                                color: Colors.cyan,
                                child: Text(
                                  "Recover my account",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
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
}
