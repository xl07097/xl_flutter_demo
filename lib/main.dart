import 'package:flutter/material.dart';
import 'package:xl_flutter_demo/widgets/new_route.dart';
// import 'package:xl_flutter_demo/widgets/parentWidget.dart';
// import 'package:xl_flutter_demo/widgets/parentWidgetC.dart';
// import 'package:xl_flutter_demo/widgets/switchOrCheckbox.dart';
// import 'package:xl_flutter_demo/widgets/tapboxa.dart';
// import 'package:xl_flutter_demo/widgets/tip_route.dart';
// import 'package:xl_flutter_demo/widgets/parentWidget.dart';
// import 'package:xl_flutter_demo/widgets/parentWidgetC.dart';
// import 'package:xl_flutter_demo/widgets/switchOrCheckbox.dart';
// import 'package:xl_flutter_demo/widgets/tapboxa.dart';
import 'package:xl_flutter_demo/widgets/tip_route.dart';
import 'backup/home.dart';
// import 'container/clip.dart';
// import 'container/container.dart';
// import 'container/decorate.dart';
// import 'container/floatAction.dart';
import 'container/scaffold.dart';
// import 'widgets/text.dart';
// import 'widgets/textState.dart';
// import 'widgets/request.dart';
// import 'layout/column.dart';
// import 'layout/centerColumn.dart';
// import 'layout/column1.dart';
// import 'layout/flex.dart';
// import 'layout/flowLayout.dart';
// import 'layout/stackLayout.dart';
// import 'layout/align.dart';
// import 'container/padding.dart';
// import 'container/MyDrawer.dart';
// import 'scroll/SingleScroll.dart';
// import 'scroll/CustomScrollView.dart';
// import 'functional/WillPopScope.dart';
// import 'functional/StateWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     // return null;
      //   });
      // },
      // initialRoute: "/",
      routes: routers,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("home page"),
      ),
      drawer: const Drawer(key: null,),
      body: ListView.builder(
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(routeLists[index]);
            },
            child: Card(
              child: Container(
                alignment:Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal:10),
                height: 50,
                child: Text(routers.keys.toList()[index]),
              )
            ),
          );
        },
        itemCount: routers.length,
      )
    );
  }
}


Map<String, WidgetBuilder> routers = {
  "home": (context) => const HomePage(title: 'home'),
  // "单选开关和复选框": (context) => SwitchAndCheckbox(),
  "new_route": (context) => const NewRoute(),
  // "active": (context) => Tapboxa(),
  // "parentWidget": (context) => ParentWidget(),
  // "parentWidgetC": (context) => ParentWidgetC(),
  "tip_route": (context) => const TipRoute(text: "我是提示啊"),// ModalRoute.of(context).settings.arguments
  // "文本框or表单": (context) => TextTest(),
  // "有状态文本框or表单": (context) => TextStateTest(),
  // "请求测试": (context) => RequestTest(),
  // "布局1": (context) => ColumnTest(),
  // "布局2": (context) => CenterColumnTest(),
  // "布局3": (context) => Column3(),
  // "flex布局1": (context) => FlexTest1(),
  // "流式布局": (context) => FlowTest1(),
  // "层叠布局": (context) => StackTest(),
  // "层叠布局1": (context) => StackTest1(),
  // "对齐相对定位": (context) => AlignTest(),
  // "容器 padding": (context) => PaddingTest(),
  // "容器 装饰decorate": (context) => DecorateTest(),
  // "容器 container": (context) => ContainerTest(),
  "容器 scaffold": (context) => const ScaffoldTest(),
  // "底部Tab": (context) => const FloatActionTest(),
  // "clip剪切": (context) => ClipTest(),
  // "scroll": (context) => SinggleScrollTest(),
  // "sliverscroll": (context) => CustomScrollViewTest(),
  // "阻止退出": (context) => WillPopTest(),
  // "数据共享": (context) => DataWidgetTest(),
};
