import 'package:flutter/material.dart';
import 'package:flutter_hangman/const/const.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();

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
            child: Container(
          color: Colors.red,
        )),

        //Show keyboard
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              physics: const NeverScrollableScrollPhysics(), //scroller audaina
              crossAxisCount: 6,
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
