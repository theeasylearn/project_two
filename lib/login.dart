import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email, size: 32),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email Address',
                                ),
                              ),
                              TextField(
                                obscureText:true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password, size: 32),
                                  border: OutlineInputBorder(),
                                  labelText: 'password',
                                ),
                              ),
                              SizedBox(
                                width: constraint.maxWidth,
                                child: MaterialButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
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
}
