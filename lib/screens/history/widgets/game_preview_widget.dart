import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/game/individual_grid_tile.dart';

class GamePreviewWidget extends StatelessWidget {
  final List<int> board;
  const GamePreviewWidget({Key? key, required this.board}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: board.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return IndividualGridTile(
            value: board[index],
            index: index,
            viewOnly: false,
          );
        });
  }
}
