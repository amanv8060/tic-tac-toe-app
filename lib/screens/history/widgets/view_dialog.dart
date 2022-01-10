import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/models/game.dart';
import 'package:tictactoe/providers/player_provider.dart';
import 'package:tictactoe/screens/history/functions/get_dialog_header.dart';
import 'package:tictactoe/screens/history/widgets/game_preview_widget.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';
import 'package:tictactoe/utils/theme/font_style.dart';
import 'package:tictactoe/utils/ui/size_config.dart';

class ViewDialog extends StatelessWidget {
  final Game game;
  const ViewDialog({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.primaryColor,
      title: Text(
        getDialogHeader(game.winner),
        style: CustomFontStyle.getTextStyle(),
      ),
      content: SizedBox(
        width: SizeConfig.screenWidth * 0.75,
        child: ChangeNotifierProvider(
          create: (context) => locator<PlayerProvider>(),
          child: GamePreviewWidget(board: game.board),
        ),
      ),
    );
  }
}
