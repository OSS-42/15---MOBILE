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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              ExpressionField(width: width),
              const SizedBox(height: 10),
              ResultField(width: width),
              const SizedBox(height: 10),
              Expanded(
                child: ButtonField(height: height * 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calculator'),
//       ),
//       body: const Column(
//           children: [
//             ExpressionField(),
//             SizedBox(height: 10),
//             ResultField(),
//             SizedBox(height: 10),
//             ButtonField(),
//           ],
//         ),
//       );
//   }
// }

class ExpressionField extends StatelessWidget {
  final double width;
  const ExpressionField({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: const Text(
        'Expression Field',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
        ),
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
      child: const Text(
        'Result Field',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
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
      ['7','8','9','C','AC'],
      ['4','5','6','+','-'],
      ['1','2','3','*','/'],
      ['0','.','00','=', ''],
    ];
    // double height = MediaQuery.of(context).size.height;

  
          return Expanded(
            child: GridView.builder(
              itemCount: buttons.length * buttons[0].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: (MediaQuery.of(context).size.width / 5) /
                    (MediaQuery.of(context).size.height / 5),
              ),
              itemBuilder: (BuildContext context, int index) {
                final row = index ~/ 5;
                final col = index % 5;
                return TextButton(
                  onPressed: () => logger.i('Button ${buttons[row][col]} pressed'),
                  child: Text(buttons[row][col]),
                );
              },
            ),
          );
  }
}

//ElevatedButton (
//   onPressed: () {
//     logger.i('Button pressed');
//   },
//   child: const Text('Click me'),
// ),