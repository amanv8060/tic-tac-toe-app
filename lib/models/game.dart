import 'package:tictactoe/utils/game/constants.dart';

class Game {
  /// Time when this game was played
  late DateTime timeStamp;

  /// Game board at that movement ,
  List<int> board;

  /// Stores who was winner
  int winner;

  Game({
    timeStamp,
    required this.board,
    required this.winner,
  }) {
    this.timeStamp = timeStamp ?? DateTime.now();
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      timeStamp: json["timestamp"] == null
          ? DateTime.now()
          : DateTime.parse(json["timestamp"]!),
      winner: json["winner"] == null
          ? GameConstants.NO_WINNERS_YET
          : int.parse(json["winner"]!),
      board: json["board"] == null
          ? List.filled(9, 0)
          : json["board"]!.split(",").map<int>((e) => int.parse(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "timeStamp": timeStamp.toIso8601String(),
      "board": board.join(","),
      "winner": winner.toString()
    };
  }
}
