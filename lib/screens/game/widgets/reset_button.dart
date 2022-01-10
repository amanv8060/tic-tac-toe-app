import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';
import 'package:tictactoe/utils/theme/font_style.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<GameProvider>(context, listen: false).resetGame();
      },
      child: Text(
        "Reset",
        style:
            CustomFontStyle.getTextStyle(color: AppTheme.white, fontSize: 24),
      ),
    );
  }
}
