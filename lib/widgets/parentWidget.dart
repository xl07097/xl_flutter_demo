import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  ParentWidgetState createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
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
        title: const Text("ParentWidget"),
      ),
      body: Tapbox(active: _active, onChanged: _handleTapboxState),
    );
  }
}

class Tapbox extends StatelessWidget {
  const Tapbox({Key? key, this.active = false, required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handle() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handle,
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[300] : Colors.grey[600]
          ),
          child: Center(
            child: Text(active ? 'Active' : 'Inactive',
                style: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                )),
          ),
        )
      );
  }
}
