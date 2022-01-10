import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tictactoe/main.dart' as app;
import 'package:tictactoe/screens/game/screen.dart';
import 'package:tictactoe/screens/home/screen.dart';
import 'package:tictactoe/screens/splash/screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Init', () {
    testWidgets('Check if splash Screen is shown', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });

  group('Home Screen render tests ', () {
    app.main();
    testWidgets("Check if App HomePage is rendered correctly",
        (WidgetTester tester) async {
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets("Check if GameScreen is rendered", (WidgetTester tester) async {
      await tester.pumpAndSettle();
      expect(find.byType(GameScreen), findsOneWidget);
    });
  });
}
