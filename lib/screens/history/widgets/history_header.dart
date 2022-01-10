import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_history_provider.dart';
import 'package:tictactoe/utils/theme/font_style.dart';
import 'package:tictactoe/utils/ui/size_config.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameHistoryProvider>(builder: (context, provider, _) {
      if (provider.isBusy) {
        return Center(
          child: Text(
            "Fetching ... ",
            style: CustomFontStyle.getTextStyle(),
          ),
        );
      } else {
        return Column(
          children: [
            SizedBox(
              height: SizeConfig.fitToHeight(42),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Ai Won",
                          style: CustomFontStyle.getTextStyle(),
                        ),
                        const Spacer(),
                        Text(
                          provider.aiWins.toString(),
                          style: CustomFontStyle.getTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "You Won",
                          style: CustomFontStyle.getTextStyle(),
                        ),
                        const Spacer(),
                        Text(
                          provider.humanWins.toString(),
                          style: CustomFontStyle.getTextStyle(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Draw",
                          style: CustomFontStyle.getTextStyle(),
                        ),
                        const Spacer(),
                        Text(
                          provider.draws.toString(),
                          style: CustomFontStyle.getTextStyle(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.fitToHeight(16),
            )
          ],
        );
      }
    });
  }
}
