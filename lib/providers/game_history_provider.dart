import 'package:tictactoe/enums/provider_enums.dart';
import 'package:tictactoe/models/game.dart';
import 'package:tictactoe/providers/base_provider.dart';
import 'package:tictactoe/services/game_history_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';

/// Provider for providing the information about stored data regarding
/// game
class GameHistoryProvider extends BaseProvider {
  final GameHistoryService _gameHistoryService = locator<GameHistoryService>();

  /// Stores the number of winds respectively
  int humanWins = 0, aiWins = 0, draws = 0;
  List<Game> games = [];

  /// Loads all the data into the variables
  loadData() async {
    setState(ProviderState.busy);
    humanWins = await _gameHistoryService.getHumanWon();
    aiWins = await _gameHistoryService.getAiWon();
    draws = await _gameHistoryService.getDraws();
    games = await _gameHistoryService.getGames();
    setState(ProviderState.idle);
  }

  ///Clears game related data from [SharedPreferences]
  clearData() async {
    setState(ProviderState.busy);
    await _gameHistoryService.clearHistory();
    setState(ProviderState.idle);
  }
}
