import 'package:dropees/widgets/game_widgets/game_over.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';
import '../widgets/game_widgets/question_widget.dart';
import '../widgets/game_widgets/start_game.dart';

class Game extends StatefulWidget {
  Word Function() generateWord;
  int numberOfQuestions;

  Game({Key? key, required this.generateWord, required this.numberOfQuestions})
      : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Word? randomWord1;
  Word? randomWord2;
  int score = 0;
  bool isGameOver = false;
  bool isGameStarted = false;
  int counter = 0;
  bool? questionResult;

  @override
  void initState() {
    super.initState();

    generateWordsPair();
  }

  void generateWordsPair() {
    randomWord1 = widget.generateWord();
    randomWord2 = widget.generateWord();
  }

  void checkQuestionResult(bool selectedResult) {
    setState(() {
      var wordsMatch = randomWord1 == randomWord2;
      if (wordsMatch == selectedResult) {
        score++;
        questionResult = true;
      } else {
        questionResult = false;
      }

      generateWordsPair();

      if (counter >= widget.numberOfQuestions - 1) {
        isGameOver = true;
      } else {
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildGamePage();
  }

  Widget buildGamePage() {
    if (!isGameStarted) {
      return GameStartedPopup(onTap: () {
        setState(() {
          isGameStarted = true;
        });
      });
    } else if (isGameOver) {
      return GameOverPopup(
          score: score, numberOfQuestions: widget.numberOfQuestions);
    }

    return QuestionWidget(
      word: randomWord1!.word,
      translation: randomWord2!.translation,
      previousQuestionResult: questionResult,
      onNoTap: () {
        checkQuestionResult(false);
      },
      onYesTap: () {
        checkQuestionResult(true);
      },
    );
  }
}
