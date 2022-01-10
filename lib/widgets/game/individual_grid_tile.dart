import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/providers/player_provider.dart';
import 'package:tictactoe/screens/game/functions/index_to_character.dart';
import 'package:tictactoe/utils/game/constants.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';
import 'package:tictactoe/utils/theme/font_style.dart';
import 'package:tictactoe/utils/ui/size_config.dart';

class IndividualGridTile extends StatelessWidget {
  final int value;
  final int index;
  final bool viewOnly;
  const IndividualGridTile(
      {Key? key,
      required this.value,
      required this.index,
      required this.viewOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, provider, _) {
        return GestureDetector(
          onTap: viewOnly
              ? null
              : () async {
                  Provider.of<GameProvider>(context, listen: false).play(index);
                },
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.fitToHeight(10),
                horizontal: SizeConfig.fitToWidth(10)),
            decoration: BoxDecoration(
                color: AppTheme.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(SizeConfig.fitToWidth(16))),
            child: Center(
              child: Text(
                valToSymbol(value, provider.isHumanX),
                style: CustomFontStyle.getTextStyle(
                    fontSize: 32,
                    bold: true,
                    color: value == GameConstants.AI_PLAYER
                        ? AppTheme.red
                        : AppTheme.pinkishpurple),
              ),
            ),
          ),
        );
      },
    );
  }
}
