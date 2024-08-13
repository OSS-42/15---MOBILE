import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart'; //pour le provider
import 'package:logger/logger.dart'; //pour logger en console plutot que print.

// to add a log in the console instead of print().
var logger = Logger(
  printer: PrettyPrinter(),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Mobile Module00 - ex00',
        theme: ThemeData(// This is the theme of your application.
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 11, 198, 55)),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column (
        children: [
          const Text('A simple text',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          Text(appState.current.asLowerCase),
          ElevatedButton (
            onPressed: () {
              logger.i('Button pressed');
            },
            child: const Text('Click me'),
          ),
        ],
      ),
    );
  }
}


