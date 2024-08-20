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
      title: 'Mobile Module00 - ex01',
      // This is the theme of your application.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> appStateNotifier = ValueNotifier<int>(0); //variable qui sera écoutée

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder (
        builder: (context) {
          return Center(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleText(appStateNotifier: appStateNotifier),
                const SizedBox(height: 10),
                ElevatedButton (
                  onPressed: () {
                    appStateNotifier.value = appStateNotifier.value == 1 ? 0 : 1; //changemenet de la variable écoutée
                    logger.i('Button pressed');
                  },
                  child: const Text('Click me'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SimpleText extends StatelessWidget {
  final ValueNotifier<int> appStateNotifier;

  const SimpleText({super.key, required this.appStateNotifier});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    //appState is automatically set to the current value of appStateBotifier by the ValueListenableBuilder.
    //You don't need to explicitly define appState = appStateNotifier.value because the ValuelistenableBuilder handles this for you.
    return ValueListenableBuilder<int>(
      valueListenable: appStateNotifier,
      builder: (context, appState, child) {
        return Card(
            color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(20),
                child: Text(
                  appState == 0 ? 'A Simple text' : 'Hello World!',
                  style: style,
                ),
            ),
        );
      }
    );
  }
}

//The ValueListenableBuilder handles the assignment of apPState for you because it is
// deisgned to listen to a ValueListenable and automatically rebuild the widget tree
//when the value changes. here's a step-by-step explanation:
//1. Value Listenable : appStateNotifier is a ValueNotifier'int", which is a type of
//  ValueListenable. it holds a value and notifies listeners when the value changes.
//2. ValueListenableBuilder: this widget listens to a ValueListenable and rebuilds its
//  child widget whenever the value changes. It takes three parameters :
//  - valueListenable: the ValueListenable to listen to.
//  - builder: a function that gets called whenever the value changes. It provides
//    the current value as parameter.
//  - child: an optional constant child widget that does not depend on the value.
//3. builder function: the builder function is called with three parameters :
//  - context: the build context.
//  - appState: the current value of the ValueListenable (appStateNotifier).
//  - child: the optional constant child widget.
//Because ValueListenableBuilder automatically passes the current value of
//appStateNotifier to the builder function as appState, you don't need to manually
//assign appState = appStateNotifier.value.