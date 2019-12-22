import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String hint;
  final Widget rightIcon;
  final Widget leftIcon;
  final TextEditingController textEditingController;
  final bool password;
  final Function changeFous;
  final FocusNode focusNode;

  const InputText(
      {Key key,
      this.hint,
      this.rightIcon,
      this.leftIcon,
      this.textEditingController,
      this.password,
      this.changeFous,
      this.focusNode});

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(),
      child: TextField(
        focusNode: widget.focusNode,
        onChanged: (text) {},
        onSubmitted: widget.changeFous,
        obscureText: widget.password,
        controller: widget.textEditingController,
        decoration: InputDecoration(
            prefixIcon: widget.leftIcon,
            suffixIcon: widget.rightIcon,
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
