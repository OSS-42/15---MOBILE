import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mobile Module00 - ex00',
        // This is the theme of your application.
        theme: ThemeData( 
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: Scaffold(
      body: Builder (
        builder: (context) {
          // var orientation = MediaQuery.of(context).orientation;
          return Center (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SimpleText(),
                const SizedBox(height: 10),
                ElevatedButton (
                  onPressed: () {
                    logger.i('Button pressed');
                  },
                  child: const Text('Click me'),
                ),
                // Text('Orientation: $orientation'),
              ],
            ),
          );
        },
      ),
     ),
    );
  }
}

class SimpleText extends StatelessWidget {
  const SimpleText({super.key,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text('A simple text', style: style),
        ),
    );
  }
}


