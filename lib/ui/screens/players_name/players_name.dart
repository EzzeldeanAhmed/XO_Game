import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xo_game/player_name.dart';
import 'package:xo_game/ui/gameboard/game_board.dart';

class PlayersNameScreen extends StatefulWidget {
  static const routeName = "PalyersName";
  const PlayersNameScreen({super.key});

  @override
  State<PlayersNameScreen> createState() => _PlayersNameScreenState();
}

class _PlayersNameScreenState extends State<PlayersNameScreen> {
  String player1 = "Player one";
  String player2 = "Player two";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Players Name ",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
              TextField(
                onChanged: (text) {
                  player1 = text;
                },
                decoration: InputDecoration(labelText: "Player 1 Name"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (text) {
                  player2 = text;
                },
                decoration: InputDecoration(labelText: "Player 2 Name"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GameBoard.routeName,
                        arguments: Player_Name(player1, player2));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          ""
                          "Play",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 16, 40, 159),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
