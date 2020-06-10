import 'package:flutter/material.dart';

class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框及表单"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child:  Column(
          children: <Widget>[
            TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
            TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "登录密码",
                    prefixIcon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                )
          ]
        ),
      )
    );
  }
}
