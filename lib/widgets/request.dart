import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RequestTest extends StatelessWidget {
  void _handleRequest() async {
    Response res = await Dio().get('http://localhost:3002/api/cars/lists');
    print(res.data.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http请求测试'),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            child: Text("请求"),
            onPressed: _handleRequest,
          )
        ],
      ),
    );
  }
}
