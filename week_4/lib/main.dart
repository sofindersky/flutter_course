import "dart:math";

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/word.dart';
import 'pages/favorites_page.dart';
import 'pages/game.dart';
import 'pages/main_page.dart';
import 'widgets/drawer_content.dart';
import 'widgets/dropees_input.dart';

const MIN_GAME_QUESTIONS = 3;

void main() {
  runApp(const DropeesApp());
}

class DropeesApp extends StatelessWidget {
  const DropeesApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dropees',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
      home: const MyHomePage(title: 'Слова'),
      // home: GamePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  List<Word> words = [
    Word(word: "apple", translation: "яблуко", emoji: "🍏"),
    Word(word: "orange", translation: "помаранч", emoji: "🍊"),
    Word(word: "pineapple", translation: "ананас", emoji: "🍍"),
    Word(word: "peach", translation: "персик", emoji: "🍑"),
    Word(word: "pear", translation: "груша", emoji: "🍐")
  ];
  Set<Word> likedWords = {};

  @override
  void initState() {
    super.initState();

    // Add random word to liked on application load for demo purposes.
    likedWords.add(randomWord());
  }

  Word randomWord() {
    var random = Random();
    int index = random.nextInt(words.length);

    return words[index];
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

  removeWord(Word word) {
    setState(() {
      likedWords.remove(word);
      words.remove(word);
    });
  }

  void pageChanged(int i) {
    setState(() {
      pageIndex = i;
    });
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        MainPage(
            words: words,
            likedWords: likedWords,
            onLikePress: toggleLikedWord,
            onDismissed: removeWord),
        FavoritesPage(likedWords: likedWords, onLikePress: toggleLikedWord),
        if (words.length >= MIN_GAME_QUESTIONS)
          Game(numberOfQuestions: 6, generateWord: randomWord)
      ],
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.folder_open),
          label: 'Усі слова',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_sharp),
          label: 'Улюблені',
        ),
        if (words.length >= MIN_GAME_QUESTIONS)
          const BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'ГРА',
          )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.pink,
          padding: const EdgeInsets.all(20),
          child: SafeArea(
              child: DrawerContent(
            words: words,
            generateWord: randomWord,
          )),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
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
      floatingActionButton: pageIndex == 0
          ? FloatingActionButton(
              backgroundColor: const Color(0xFFDBE65B),
              onPressed: _addWordDialog,
              tooltip: 'Додайте слово',
              shape: const StadiumBorder(
                  side: BorderSide(color: Color(0xFFB953EA), width: 3)),
              child: const Icon(Icons.add_circle, color: Colors.deepPurple),
            )
          : null,
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(41, 19, 57, 1),
        unselectedItemColor: Colors.grey,
        currentIndex: pageIndex,
        onTap: (int i) => setState(() {
          pageIndex = i;
          pageController.animateToPage(pageIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }),
        items: buildBottomNavBarItems(),
      ),
    );
  }

  _addWordDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String word = '';
          String translation = '';
          String emoji = '🤯';

          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            titleTextStyle: GoogleFonts.ubuntu(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
            backgroundColor: const Color(0xFF421A73),
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
                        newEmoji: emoji);
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
}
