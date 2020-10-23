import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        onSubmitted: onChanged,
        obscureText: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: onChanged,
        cursorColor: Colors.blue[900],
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.blue[900],
          ),
          hintText: "Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}