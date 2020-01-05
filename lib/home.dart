import 'package:flutter/material.dart';
import 'package:login_scrren/wellcomeScrren.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'const.dart' as Const;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> _logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Const.LOGIN, false);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        WellcomeScrren()), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Your Are Loged In "),
            RaisedButton(
              onPressed: _logOut,
              child: Text("Log Out"),
            )
          ],
        ),
      ),
    );
  }
}

