import 'package:flutter/material.dart';

// P2-StatefulWidgetのコード

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _list = <String>[];

  void _incrementCounter() {
    setState(() { //
      _counter++;
      _list.add(_counter.toString());
    });
  }

  void _removeAt(int index) {
    setState(() {
      _list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('StatefulWidget'),
      ),
      body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(
                  _list[index],
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                onTap: () {
                  _removeAt(index);
                },
              )
            );
          }
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}