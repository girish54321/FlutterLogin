import 'package:flutter/material.dart';
import 'package:login_scrren/FadeAnimation.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:email_validator/email_validator.dart';
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
  bool emailValid = true;
  String emailErrorText = null;
  String passwordErrorText = null;

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

  void chackEmail(email) {
    if (EmailValidator.validate(email)) {
      print("ALL GOOSD");
      setState(() {
        emailValid = true;
      });
    } else {
      setState(() {
        emailValid = false;
      });
      print("ERROR");
    }
  }

  void checkInputs() {
    if (EmailValidator.validate(emailController.text)) {
      setState(() {
        emailErrorText = null;
      });
    } else {
      setState(() {
        emailErrorText = "Plz Enter Vaild Email";
      });
    }

    if (passwordController.text.length < 8) {
      setState(() {
        passwordErrorText = "Passowrd Is Not Valid";
      });
    }else{
      setState(() {
        passwordErrorText = null;
      });
    }
  }

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
        backgroundColor:Color.fromRGBO(0, 89, 212, 1),
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
                              onPressed: () {
                                Navigator.pop(context);
                              })),
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
                                      borderRadius: BorderRadius.circular(5),
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
                                        errorText: emailErrorText,
                                        onChnaged: chackEmail,
                                        textInputType:
                                            TextInputType.emailAddress,
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
                                          icon: emailValid
                                              ? Icon(
                                                  EvaIcons.checkmark,
                                                  color: Colors.green,
                                                  size: 23,
                                                )
                                              : Icon(
                                                  EvaIcons.close,
                                                  color: Colors.red,
                                                  size: 23,
                                                ),
                                        ),
                                      ),
                                      InputText(
                                        errorText: passwordErrorText,
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
                              height: 15,
                            ),
                            FadeAnimation(
                                2,
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1)),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            FadeAnimation(
                                2,
                                GestureDetector(
                                  onTap: () {
                                    checkInputs();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
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
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                                2,
                                Row(children: <Widget>[
                                  Expanded(child: Divider()),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "OR",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                  ),
                                  Expanded(child: Divider()),
                                ])),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                                2,
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
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
