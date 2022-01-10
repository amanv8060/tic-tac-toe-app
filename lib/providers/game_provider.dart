import 'package:tictactoe/enums/provider_enums.dart';
import 'package:tictactoe/providers/base_provider.dart';
import 'package:tictactoe/screens/game/widgets/win_dialog.dart';
import 'package:tictactoe/services/game_service.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/game/board.dart';
import 'package:tictactoe/utils/game/constants.dart';
import 'package:tictactoe/utils/get_it/locator.dart';

class GameProvider extends BaseProvider {
  int currentPlayer = GameConstants.HUMAN;

  List<int> board = List.filled(9, GameConstants.EMPTY_SPACE);

  final BoardUtils _boardUtils = BoardUtils();
  final AiGameService _aiGameService = locator<AiGameService>();

  /// Resets the game and notifies listeners
  void resetGame() {
    board = List.filled(9, GameConstants.EMPTY_SPACE);
    setState(ProviderState.idle);
  }

  void play(int index) async {
    if (_boardUtils.isMoveLegal(board, index)) {
      //sanity check
      if (currentPlayer == GameConstants.HUMAN) {
        board[index] = GameConstants.HUMAN;
        setState(ProviderState.idle);
        checkforWins();
        //calculating Ai move
        int ai = _aiGameService.getBestAiMove(board);
        board[ai] = GameConstants.AI_PLAYER;
        setState(ProviderState.idle);
        checkforWins();
      }
    }
  }

  void checkforWins() {
    int val = _boardUtils.evaluateBoard(board);
    if (val != GameConstants.NO_WINNERS_YET) {
      locator<NavigationService>().pushDialog(GameEndDialog(result: val));
    }
  }
}
