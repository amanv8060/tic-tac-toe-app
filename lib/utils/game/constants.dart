// ignore_for_file:constant_identifier_names
class GameConstants {
  // evaluation condition values
  static const int HUMAN = 1;
  static const int EMPTY_SPACE = 0;
  static const int AI_PLAYER = -1;

  //random value since these variable name have significance not the value
  static const int NO_WINNERS_YET = -5;
  static const int DRAW = 2;

  ///Conditions in which a tic tac toe game is a win
  static const WIN_CONDITIONS_LIST = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
}
