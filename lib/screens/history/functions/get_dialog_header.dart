import 'package:tictactoe/utils/game/constants.dart';

String getDialogHeader(int val) {
  switch (val) {
    case GameConstants.AI_PLAYER:
      return "Computer Won!!";
    case GameConstants.DRAW:
      return "It was a tie!!";
    case GameConstants.HUMAN:
      return "Damn! , you won";
    default:
      return "";
  }
}
