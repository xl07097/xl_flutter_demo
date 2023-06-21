import 'package:flutter/material.dart';

class ParentWidgetC extends StatefulWidget {
  const ParentWidgetC({super.key});

  @override
  ParentWidgetCState createState() => ParentWidgetCState();
}

class ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;
  void _handleTapbxcChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
              // new Image.network(
              //       "http://localhost:9101/public/images/2019/8/6/6bf9def0-61d7-43aa-b7ef-c0b064016943.png",
              //       width: 100.0,
              //       height: 100.0,
              //     ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("ParentWidgetC"),
      ),
      body: TapboxC(
        active: _active,
        onChanged: _handleTapbxcChanged
      )
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key? key, this.active: false, required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxC createState() => new _TapboxC();
}

class _TapboxC extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    print(1);
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    print(2);
    setState(() {
      _highlight = false;
    });
  }

  void _handleCancel() {
    print(3);
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    print(4);
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleCancel,
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[300] : Colors.blue,
          border: _highlight
              ? Border.all(
                  color: Colors.teal,
                  width: 10.0,
                )
              : null,
        ),
        child: const Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.orange)
                ),
              ]
            )
          )
            // Text(widget.active ? "Active" : "Deactive",
            //       style: TextStyle(fontSize: 32.0, color: Colors.white,decoration: TextDecoration.none)),
        ),
      ),
    );
  }
}
