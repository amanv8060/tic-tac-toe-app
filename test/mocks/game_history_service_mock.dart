import 'dart:convert';

import 'package:tictactoe/models/game.dart';
import 'package:tictactoe/utils/game/constants.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/storage/shared_preference_keys.dart';
import 'package:tictactoe/utils/storage/shared_preferences_manager.dart';

class GameHistoryServiceMock {
  final SharedPreferenceManager _sharedPreferenceManager =
      locator<SharedPreferenceManager>();

  /// Gets all AI wins
  Future<int> getAiWon() async {
    return 0;
  }

  /// Gets all Human wins
  Future<int> getHumanWon() async {
    return 0;
  }

  /// Gets all draws
  Future<int> getDraws() async {
    return 0;
  }

  /// return stored games
  Future<List<Game>> getGames() async {
    List<String> storedValues = await _sharedPreferenceManager
        .getStringListValue(SharedPreferenceKeys.storedGames);

    List<Game> _games =
        storedValues.map((e) => Game.fromJson(jsonDecode(e))).toList();
    return _games;
  }

  addGame(List<int> board, int winner) async {
    switch (winner) {
      case GameConstants.AI_PLAYER:
        {
          int? val = await _sharedPreferenceManager
              .getIntValue(SharedPreferenceKeys.totalGamesAiWon);
          val ??= 0;

          await _sharedPreferenceManager.setIntValue(
              SharedPreferenceKeys.totalGamesAiWon, (val + 1));
          break;
        }

      case GameConstants.DRAW:
        {
          int? val = await _sharedPreferenceManager
              .getIntValue(SharedPreferenceKeys.totalGamesDraw);
          val ??= 0;
          await _sharedPreferenceManager.setIntValue(
              SharedPreferenceKeys.totalGamesDraw, (val + 1));
          break;
        }

      case GameConstants.HUMAN:
        {
          int? val = await _sharedPreferenceManager
              .getIntValue(SharedPreferenceKeys.totalGamesHumanWon);
          val ??= 0;

          await _sharedPreferenceManager.setIntValue(
              SharedPreferenceKeys.totalGamesHumanWon, (val + 1));
          break;
        }
      default:
        return;
    }
    Game game = Game(board: board, winner: winner);
    List<String> storedValues = await _sharedPreferenceManager
        .getStringListValue(SharedPreferenceKeys.storedGames);
    await _sharedPreferenceManager
        .setStringListValue(SharedPreferenceKeys.storedGames, [
      jsonEncode(game.toJson()),
      ...storedValues.take(GameConstants.noOfGamestoStore - 1)
    ]);
  }

  Future<void> clearHistory() async {
    await _sharedPreferenceManager.setIntValue(
        SharedPreferenceKeys.totalGamesHumanWon, 0);
    await _sharedPreferenceManager.setIntValue(
        SharedPreferenceKeys.totalGamesAiWon, 0);
    await _sharedPreferenceManager.setIntValue(
        SharedPreferenceKeys.totalGamesDraw, 0);
    await _sharedPreferenceManager
        .setStringListValue(SharedPreferenceKeys.storedGames, []);
  }
}
