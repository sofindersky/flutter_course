import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WordWidget extends StatelessWidget {
  WordWidget(
      {Key? key,
      required this.wordTag,
      required this.word,
      required this.translation,
      required this.emoji,
      this.score = 0,
      required this.isLiked,
      this.onLikePress,
      this.onEmojiTap})
      : super(key: key);

  final String wordTag;
  final String word;
  final String translation;
  final String emoji;
  final bool isLiked;
  int score;

  Function()? onLikePress;
  Function()? onEmojiTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              if (onEmojiTap != null) {
                onEmojiTap!();
              }
            },
            child: Hero(
              tag: wordTag,
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  emoji,
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 75),
        ]),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              word,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 5,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  height: 5,
                  width: this.score.toDouble(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                )

                // endIndent: 0,
              ],
            ),
            const SizedBox(height: 10),
            Text(translation,
                style: GoogleFonts.ubuntu(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
          ]),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const SizedBox(width: 15.0),
          GestureDetector(
              onTap: () {
                if (onLikePress != null) {
                  onLikePress!();
                }
              },
              child: Expanded(
                child: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white, size: 25),
              )),
          const SizedBox(width: 15.0),
          const Icon(Icons.more_horiz, color: Colors.white),
        ])
      ]),
    );
  }
}
