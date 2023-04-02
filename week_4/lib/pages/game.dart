import 'package:dropees/models/game_model.dart';
import 'package:dropees/widgets/game_widgets/game_over.dart';
import 'package:dropees/widgets/game_widgets/question_widget.dart';
import 'package:dropees/widgets/game_widgets/start_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/word.dart';

class Game extends StatelessWidget {
  final Word Function() generateWord;
  final int numberOfQuestions;

  Game({required this.generateWord, required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameModel(
          generateTheWord: generateWord, numberOfQuestions: numberOfQuestions),
      child: GameUI(),
    );
  }
}

class GameUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameModel>(
      builder: (BuildContext context, GameModel gameModel, Widget? child) {
        if (!gameModel.isGameStarted) {
          return GameStartedPopup(onTap: () {
            gameModel.startGame();
          });
        } else if (gameModel.isGameOver) {
          return GameOverPopup(
            score: gameModel.score,
            numberOfQuestions: gameModel.numberOfQuestions,
          );
        }

        return QuestionWidget(
          word: gameModel.randomWord1!.word,
          translation: gameModel.randomWord2!.translation,
          previousQuestionResult: gameModel.questionResult,
          onNoTap: () {
            gameModel.checkQuestionResult(false);
          },
          onYesTap: () {
            gameModel.checkQuestionResult(true);
          },
        );
      },
    );
  }
}
