import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WordTranslation extends StatelessWidget {
  String word;
  String translation;
  WordTranslation({Key? key, required this.word, required this.translation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      width: 350,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(
            30,
            110,
            188,
            1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(this.translation,
              style: GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text('❓', style: TextStyle(fontSize: 75)),
          Text(this.word,
              style: GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
