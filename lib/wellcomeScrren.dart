import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_scrren/FadeAnimation.dart';
import 'package:login_scrren/createAccount.dart';
import 'package:login_scrren/login.dart';

class WellcomeScrren extends StatefulWidget {
  @override
  _WellcomeScrrenState createState() => _WellcomeScrrenState();
}

class _WellcomeScrrenState extends State<WellcomeScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/loginBackground.png'),
                      fit: BoxFit.fill))),
          Positioned(
            top: 60,
            left: 35,
            child: FadeAnimation(
                1,
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      "Your App Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: FadeAnimation(
                1.3,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "This App Is For",
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Hold the tinsel—the rainbow eucalyptus tree doesn’t need decorations to appear festive for the holidays.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Login()),
                          ),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      2,
                      GestureDetector(
                          onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => CreateAccount()),
                              ),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 2),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueAccent,
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
