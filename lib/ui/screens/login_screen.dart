import 'package:flutter/material.dart';
import 'package:xo_game/ui/screens/players_name/players_name.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            child: Icon(Icons.account_circle_outlined),
          ),
        ),
        leadingWidth: 70,
        title: const Text("Login"),
        toolbarHeight: MediaQuery.of(context).size.height * .1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 6, 38, 221),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                onChanged: (text) {
                  email = text;
                },
                decoration: const InputDecoration(
                    label: Text(
                  "Username ",
                )),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PlayersNameScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          "login",
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  )),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PlayersNameScreen.routeName);
                },
                child: const Text("Enter Players Name ",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 11, 5, 207),
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
