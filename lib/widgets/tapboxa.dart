import 'package:flutter/material.dart';

class Tapboxa extends StatefulWidget {
  Tapboxa({Key key}) : super(key: key);
  @override
  _Tapboxa createState() => new _Tapboxa();
}

class _Tapboxa extends State<Tapboxa> {
  bool _active = false;

  void _handle() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('提示'),
      ),
      body: new GestureDetector(
        onTap: _handle,
        child: new Container(
          child: new Center(
              child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          )),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
              color: _active ? Colors.lightBlue[700] : Colors.grey[600]),
        ),
      ),
    );
  }
}
