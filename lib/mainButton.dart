import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function function;
  final String title;

  const LoginButton({Key key, this.function, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0)),
      splashColor: Colors.white,
      color: Colors.blueAccent,
      onPressed: function,
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
