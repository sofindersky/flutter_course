import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'widgets/word_widget.dart';
import 'widgets/dropees_input.dart';
import 'models/word.dart';

void main() {
  runApp(DropeesApp());
}

class DropeesApp extends StatelessWidget {
  const DropeesApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropees',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
      home: const MyHomePage(title: 'Words'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Word> words = [
    Word(word: "apple", translation: "яблуко", emoji: "🍏"),
    Word(word: "orange", translation: "помаранч", emoji: "🍊"),
    Word(word: "pear", translation: "груша", emoji: "🍐")
  ];

  final Set<Word> likedWords = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
          child: AppBar(
            title: Text(
              widget.title,
              style: GoogleFonts.ubuntu(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFDBE65B),
          onPressed: _addWordDialog,
          tooltip: 'Add new word',
          shape: StadiumBorder(
              side: BorderSide(color: Color(0xFFB953EA), width: 3)),
          child: Icon(Icons.add_circle, color: Colors.deepPurple),
        ),
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(children: [
              ...List.generate(
                  words.length,
                  (index) => Dismissible(
                        key: Key(words[index].id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            words.remove(words[index]);
                          });
                        },
                        child: WordWidget(
                            word: words[index].word,
                            translation: words[index].translation,
                            emoji: words[index].emoji,
                            score: words[index].score,
                            isLiked: likedWords.contains(words[index]),
                            onLikePress: () => toggleLikedWord(words[index])),
                      )),
            ]),
          ),
        ));
  }

  _addWordDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String word = '';
          String translation = '';
          String? emoji;

          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            titleTextStyle: GoogleFonts.ubuntu(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
            backgroundColor: Color(0xFF421A73),
            title: const Text(
              'Додайте слово',
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropeesInput(
                    icon: Icons.adjust_rounded,
                    hintText: "Введіть слово",
                    onChanged: (w) {
                      word = w;
                    },
                  ),
                  DropeesInput(
                    icon: Icons.all_out_rounded,
                    hintText: "Введіть переклад",
                    onChanged: (t) {
                      translation = t;
                    },
                  ),
                  DropeesInput(
                    maxLength: 1,
                    icon: Icons.add_reaction_outlined,
                    hintText: "Введіть emoji",
                    onChanged: (e) {
                      emoji = e;
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Відмінити',
                    style: GoogleFonts.ubuntu(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lime),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    addWord(
                        newWord: word,
                        newTranslation: translation,
                        newEmoji: emoji ?? '🤓');
                  },
                  child: Text(
                    'Зберегти',
                    style: GoogleFonts.ubuntu(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )),
            ],
          );
        });
  }

  addWord(
      {required String newWord,
      required String newTranslation,
      required String newEmoji}) {
    Word newW =
        Word(word: newWord, translation: newTranslation, emoji: newEmoji);

    setState(() {
      words.insert(0, newW);
    });
  }

  toggleLikedWord(Word word) {
    setState(() {
      if (likedWords.contains(word)) {
        likedWords.remove(word);
      } else {
        likedWords.add(word);
      }
    });
  }
}
