import 'package:flutter/material.dart';
import 'package:roll_the_dice/dice_roller.dart';

const topLeft = Alignment.topLeft;
const bottomRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2], begin: topLeft, end: bottomRight),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
