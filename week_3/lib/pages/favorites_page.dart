import 'package:dropees/pages/word_page.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';
import '../widgets/word_widget.dart';

class FavoritesPage extends StatelessWidget {
  Set<Word> likedWords;
  Function(Word)? onLikePress;

  FavoritesPage({Key? key, required this.likedWords, this.onLikePress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var likedWordsList = likedWords.toList();

    return Container(
      color: const Color.fromRGBO(80, 174, 179, 1),
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(children: [
          ...List.generate(
              likedWordsList.length,
              (index) => WordWidget(
                    wordTag: likedWordsList[index].tag,
                    word: likedWordsList[index].word,
                    translation: likedWordsList[index].translation,
                    emoji: likedWordsList[index].emoji,
                    score: likedWordsList[index].score,
                    isLiked: true,
                    onEmojiTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WordPage(word: likedWordsList[index])),
                      );
                    },
                    onLikePress: () => {
                      if (onLikePress != null)
                        {onLikePress!(likedWordsList[index])}
                    },
                  )),
        ]),
      ),
    );
  }
}
