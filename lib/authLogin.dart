import 'package:flutter/material.dart';
import 'package:login_scrren/home.dart';
import 'package:login_scrren/wellcomeScrren.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'const.dart' as Const;

class AuthLoging extends StatefulWidget {
  @override
  _AuthLogingState createState() => _AuthLogingState();
}

class _AuthLogingState extends State<AuthLoging> {

  @override
  void initState() {
    _cherlLogin();
    super.initState();
  }
  Future<void> _cherlLogin() async {
    final prefs = await SharedPreferences.getInstance();
    var login = await _getIntFromSharedPref();
    if (login == true) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomeScreen()), (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          WellcomeScrren()), (Route<dynamic> route) => false);
    }
  }

  Future<bool> _getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool(Const.LOGIN);
    if (isLogin == null) {
      return false;
    }
    return isLogin;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

