import 'package:flutter/material.dart';
import 'package:flutter_hangman/games/hidden_letters.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = "baaba".toUpperCase();
  List<String> selectedChar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text('HangMan : The Game'),
        centerTitle: true,
      ),
      body: Column(children: [
        //show hangman
        Expanded(
            flex: 4,
            child: Column(
              // color: Colors.red,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(color: Colors.yellow),
                ),
                Expanded(
                  child: Container(
                      //showing letters
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: word
                              .split("")
                              .map((e) => hiddenLetter(
                                  e, !selectedChar.contains(e.toUpperCase())))
                              .toList())
                      // color: Colors.green
                      ),
                )
              ],
            )),

        //Show keyboard
        Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                  physics:
                      const NeverScrollableScrollPhysics(), //scroller audaina
                  crossAxisCount: 7,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: characters.split("").map((e) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87),
                        onPressed: () {},
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ));
                  }).toList()),
              // color: Colors.green
            )),
      ]),
    );
  }
}
