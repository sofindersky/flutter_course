import 'package:dropees/pages/word_page.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';
import '../widgets/word_widget.dart';

class MainPage extends StatelessWidget {
  List<Word> words;
  Set<Word> likedWords;
  Function(Word)? onLikePress;
  Function(Word) onDismissed;

  MainPage(
      {Key? key,
      required this.words,
      required this.likedWords,
      this.onLikePress,
      required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.deepPurple,
      child: SingleChildScrollView(
        child: Column(children: [
          ...List.generate(
            words.length,
            (index) => Dismissible(
                key: Key(words[index].id.toString()),
                onDismissed: (direction) {
                  onDismissed(words[index]);
                },
                child: WordWidget(
                  wordTag: words[index].tag,
                  word: words[index].word,
                  translation: words[index].translation,
                  emoji: words[index].emoji,
                  score: words[index].score,
                  isLiked: likedWords.contains(words[index]),
                  onEmojiTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WordPage(word: words[index])),
                    );
                  },
                  onLikePress: () => {
                    if (onLikePress != null) {onLikePress!(words[index])}
                  },
                )),
          )
        ]),
      ),
    );
  }
}
