import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DropeesInput extends StatefulWidget {
  final int? maxLength;
  final IconData icon;
  String hintText;
  Function(String)? onChanged;


  DropeesInput({
    Key? key,
    this.maxLength,
    required this.icon,
    required this.hintText,

    Function(String)? this.onChanged,
  }) : super(key: key);

  @override
  State<DropeesInput> createState() => _DropeesInputState();
}

class _DropeesInputState extends State<DropeesInput> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          isFocused = value;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3.5),
        child: TextField(
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
          maxLength: this.widget.maxLength,
          decoration: InputDecoration(
            filled: true,
            counter: Offstage(),
            fillColor: Color(0xFF533181),
            prefixIcon: Icon(
              this.widget.icon,
              color: isFocused ? Colors.white : Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(
                  color: Color(0xFF62468E),
                  width: 3,
                )),
            focusColor: Colors.white,
            hintText: this.widget.hintText,
          ),
          onChanged: this.widget.onChanged,
        ),
      ),
    );
  }
}
