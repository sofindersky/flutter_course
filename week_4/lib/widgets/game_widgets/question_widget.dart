import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'confirm_button.dart';
import 'word_translation.dart';

class QuestionWidget extends StatelessWidget {
  Function() onNoTap;
  Function() onYesTap;
  bool? previousQuestionResult;

  QuestionWidget(
      {Key? key,
      required this.word,
      required this.translation,
      required this.onNoTap,
      required this.onYesTap,
      this.previousQuestionResult})
      : super(key: key);

  final String word;
  final String translation;

  @override
  Widget build(BuildContext context) {
    var containerDecoration =
        const BoxDecoration(color: Color.fromRGBO(33, 122, 209, 1));
    switch (previousQuestionResult) {
      case true:
        containerDecoration =
            const BoxDecoration(color: Color.fromRGBO(98, 182, 86, 1.0));
        break;

      case false:
        containerDecoration =
            const BoxDecoration(color: Color.fromRGBO(180, 83, 68, 1.0));
        break;
    }

    return Container(
      decoration: containerDecoration,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: WordTranslation(
              word: word,
              translation: translation,
            ),
          ),
          Container(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConfirmButton(text: 'Ніт', checkMatch: onNoTap),
                Text('або',
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                ConfirmButton(text: 'Так', checkMatch: onYesTap),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
