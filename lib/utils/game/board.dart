import 'package:tictactoe/utils/game/constants.dart';

class BoardUtils {
  ///checks if a board is full
  bool isBoardFull(List<int> board) {
    for (var val in board) {
      if (val == GameConstants.EMPTY_SPACE) return false;
    }
    return true;
  }

  /// Checks if a move is legal
  bool isMoveLegal(List<int> board, int move) {
    if (move < 0 ||
        move >= board.length ||
        board[move] != GameConstants.EMPTY_SPACE) return false;

    return true;
  }

  /// Returns the current state of the board [winning player, draw or no winners yet]
  int evaluateBoard(List<int> board) {
    for (var list in GameConstants.WIN_CONDITIONS_LIST) {
      if (board[list[0]] !=
              GameConstants.EMPTY_SPACE && // if a player has played here AND
          board[list[0]] ==
              board[list[1]] && // if all three positions are of the same player
          board[list[0]] == board[list[2]]) {
        return board[list[0]];
      }
    }

    if (isBoardFull(board)) {
      return GameConstants.DRAW;
    }

    return GameConstants.NO_WINNERS_YET;
  }
}
