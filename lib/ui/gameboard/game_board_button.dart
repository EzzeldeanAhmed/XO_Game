import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameBoardButton extends StatelessWidget {
  Function onClick;
  String symbol;
  int index = 0;
  GameBoardButton(
      {required this.symbol, required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
        onPressed: () {
          onClick(index);
        },
        child: Text(
          symbol,
          style: TextStyle(
              fontSize: 60,
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
