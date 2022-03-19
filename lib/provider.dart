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

class CounterStore with ChangeNotifier {
  var counter = 0;
  var list = <String>[];

  void incrementCounter() {
    counter++;
    list.add(counter.toString());
    notifyListeners();
  }

  void removeAt(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CounterStore>();
    final list = store.list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(
                  list[index],
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                onTap: () {
                  context.read<CounterStore>().removeAt(index);
                },
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CounterStore>().incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}