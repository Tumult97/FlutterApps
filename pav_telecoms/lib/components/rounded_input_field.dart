import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String text;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.phone_android_outlined,
    this.onChanged,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController txtController = TextEditingController();
    txtController.text = text;
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        controller: txtController,
        enabled: false,
        onChanged: onChanged,
        cursorColor: Colors.blue[900],
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.blue[900],
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}