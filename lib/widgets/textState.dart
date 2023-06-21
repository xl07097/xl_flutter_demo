import 'package:flutter/material.dart';

class TextStateTest extends StatefulWidget {
  const TextStateTest({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<TextStateTest> {
  String username = '';
  String password = '';
  final TextEditingController _controller = TextEditingController(text: "jack");
  // _controller.text('jack');
  // _controller.text="jack";
  // _controller.selection = TextSelection(
  //   baseOffset: 2,
  //   extentOffset: _selectionController.text.length
  // )


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("输入框及表单"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Column(children: <Widget>[
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              onChanged: (value) {
                print(value);
                setState(() {
                  username = value;
                });
              },
            ),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              onChanged: (value) {
                print(value);
                setState(() {
                  password = value;
                });
              },
            )
          ]),
        ));
  }
}
