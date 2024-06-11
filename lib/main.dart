import 'package:flutter/material.dart';
import 'package:xo_game/ui/gameboard/game_board.dart';
import 'package:xo_game/ui/screens/login_screen.dart';
import 'package:xo_game/ui/screens/players_name/players_name.dart';
import 'package:xo_game/ui/screens/splash/spalsh_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
        GameBoard.routeName: (_) => GameBoard(),
        PlayersNameScreen.routeName: (_) => PlayersNameScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
