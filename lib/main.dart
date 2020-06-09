import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';

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
          // String routeName = settings.name;
          return null;
        });
      },
      initialRoute: "ParentWidgetC",
      routes: {
        "new_route": (context) => NewRoute(),
        "active": (context) => Tapboxa(),
        "ParentWidget": (context) => ParentWidget(),
        "ParentWidgetC": (context) => ParentWidgetC(),
        "tip_route": (context) =>
            TipRoute(text: ModalRoute.of(context).settings.arguments),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have click the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RondamWord(),
            RouterTestToute(),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, 'new_route', arguments: "hi");
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return new NewRoute();
                // }));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return new Scaffold(
      appBar: AppBar(
        title: Text('new route'),
      ),
      body: Center(
        child: Text("this is a new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, '我是返回值');
                },
                child: Text('返回'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestToute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return TipRoute(
              text: "我是提示啊",
            );
          }));

          print('路由返回值: $result');
        },
        child: Text('打开提示页'),
      ),
    );
  }
}

class RondamWord extends StatelessWidget {
  final wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(wordPair.toString()),
    );
  }
}

class Tapboxa extends StatefulWidget {
  Tapboxa({Key key}) : super(key: key);
  @override
  _Tapboxa createState() => new _Tapboxa();
}

class _Tapboxa extends State<Tapboxa> {
  bool _active = false;

  void _handle() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handle,
      child: new Container(
        child: new Center(
            child: new Text(
          _active ? 'Active' : 'Inactive',
          style: new TextStyle(fontSize: 32.0, color: Colors.white),
        )),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightBlue[700] : Colors.grey[600]),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxState(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new TapboxB(active: _active, onChanged: _handleTapboxState));
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handle() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handle,
        child: new Container(
          child: new Center(
            child: new Text(active ? 'Active' : 'Inactive',
                style: new TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                )),
          ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
              color: active ? Colors.lightGreen[300] : Colors.grey[600]),
        ));
  }
}

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;
  void _handleTapbxcChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new TapboxC(active: _active, onChanged: _handleTapbxcChanged)
        // Image.network(
        //       "http://localhost:9101/public/images/2020/8/6/6bf9def0-61d7-43aa-b7ef-c0b064016943.png",
        //       width: 100.0,
        //     ),
        );
        // new TapboxC(active: _active, onChanged: _handleTapbxcChanged));
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
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
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleCancel,
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "Home: "
              ),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                  color: Colors.orange
                )
              ),
              ]
          ))
        // Text(widget.active ? "Active" : "Deactive",
        //       style: TextStyle(fontSize: 32.0, color: Colors.white,decoration: TextDecoration.none)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[300] : Colors.blue,
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
