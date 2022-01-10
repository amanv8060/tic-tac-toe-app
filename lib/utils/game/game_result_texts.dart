/// Contains texts to show when a game is ended ,
class GameResultsTexts {
  List<String> aiWon = [
    "Computer won : )",
    "You were good , but not good enough to beat me :)"
  ];

  List<String> humanWon = [
    "Well , that's unexpected but congrats!",
    "Huh! you won , see you next time"
  ];

  List<String> draw = ["Lol! we tried", "Nah! not again"];

  GameResultsTexts() {
    aiWon.shuffle();
    draw.shuffle();
    humanWon.shuffle();
  }
}
