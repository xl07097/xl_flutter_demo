import 'package:flutter/material.dart';

class FlexTest1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("flex布局测试"),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                  child: Center(
                    child: Text('1'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text('2'),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                      child: Center(
                        child: Text('2'),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 4
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                      child: Center(
                        child: Text('2'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
