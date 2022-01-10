import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/utils/game/board.dart';
import 'package:tictactoe/utils/game/constants.dart';
import 'package:flutter/services.dart';

void main() async {
  setUpAll(() async {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
  });

}
