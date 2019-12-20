import 'package:flutter/material.dart';
import 'package:login_scrren/FadeAnimation.dart';
import 'package:login_scrren/createAccount.dart';
import 'package:login_scrren/wellcomeScrren.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'hindregular'),
      home: WellcomeScrren(),
//      home: CreateAccount(),
//      home: CreateAccount(),
    ));
