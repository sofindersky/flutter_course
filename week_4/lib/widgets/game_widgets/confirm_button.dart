import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmButton extends StatelessWidget {
  String text;
  Function() checkMatch;
  ConfirmButton({Key? key, required this.text, required this.checkMatch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: checkMatch,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Color.fromRGBO(33, 122, 209, 1),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3)),
        child: Text(text,
            style: GoogleFonts.ubuntu(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
