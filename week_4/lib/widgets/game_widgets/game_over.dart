import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverPopup extends StatelessWidget {
  int score;
  int numberOfQuestions;
  GameOverPopup(
      {Key? key, required this.score, required this.numberOfQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(10, 177, 180, 1)),
      child: Center(
        child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(10, 177, 180, 1)),
            child: RichText(
                text: TextSpan(
                    text: 'Рахунок: ',
                    style:
                        GoogleFonts.ubuntu(fontSize: 20, color: Colors.white),
                    children: [
                  TextSpan(
                      text: score.toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: ' з '),
                  TextSpan(
                    text: numberOfQuestions.toString(),
                    style: GoogleFonts.ubuntu(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]))),
      ),
    );
  }
}
