import 'package:dropees/models/word.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GameModel extends ChangeNotifier {
  Word Function() generateTheWord;
  int numberOfQuestions;

  GameModel({required this.generateTheWord, required this.numberOfQuestions});

  Word? randomWord1;
  Word? randomWord2;
  int score = 0;
  bool isGameOver = false;
  bool isGameStarted = false;
  int counter = 0;
  bool? questionResult;

  void startGame() {
    isGameStarted = true;
    generateWordsPair();
    notifyListeners();
  }

  void generateWordsPair() {
    randomWord1 = generateTheWord();
    randomWord2 = generateTheWord();
  }

  void checkQuestionResult(bool selectedResult) {
    var wordsMatch = randomWord1 == randomWord2;
    if (wordsMatch == selectedResult) {
      score++;
      questionResult = true;
    } else {
      questionResult = false;
    }

    generateWordsPair();

    if (counter >= numberOfQuestions - 1) {
      isGameOver = true;
    } else {
      counter++;
    }
    notifyListeners();
  }
}
