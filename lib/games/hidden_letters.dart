import 'package:flutter/material.dart';
import 'package:flutter_hangman/const/const.dart';

Widget hiddenLetter(String char, bool visibile) {
  return Container(
    width: 50,
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), color: Colors.white),
    child: Visibility(
        visible: !visibile,
        child: Text(
          char,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.bgColor),
        )),
  );
}
