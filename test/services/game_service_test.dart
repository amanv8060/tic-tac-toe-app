import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/services/game_service.dart';

void main() async {
  test("AI predicts correct move ", () async {
    AiGameService _aiGameService = AiGameService();
    List<int> board = [0, 0, 1, 0, 0, 0, 0, 0, 0];
    //index 4 is the best move in the above condition
    expect(_aiGameService.getBestAiMove(board), 4);
  });
}
