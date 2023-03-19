import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/word.dart';

class DrawerContent extends StatefulWidget {
  Word Function() generateWord;
  List<Word> words;

  DrawerContent({Key? key, required this.generateWord, required this.words})
      : super(key: key);

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  Word? randomWord;

  @override
  void initState() {
    super.initState();

    if (widget.words.isNotEmpty) {
      randomWord = widget.generateWord();
    }
  }

  @override
  Widget build(BuildContext context) {
    return randomWord != null
        ? Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Text('Слово дня:',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                          "${randomWord!.word}, ${randomWord!.translation}",
                          style: GoogleFonts.ubuntu(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          // foregroundColor: Colors.green,
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            randomWord = widget.generateWord();
                          });
                        },
                        child: Text("ХОЧУ ЩЕ!!!",
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))
                  ],
                ),
              ],
            ),
          )
        : Text("Слів немає 😢",
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ));
  }
}
