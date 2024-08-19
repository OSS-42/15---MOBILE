import 'package:flutter/material.dart';
import 'package:logger/logger.dart'; //pour logger en console plutot que print.
import 'package:auto_size_text/auto_size_text.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const AutoSizeText(
            'Calculator',
            maxLines: 1,
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Column(
                children: [
                  ExpressionField(width: width),
                  const SizedBox(height: 10),
                  ResultField(width: width),
                  const SizedBox(height: 10),
                  const Spacer(),
                  Flexible(
                      child: ButtonField(height: height),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ExpressionField extends StatelessWidget {
  final double width;

  const ExpressionField({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: const AutoSizeText(
        'Expression Field',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
        ),
        maxLines: 1,
      ),
    );
  }
}

class ResultField extends StatelessWidget {
  final double width;
  const ResultField({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: const AutoSizeText(
        'Result Field',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
    );
  }
}

class ButtonField extends StatelessWidget {
  final double height;
  const ButtonField({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      [
        {'label': '7', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '8', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '9', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': 'C', 'style': TextStyle(color: Colors.red, backgroundColor: Colors.grey.withOpacity(0.2))},
        {'label': 'AC', 'style': TextStyle(color: Colors.red, backgroundColor: Colors.grey.withOpacity(0.2))},
      ],
      [
        {'label': '4', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '5', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '6', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '+', 'style': TextStyle(color: Colors.black, backgroundColor: Colors.blue.withOpacity(0.5))},
        {'label': '-', 'style': TextStyle(color: Colors.black, backgroundColor: Colors.blue.withOpacity(0.5))},
      ],
      [
        {'label': '1', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '2', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '3', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '*', 'style': TextStyle(color: Colors.black, backgroundColor: Colors.blue.withOpacity(0.5))},
        {'label': '/', 'style': TextStyle(color: Colors.black, backgroundColor: Colors.blue.withOpacity(0.5))},
      ],
      [
        {'label': '0', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '.', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '00', 'style': const TextStyle(color: Colors.white, backgroundColor: Colors.blue)},
        {'label': '=', 'style': TextStyle(color: Colors.black, backgroundColor: Colors.blue.withOpacity(0.5))},
        {'label': '', 'style': TextStyle(color: Colors.black, backgroundColor: Colors.blue.withOpacity(0.5))},
      ],
    ];
    // double height = MediaQuery.of(context).size.height;

  
          return GridView.builder(
              itemCount: buttons.length * buttons[0].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: (MediaQuery.of(context).size.width / 2) /
                 (MediaQuery.of(context).size.height / 4),
                ),
              itemBuilder: (BuildContext context, int index) {
                final row = index ~/ 5;
                final col = index % 5;
                final button = buttons[row][col] as Map<String, dynamic>;
                final buttonStyle = button['style'] as TextStyle;

                return TextButton(
                  onPressed: () => logger.i('Button ${button['label']} pressed'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(buttonStyle.backgroundColor),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    )
                  ),
                  child: AutoSizeText(
                    button['label'] as String,
                    style: TextStyle(
                      fontSize: 30,
                      color: buttonStyle.color,
                    ),
                  maxLines: 1,
                  ),
                );
              },
          );
  }
}

//ElevatedButton (
//   onPressed: () {
//     logger.i('Button pressed');
//   },
//   child: const Text('Click me'),
// ),