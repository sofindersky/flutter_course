import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/word.dart';

class WordPage extends StatelessWidget {
  Word word;

  WordPage({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Color.fromRGBO(33, 122, 209, 1),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: word.tag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(word.emoji,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 70)),
                  ),
                ),
                Text(
                  word.word,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 45),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
