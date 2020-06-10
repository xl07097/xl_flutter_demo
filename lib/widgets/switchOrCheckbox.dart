import 'package:flutter/material.dart';
// 多选 checkbox，switch

class SwitchAndCheckbox extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckbox> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('switch')
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Switch(
                value: _switchSelected, //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Text(_switchSelected?'开':'关')
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              ),
              Text(_checkboxSelected?'开':'关')
            ]
          )
        ],
      )
    );
  }
}
