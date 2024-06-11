import 'package:flutter/material.dart';
import 'package:xo_game/player_name.dart';
import 'package:xo_game/ui/gameboard/game_board_button.dart';

class GameBoard extends StatefulWidget {
  static String routeName = "gameboard";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> Board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(BuildContext context) {
    Player_Name args =
        ModalRoute.of(context)!.settings.arguments as Player_Name;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(
          "XO Game",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.deepPurple, Colors.blue])),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.deepPurple, Colors.blue])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${args.player1Name} : $player1Score",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.greenAccent),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${args.player2Name} : $player2Score",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.greenAccent),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    symbol: Board[0], onClick: OnButtonClick, index: 0),
                GameBoardButton(
                    symbol: Board[1], onClick: OnButtonClick, index: 1),
                GameBoardButton(
                    symbol: Board[2], onClick: OnButtonClick, index: 2),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    symbol: Board[3], onClick: OnButtonClick, index: 3),
                GameBoardButton(
                    symbol: Board[4], onClick: OnButtonClick, index: 4),
                GameBoardButton(
                    symbol: Board[5], onClick: OnButtonClick, index: 5),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    symbol: Board[6], onClick: OnButtonClick, index: 6),
                GameBoardButton(
                    symbol: Board[7], onClick: OnButtonClick, index: 7),
                GameBoardButton(
                    symbol: Board[8], onClick: OnButtonClick, index: 8),
              ],
            )),
          ],
        ),
      ),
    );
  }

  OnButtonClick(int index) {
    if (Board[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "x" : "o";
    Board[index] = symbol;
    counter++;
    if (checkwinner(symbol)) {
      if (symbol == "x")
        player1Score++;
      else
        player2Score++;
      resetBoard();
      return;
    }
    if (counter == 9) {
      resetBoard();
    }
    setState(() {});
  }

  void resetBoard() {
    Board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
    setState(() {});
  }

  bool checkwinner(String symboll) {
    for (int i = 0; i <= 6; i += 3) {
      if (Board[i] == symboll &&
          symboll == Board[i + 1] &&
          symboll == Board[i + 2]) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (Board[i] == symboll &&
          symboll == Board[i + 3] &&
          symboll == Board[i + 6]) {
        return true;
      }
    }

    if (Board[0] == symboll && symboll == Board[4] && symboll == Board[8]) {
      return true;
    }
    if (Board[2] == symboll && symboll == Board[4] && symboll == Board[6]) {
      return true;
    }
    return false;
  }
}
