import 'package:flutter/material.dart';
import 'to_do_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      title: 'Week 1 Project',
      home: const MyHomePage(title: "Sofia's Servetnyk Notes"),
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
  List<ToDoNote> _items = [
    ToDoNote(text: "My first note"),
  ];

  String? _newItemText;

  void _addItem(ToDoNote item) {
    setState(() {
      _items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(children: _items.map((item) => GestureDetector(
                  onTap: () {
                    setState(() {
                      item.toggleCrossedOut();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orangeAccent.shade100,
                      border: Border.all(color: Colors.grey, width: 3),
                    ),
                    height: 50,
                    margin: EdgeInsets.all(1),
                    padding: EdgeInsets.all(5),
                    // color: Colors.orangeAccent,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.text,
                          style: TextStyle(
                              fontSize: 20,
                              decoration: item.isCrossedOut
                                  ? TextDecoration.lineThrough
                                  : null),
                        )),
                  ),
                ))
            .toList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Add the note'),
                    content: TextField(
                        onChanged: (value) {
                          setState(() {
                            _newItemText = value;
                          });
                        },
                        autofocus: true,
                        decoration:
                            InputDecoration(hintText: "Enter the note")),
                    actions: [
                      TextButton(
                          child: Text('Add'),
                          onPressed: () {
                            if (_newItemText == null || _newItemText!.isEmpty) {
                              return;
                            }
                            ToDoNote note = ToDoNote(text: _newItemText!);
                            _addItem(note);

                            Navigator.of(context).pop();
                          }),
                    ],
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
