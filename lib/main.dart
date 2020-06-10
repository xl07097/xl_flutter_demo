import 'package:flutter/material.dart';
import 'package:count/widgets/new_route.dart';
import 'package:count/widgets/parentWidget.dart';
import 'package:count/widgets/parentWidgetC.dart';
import 'package:count/widgets/switchOrCheckbox.dart';
import 'package:count/widgets/tapboxa.dart';
import 'package:count/widgets/tip_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return null;
        });
      },
      // initialRoute: "/",
      routes: routers,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
           body: Container(
        child: ListView.builder(
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: Card(
                child: Container(
                  alignment:Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal:10),
                  height: 50,
                  child: Text(routers.keys.toList()[index]),
                )
              ),
            );
            },
          itemCount: routers.length,
          ),
      )
    );
  }
}


Map<String, WidgetBuilder> routers = {
  // "/": (context) => MyHomePage(),
  "ck": (context) => SwitchAndCheckbox(),
  "new_route": (context) => NewRoute(),
  "active": (context) => Tapboxa(),
  "parentWidget": (context) => ParentWidget(),
  "parentWidgetC": (context) => ParentWidgetC(),
  "tip_route": (context) => TipRoute(text: "我是提示啊"),// ModalRoute.of(context).settings.arguments
};
