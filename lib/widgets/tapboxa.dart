import 'package:flutter/material.dart';

class TapBox extends StatefulWidget {
  const TapBox({Key? key}) : super(key: key);

  @override
  TapboxState createState() => TapboxState();
}

class TapboxState extends State<TapBox> {
  bool _active = false;

  void _handle() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提示'),
      ),
      body: GestureDetector(
        onTap: _handle,
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
              color: _active ? Colors.lightBlue[700] : Colors.grey[600]),
          child: Center(
              child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
