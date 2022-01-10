import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/utils/game/board.dart';
import 'package:tictactoe/utils/game/constants.dart';

void main() async {
  group('isBoardFull', () {
    BoardUtils boardUtil = BoardUtils();
    test("Testing isBoardfull , when board is full", () {
      List<int> board = List.generate(9, (index) => 1);
      expect(boardUtil.isBoardFull(board), true);
    });

    test("Testing isBoardfull when board is empty", () {
      List<int> board = List.generate(9, (index) => 1);
      board[2] = 0;
      expect(boardUtil.isBoardFull(board), false);
    });
  });

  group('isMoveLegal', () {
    BoardUtils boardUtil = BoardUtils();
    test("Testing isMoveLegal , when move is illegal", () {
      List<int> board = List.generate(9, (index) => 1);
      expect(boardUtil.isMoveLegal(board, 1), false);
    });

    test("Testing isMoveLegal , when move is legal", () {
      List<int> board = List.generate(9, (index) => 1);
      board[2] = 0;
      expect(boardUtil.isMoveLegal(board, 2), true);
    });
  });

  group('evaluateBoard', () {
    BoardUtils boardUtil = BoardUtils();
    test('evaluate board when empty', () {
      List<int> board = List.generate(9, (index) => 0);
      expect(boardUtil.evaluateBoard(board), GameConstants.NO_WINNERS_YET);
    });

    test('evaluate board when 1 is winning', () {
      List<int> board = [1, 1, 1, -1, 0, -1, 0, -1, 0];
      expect(boardUtil.evaluateBoard(board), 1);
    });
    test('evaluate board when -1 is winning', () {
      List<int> board = [1, 0, 1, -1, -1, -1, 0, 1, 0];
      expect(boardUtil.evaluateBoard(board), -1);
    });
    test('evaluate board when it is draw', () {
      BoardUtils boardUtil = BoardUtils();
      List<int> board = [1, -1, 1, -1, 1, -1, -1, 1, -1];
      expect(boardUtil.evaluateBoard(board), GameConstants.DRAW);
    });
  });
}
