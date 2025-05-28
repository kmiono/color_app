import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Color Page',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Random Color Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var random = math.Random();

    String hex = random.nextInt(100000).toRadixString(16);

    if (hex.length < 6) {
      hex = hex.padLeft(6, "0");
    }
    return Scaffold(
      backgroundColor: HexColor(hex),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '#$hex',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0).computeLuminance() < 0.5
                    ? Colors.white // 背景が暗いとき
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// 更新ボタンの実装
