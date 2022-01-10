import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tictactoe/app.dart';

import 'package:tictactoe/screens/game/screen.dart';
import 'package:tictactoe/screens/history/screen.dart';
import 'package:tictactoe/screens/history/widgets/history_header.dart';
import 'package:tictactoe/screens/history/widgets/history_view.dart';
import 'package:tictactoe/screens/home/screen.dart';
import 'package:tictactoe/screens/splash/screen.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/widgets/game/individual_grid_tile.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    setupLocator();
  });

  group('App Init', () {
    testWidgets('Check if splash Screen is shown', (WidgetTester tester) async {
      await tester.pumpWidget(const TicTacToe());
      await tester.pumpAndSettle();

      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });

  group('Home Screen render tests ', () {
    testWidgets("Check if App HomePage is rendered correctly",
        (WidgetTester tester) async {
      await tester.pumpWidget(const TicTacToe());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
      // PopMenuButton is availble
      expect(find.byIcon(Icons.more_horiz_outlined), findsOneWidget);
    });

    testWidgets("Check if GameScreen is rendered properly",
        (WidgetTester tester) async {
      await tester.pumpWidget(const TicTacToe());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(find.byType(GameScreen), findsOneWidget);

      // Check reset button is there
      expect(find.byType(TextButton), findsOneWidget);

      // Check gridview is there
      expect(find.byType(GridView), findsOneWidget);

      // There are 9 cells in grid
      expect(find.byType(IndividualGridTile), findsNWidgets(9));
    });
  });

  group("Play Tic Tac toe", () {
    testWidgets("play", (WidgetTester tester) async {
      await tester.pumpWidget(const TicTacToe());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(GridView));

      await tester.pumpAndSettle();
      expect(find.widgetWithText(IndividualGridTile, "X"), findsOneWidget);
    });

    testWidgets("reset", (WidgetTester tester) async {
      await tester.pumpWidget(const TicTacToe());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(GridView));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, "Reset"));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(IndividualGridTile, "X"), findsNothing);
    });
  });

  group('History Screen', () {
    testWidgets("Check if history Screen is rendered correctly",
        (WidgetTester tester) async {
      await tester.pumpWidget(const TicTacToe());

      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      locator<NavigationService>().pushScreen(HistoryScreen.routeName);
      await tester.pumpAndSettle();

      //Header is present
      expect(find.byType(HistoryHeader), findsOneWidget);

      // FAB is availble
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // History view is availble
      expect(find.byType(HistoryView), findsOneWidget);
    });
  });
}
