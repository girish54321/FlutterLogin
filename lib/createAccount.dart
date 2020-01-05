import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_scrren/errorLogin.dart';
import 'package:login_scrren/home.dart';
import 'package:login_scrren/loginPost.dart';
import 'package:login_scrren/mainButton.dart';
import 'package:login_scrren/newAccount.dart';
import 'package:login_scrren/tokenRespone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FadeAnimation.dart';
import 'inputText.dart';
import 'const.dart' as Const;
import 'package:http/http.dart' as http;

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  FocusNode emailFoucs = FocusNode();
  FocusNode passwordFoucs = FocusNode();
  FocusNode nameFoucs = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool password = true;
  bool emailValid = true;
  bool namevalid = true;
  String emailErrorText = null;
  String passwordErrorText = null;
  String nameErrorText = null;
  NewAccount newAccount;
  ErrorLogin errorLogin;
  bool loading = false;

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

  void gotoEmail(text) {
    FocusScope.of(context).requestFocus(emailFoucs);
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

  void chackName(name) {
    if (nameController.text.trim().length <= 0) {
      setState(() {
        namevalid = false;
      });
    } else {
      setState(() {
        namevalid = true;
      });
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

    if (nameController.text.trim().length <= 0) {
      setState(() {
        nameErrorText = "Plz Enter Full Name";
      });
    } else {
      setState(() {
        nameErrorText = null;
      });
    }

    if (passwordController.text.length < 8) {
      setState(() {
        passwordErrorText = "Passowrd Is Not Valid";
      });
    } else {
      setState(() {
        passwordErrorText = null;
      });
      _submitForm();
    }
  }

  Future _submitForm() async {
    setState(() {
      loading = true;
    });
    print('calling allitem');
    Post newPost = new Post(
//        email: emailController.text.trim(),
        email: "eve.holt@reqres.in",
//    "password": "pistol"
//        password: passwordController.text.trim());
        password: "pistol");
    try {
      http.Response response =
          await http.post(Const.MAIN_URL + 'register', body: newPost.toMap());
      final jsonResponse = json.decode(response.body);
      print("RESPONE RERO");
      print(response.body);
      var code = response.statusCode;
      print(code);
      if (code == 200) {
        newAccount = new NewAccount.fromJson(jsonResponse);
        setlogin(newAccount.token, emailController.text.trim());
        setState(() {
          loading = false;
        });
      } else {
        errorLogin = new ErrorLogin.fromJson(jsonResponse);
        _showAlert(context, "ERROR", errorLogin.error);
        setState(() {
          loading = false;
        });
      }
    } catch (_) {
      print("cARCT");
      print(_);
      setState(() {
        loading = false;
      });
    }
    return true;
  }

  Future<void> setlogin(String token, String email) async {
    showToast();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Const.LOGIN, true);
    await prefs.setString(Const.EMAIL, email);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  void _showAlert(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                title,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
              ),
              content: Text(message),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ));
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.indigo,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 89, 212, 1),
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
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Create \nAccount",
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
                              1.8,
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    InputText(
                                      errorText: nameErrorText,
                                      textInputType: TextInputType.text,
                                      focusNode: nameFoucs,
                                      onChnaged: chackName,
                                      changeFous: gotoEmail,
                                      password: false,
                                      textEditingController: nameController,
                                      leftIcon: Icon(
                                        EvaIcons.personOutline,
                                        size: 23,
                                      ),
                                      hint: "Full Name",
                                      rightIcon: IconButton(
                                        icon: namevalid
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
                                      errorText: emailErrorText,
                                      onChnaged: chackEmail,
                                      textInputType: TextInputType.emailAddress,
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
                                      textEditingController: passwordController,
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
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : FadeAnimation(
                                  2,
                                  LoginButton(
                                    function: checkInputs,
                                    title: "Sign Up",
                                  )),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                              2,
                              Row(children: <Widget>[
                                Expanded(child: Divider()),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "Log In",
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
      ),
    );
  }
}
