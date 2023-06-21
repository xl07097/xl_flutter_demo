import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RequestTest extends StatelessWidget {
  const RequestTest({super.key});


  void _handleRequest() async {
    Map<String,dynamic> map = {};
    map["userId"]= "1";
    Options option =Options();
    option.responseType = ResponseType.json;
    Response res = await Dio().get('https://sse.zhiqiuge.com/api/cars/lists',queryParameters: map,options: option);
    print(res);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http请求测试'),
          actions:  const [Text("请求数据"),Text("请求数据"),Text("请求数据"),Text("请求数据"),Text("请求数据"),Text("请求数据"),Text("请求数据")]
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: _handleRequest,
            child: const Text("请求"),
          )
        ],
      ),
    );
  }
}
