///[Move] is used to represent a move in game algorithm , it stores 
///the score of a particular move and the index of the move
class Move {
  
  ///Score if this move is played
  int score;

  ///the index of the move
  int move;

  Move({required this.score, required this.move});
}