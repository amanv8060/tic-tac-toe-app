import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/screens/game/widgets/individual_grid_tile.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, provider, _) {
        return GridView.builder(
            itemCount: provider.board.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return IndividualGridTile(
                value: provider.board[index],
                index: index,
              );
            });
      },
    );
  }
}
