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
    this.onChanged,
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
        margin: const EdgeInsets.symmetric(vertical: 3.5),
        child: TextField(
          style: const TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            filled: true,
            counter: const Offstage(),
            fillColor: const Color(0xFF533181),
            prefixIcon: Icon(
              widget.icon,
              color: isFocused ? Colors.white : Colors.grey,
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(
                  color: Color(0xFF62468E),
                  width: 3,
                )),
            focusColor: Colors.white,
            hintText: widget.hintText,
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
