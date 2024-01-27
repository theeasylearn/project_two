import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
      return Material(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset("assets/register.jpg",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              LayoutBuilder(builder: (BuildContext bc, BoxConstraints constraints){
                  return SizedBox(
                      height: constraints.maxHeight * 0.80,
                      width: constraints.maxWidth,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                Image.asset("assets/app_icon.png",height: 150,width: 150,),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email, size: 32),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email Address',
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone_android, size: 32),
                                  border: OutlineInputBorder(),
                                  labelText: 'Mobile',
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
                              TextField(
                                obscureText:true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password, size: 32),
                                  border: OutlineInputBorder(),
                                  labelText: 'Confirm Password',
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth,
                                child: MaterialButton(
                                  onPressed: () {},
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
}
