import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Provider.of<GameProvider>(context, listen: false).resetGame();
        },
        child: Text("Reset"));
  }
}
