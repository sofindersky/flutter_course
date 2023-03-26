import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameStartedPopup extends StatelessWidget {
  Function() onTap;
  GameStartedPopup({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(33, 122, 209, 1)),
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          onPressed: onTap,
          child: Text("ПОЧАТИ ГРУ",
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 32,
              ))),
    );
  }
}
