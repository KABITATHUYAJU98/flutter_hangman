import 'package:flutter/material.dart';
import 'package:flutter_hangman/const/const.dart';
import 'package:flutter_hangman/games/figure_widget.dart';
import 'package:flutter_hangman/games/hidden_letters.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = "kabita".toUpperCase();
  List<String> selectedChar = [];

  var tries = 0;

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
                  child: Stack(
                    // color: Colors.yellow -- use stack instead of container
                    children: [
                      figure(GameUI.hang, tries >= 0),
                      figure(GameUI.head, tries >= 1),
                      figure(GameUI.body, tries >= 2),
                      figure(GameUI.leftArm, tries >= 3),
                      figure(GameUI.rightArm, tries >= 4),
                      figure(GameUI.leftLeg, tries >= 5),
                      figure(GameUI.rightLeg, tries >= 6),
                    ],
                  ),
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
                        onPressed: () {
                          if (!selectedChar.contains(e.toUpperCase())) {
                            //checks if it is already in the list or not | if cond. true
                            setState(() {
                              selectedChar.add(e.toUpperCase());

                              if (!word.split("").contains(e.toUpperCase())) {
                                tries++;
                              }
                            });
                          }
                        },
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
