import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_history_provider.dart';
import 'package:tictactoe/screens/history/widgets/history_header.dart';
import 'package:tictactoe/screens/history/widgets/history_view.dart';

class HistoryScreen extends StatefulWidget {
  static const String routeName = "HistoryScreen";

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GameHistoryProvider _gameHistoryProvider = GameHistoryProvider();

  @override
  void initState() {
    super.initState();
    _gameHistoryProvider.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _gameHistoryProvider,
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text("History"),
        ),
        body: Column(
          children: const [HistoryHeader(), Expanded(child: HistoryView())],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<GameHistoryProvider>(context, listen: false)
                .clearData();
          },
        ),
      ),
    );
  }
}
