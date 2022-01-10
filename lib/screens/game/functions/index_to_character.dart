import 'package:tictactoe/utils/game/constants.dart';

String valToSymbol(int val, bool isHumanX) {
  switch (val) {
    case GameConstants.AI_PLAYER:
      return isHumanX ? "0" : "X";
    case GameConstants.EMPTY_SPACE:
      return "";
    case GameConstants.HUMAN:
      return isHumanX ? "X" : "0";
    default:
      return "";
  }
}
