import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:xl_flutter_demo/widgets/tip_route.dart';
import 'package:xl_flutter_demo/widgets/new_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have click the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              RandomWord(),
              const RouterTest(),
              TextButton(
                child: const Text('open new route'),
                onPressed: () {
                  Navigator.pushNamed(context, 'new_route', arguments: "hi");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NewRoute();
                  }));
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}

class RouterTest extends StatelessWidget {
  const RouterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return const TipRoute(
                  text: "我是提示啊",
                );
              }
            )
          );
          print('路由返回值: $result');
        },
        child: const Text('打开提示页'),
      ),
    );
  }
}

class RandomWord extends StatelessWidget {
  final wordPair = WordPair.random();

  RandomWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(wordPair.toString()),
    );
  }
}
