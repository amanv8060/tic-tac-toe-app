import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/models/game.dart';
import 'package:tictactoe/screens/history/screen.dart';
import 'package:tictactoe/screens/history/widgets/view_dialog.dart';
import 'package:tictactoe/services/game_history_service.dart';
import 'package:tictactoe/utils/game/constants.dart';
import 'package:tictactoe/utils/storage/shared_preference_keys.dart';
import 'package:tictactoe/utils/storage/shared_preferences_manager.dart';
import 'package:tictactoe/widgets/game/individual_grid_tile.dart';

import '../helpers/setup_locator.dart';
import '../helpers/getapp.dart';

void main() async {
  setUpAll(() {
    setupLocatorWithMockServices();
    when(locator<GameHistoryService>().getAiWon)
        .thenAnswer((_) => Future.value(0));

    when(locator<GameHistoryService>().getDraws)
        .thenAnswer((_) => Future.value(0));
    when(locator<GameHistoryService>().getHumanWon)
        .thenAnswer((_) => Future.value(1));
    when(locator<GameHistoryService>().getGames)
        .thenAnswer((_) => Future.value([
              Game(
                  winner: GameConstants.AI_PLAYER,
                  board: [1, 0, 1, -1, -1, -1, 0, 1, 0]),
              Game(
                  board: [1, 1, 1, -1, 0, -1, 0, -1, 0],
                  winner: GameConstants.HUMAN)
            ]));
  });

  group("History Screen Test", () {
    testWidgets("Check if history Screen is rendered correctly",
        (WidgetTester tester) async {
      await tester.pumpApp(const HistoryScreen());
      await tester.pumpAndSettle();
      expect(find.widgetWithText(Expanded, "0"), findsNWidgets(2));
      expect(find.widgetWithText(Expanded, "1"), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(2));
    });

    testWidgets("Dialog is shown when tapping on listtile",
        (WidgetTester tester) async {
      await tester.pumpApp(const HistoryScreen());
      await tester.pumpAndSettle();

      /// Expecting is human x , so there should be 3 "O" in the screen
      when(() => locator<SharedPreferenceManager>()
              .getBoolValueOrNull(SharedPreferenceKeys.playerSymbol))
          .thenAnswer((invocation) => Future.value(true));

      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      expect(find.byType(ViewDialog), findsOneWidget);
      expect(find.text("Computer Won!!"), findsOneWidget);
      // board is rendered properly
      expect(find.widgetWithText(IndividualGridTile, "0"), findsNWidgets(3));
    });
  });
}
