import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxState(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ParentWidget"),
      ),
      body: new Container(
          child: new _TapboxB(active: _active, onChanged: _handleTapboxState)),
    );
  }
}

class _TapboxB extends StatelessWidget {
  _TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handle() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handle,
        child: new Container(
          child: new Center(
            child: new Text(active ? 'Active' : 'Inactive',
                style: new TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                )),
          ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
              color: active ? Colors.lightGreen[300] : Colors.grey[600]),
        ));
  }
}
