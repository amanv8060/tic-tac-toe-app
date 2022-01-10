import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_history_provider.dart';
import 'package:tictactoe/screens/history/widgets/view_dialog.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/theme/font_style.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameHistoryProvider>(builder: (context, provider, widget) {
      if (provider.isBusy) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (provider.games.isEmpty) {
        return Center(
          child: Text(
            "No History Recorded Yet",
            style: CustomFontStyle.getTextStyle(),
          ),
        );
      }

      return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                key: GlobalKey(debugLabel: "historyListTile"),
                onTap: () {
                  locator<NavigationService>().pushDialog(
                      ViewDialog(
                        game: provider.games[index],
                      ),
                      dismissable: true);
                },
                title: Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                    .format(provider.games[index].timeStamp))),
          );
        },
        itemCount: provider.games.length,
      );
    });
  }
}
