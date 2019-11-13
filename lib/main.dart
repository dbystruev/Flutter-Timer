import 'package:flutter/material.dart';

class SandGlass {
  int _sand = 0;

  int time() => _sand;

  Future tick() async {
    _sand = 100;
    print('Начало tick()');
    while (0 < _sand) {
      print('Осталось: $_sand');
      _sand--;
      final duration = Duration(milliseconds: 100);
      await Future.delayed(duration);
    }
    print('Окончание tick()');
  }
}

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State {
  SandGlass clock = SandGlass();

  _redrawWidget() async {
    if (clock.time() == 0) return;

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      print('redrawWidget() ${clock.time()}');
    });
  }

  @override
  void initState() {
    clock.tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _redrawWidget();

    final time = clock.time();

    print('Tick: $time');
    return Center(
      child: Text('Оставшееся время: $time'),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ),
);