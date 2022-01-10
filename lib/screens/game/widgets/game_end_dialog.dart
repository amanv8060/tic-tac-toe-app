import 'package:flutter/material.dart';
import 'package:tictactoe/screens/history/screen.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/game/constants.dart';
import 'package:tictactoe/utils/game/game_result_texts.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';
import 'package:tictactoe/utils/theme/font_style.dart';

class GameEndDialog extends StatelessWidget {
  final int result;
  final GameResultsTexts _gameResultsTexts = GameResultsTexts();
  GameEndDialog({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.orange,
      title: const Text("Game Finished"),
      content: Text(getText()),
      actions: [
        TextButton(
          onPressed: () {
            locator<NavigationService>().pop();
          },
          child: Text(
            "One more",
            style: CustomFontStyle.getTextStyle(color: AppTheme.darkPurple),
          ),
        ),
        TextButton(
          onPressed: () {
            locator<NavigationService>().pop();
            locator<NavigationService>().pushScreen(HistoryScreen.routeName);
          },
          child: Text(
            "View History",
            style: CustomFontStyle.getTextStyle(color: AppTheme.darkPurple),
          ),
        )
      ],
    );
  }

  String getText() {
    switch (result) {
      case GameConstants.AI_PLAYER:
        return _gameResultsTexts.aiWon.first;

      case GameConstants.HUMAN:
        return _gameResultsTexts.humanWon.first;

      case GameConstants.DRAW:
        return _gameResultsTexts.draw.first;

      default:
        return "Idk but something happened : (";
    }
  }
}
