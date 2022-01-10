class Game {
  /// Time when this game was played
  late DateTime timeStamp;

  /// Game board at that movement ,
  List<int> board;

  Game({timeStamp, required this.board}) {
    this.timeStamp = timeStamp ?? DateTime.now();
  }

  factory Game.fromJson(Map<String, String> json) {
    return Game(
        timeStamp: json["timestamp"] == null
            ? DateTime.now()
            : DateTime.parse(json["timestamp"]!),
        board: json["board"] == null
            ? List.filled(9, 0)
            : json["board"]!.split(",").map((e) => int.parse(e)).toList());
  }

  Map<String, String> toJson() {
    return {"timeStamp": timeStamp.toIso8601String(), "board": board.join(",")};
  }
}
