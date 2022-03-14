import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// P4-Providerのコード

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter StatefulWidget',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => CounterStore(),
        child: const MyHomePage(),
      ),
    );
  }
}

class CounterStore extends ChangeNotifier {
  var counter = 0;
  var list = <String>[];

  void incrementCounter() {
    counter++;
    list.add(counter.toString());

    notifyListeners();
  }

  void removeAt(int index) {
    list.removeAt(index);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<>();
  }
}