import 'dart:math';

Random random = Random();

class Word {
  int _id;

  String word;
  String translation;
  String emoji;
  int score;

  static int _lastId = 0;

  int get id => _id;
  String get tag => "word-$_id";

  Word(
      {required this.word,
      required this.translation,
      required this.emoji,
      int? score})
      : _id = _lastId++,
        score = score ?? random.nextInt(200);
}
