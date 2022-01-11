/// Keys to be used while interacting with shared preferences
class SharedPreferenceKeys {
  /// bool to store  ff the player symbol was X
  static String playerSymbol = "playerSymbol";

  /// Number of games won by Human
  static String totalGamesHumanWon = "totalGamesHumanWon";

  /// Number of games won by Ai
  static String totalGamesAiWon = "totalGamesAiWon";

  /// Number of games draw
  static String totalGamesDraw = "totalGamesDraw";

  /// Stores last 10 or less [Game] played
  static String storedGames = "storedGames";
}
