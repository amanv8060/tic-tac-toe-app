import 'package:flutter/material.dart';
import 'package:tictactoe/utils/theme/font_style.dart';
import 'package:tictactoe/utils/ui/size_config.dart';

class HelpScreen extends StatefulWidget {
  static const String routeName = "HelpScreen";
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("How to Play ?"),
        ),
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.fitToWidth(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              "1. The game is played on a grid that's 3 squares by 3 squares.",
              "2. You are X, your friend (or the computer in this case) is O. Players take turns putting their marks in empty squares.",
              "3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.",
              "4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie."
            ]
                .map<Widget>((e) => Text(
                      e,
                      style: CustomFontStyle.getTextStyle(fontSize: 24),
                      textAlign: TextAlign.justify,
                    ))
                .toList(),
          ),
        ));
  }
}
