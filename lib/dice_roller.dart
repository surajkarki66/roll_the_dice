import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:roll_the_dice/styled_text.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/rolldice.jpg';
  var diceNumber = '';

  void rollDice() async {
    diceNumber = (randomizer.nextInt(6) + 1).toString();
    if (int.parse(diceNumber) == 6) {
      Fluttertoast.showToast(
          msg: "Wow! you got six.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (int.parse(diceNumber) == 1) {
      Fluttertoast.showToast(
          msg: "Wow! you got port.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    setState(() {
      activeDiceImage = 'assets/images/dice-$diceNumber.png';
    }); // setState again call th build function
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StyledText(diceNumber),
        const SizedBox(
          height: 60,
        ),
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
              // padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20)),
          child: const Text('Roll'),
        ),
      ],
    );
  }
}
