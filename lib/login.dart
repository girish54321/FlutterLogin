import 'package:flutter/material.dart';
import 'package:login_scrren/FadeAnimation.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'inputText.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode emailFoucs = FocusNode();
  FocusNode passwordFoucs = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool password = true;

  void changePassword() {
    if (password) {
      setState(() {
        password = false;
      });
    } else {
      setState(() {
        password = true;
      });
    }
  }

  void gotoPassword(text) {
    FocusScope.of(context).requestFocus(passwordFoucs);
  }

//  void chackEmail(text){
//    if(text)
//  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: ListView(
          children: <Widget>[
            Container(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/loginBackground2.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(
                          1,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.5,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
                          )),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: FadeAnimation(
                          1,
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {})),
                    ),
                    Positioned(
                      top: 60,
                      left: 35,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text(
                                "Welcome \nBack",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                1.5,
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                143, 148, 251, .2),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      InputText(
                                        focusNode: emailFoucs,
                                        changeFous: gotoPassword,
                                        password: false,
                                        textEditingController: emailController,
                                        leftIcon: Icon(
                                          EvaIcons.emailOutline,
                                          size: 23,
                                        ),
                                        hint: "Email",
                                        rightIcon: IconButton(
                                          icon: Icon(
                                            EvaIcons.checkmark,
                                            size: 23,
                                          ),
                                          onPressed: () {
                                            changePassword();
                                          },
                                        ),
                                      ),
                                      InputText(
                                        focusNode: passwordFoucs,
                                        password: password,
                                        textEditingController:
                                            passwordController,
                                        leftIcon: Icon(
                                          EvaIcons.lock,
                                          size: 23,
                                        ),
                                        hint: "Password",
                                        rightIcon: IconButton(
                                          icon: Icon(
                                            password
                                                ? EvaIcons.eyeOff
                                                : EvaIcons.eye,
                                            size: 23,
                                          ),
                                          onPressed: () {
                                            changePassword();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            FadeAnimation(
                                2,
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
//                                gradient: LinearGradient(colors: [
//                                  Color.fromRGBO(143, 148, 251, 1),
//                                  Color.fromRGBO(143, 148, 251, .6),
//                                ])
                                    color: Colors.blueAccent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 40,
                            ),
                            FadeAnimation(
                                1.5,
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1)),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
