import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    print(args);

    return Scaffold(
      appBar: AppBar(
        title: const Text('new route'),
      ),
      body: const Center(
        child: Text("this is a new route"),
      ),
    );
  }
}
