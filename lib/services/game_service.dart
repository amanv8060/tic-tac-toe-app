import 'dart:math';
import 'package:tictactoe/models/move.dart';
import 'package:tictactoe/utils/game/board.dart';
import 'package:tictactoe/utils/game/constants.dart';

class AiGameService {
  final BoardUtils _boardUtils = BoardUtils();

  int currentPlayer = GameConstants.AI_PLAYER;

  /// Returns the optimal move based on the state of the board.
  int getBestAiMove(List<int> board) {
    return _bestMove(board);
  }

  int _miniMax(List<int> board, int depth, bool isMaximizing) {
    int evaluation = _boardUtils.evaluateBoard(board);

    if (evaluation == GameConstants.AI_PLAYER) return 100;

    if (evaluation == GameConstants.DRAW) return 0;

    if (evaluation == GameConstants.HUMAN) {
      return -100;
    }

    // Intermediate state
    int bestScore = isMaximizing ? -999 : 999;

    for (int i = 0; i < 9; ++i) {
      //If position is already occupied we dont check it
      if (!_boardUtils.isMoveLegal(board, i)) continue;

      board[i] = isMaximizing ? GameConstants.AI_PLAYER : GameConstants.HUMAN;

      bestScore = isMaximizing
          ? max(bestScore, _miniMax(board, depth + 1, false))
          : min(bestScore, _miniMax(board, depth + 1, true));

      board[i] = GameConstants.EMPTY_SPACE;
    }

    return isMaximizing ? bestScore - depth : bestScore + depth;
  }

  /// Finds the best move for the AI
  int _bestMove(List<int> board) {
    currentPlayer = GameConstants.AI_PLAYER;
    Move bestMove = Move(score: -1000, move: -1);

    for (int currentMove = 0; currentMove < board.length; currentMove++) {
      //If position is already occupied we dont check it
      if (!_boardUtils.isMoveLegal(board, currentMove)) continue;

      board[currentMove] = currentPlayer;

      // solve for the next player
      int nextScore = _miniMax(board, 0, false);

      board[currentMove] = GameConstants.EMPTY_SPACE;

      // check if the current move is better than our best found move
      if (nextScore > bestMove.score) {
        bestMove.score = nextScore;
        bestMove.move = currentMove;
      }
    }
    return bestMove.move;
  }
}
