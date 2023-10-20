import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  final Random _random = Random();

  Color _color = const Color(0xFFFFFFFF);
  bool isSelected = false;
  void changeColor() {
    setState(() {
      isSelected = !isSelected;
      _color = Color.fromARGB(
        // fromRGBO with fourth arg as _random.nextDouble(),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final color =
        Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
    Colors.primaries[generatedColor];
    return Scaffold(
      backgroundColor: _color,
      body: InkWell(
        onTap: () {
          changeColor();
        },
        child: Center(
          child: AnimatedDefaultTextStyle(
            style: isSelected
                ? TextStyle(
                    fontSize: 50, color: color, fontWeight: FontWeight.bold)
                : TextStyle(
                    fontSize: 24.0, color: color, fontWeight: FontWeight.w400),
            duration: const Duration(milliseconds: 200),
            child: const Text("Hello There"),
          ),
        ),
      ),
    );
  }
}
