import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = ChangeNotifierProvider( (ref) => Counter());

class Counter extends ChangeNotifier {
  var counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final store = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(

        title: const Text('演習課題２'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
                child: const Text(
                    '次の画面へ',
                    style: TextStyle(fontSize: 20)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final store = context.watch<CounterStore>();
    final counter = store.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text('２画面目'),
      ),
      body: Center(
        child: TextButton(
          child: Text('受け取った数字：$counter'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}