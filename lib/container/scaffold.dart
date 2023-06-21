import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget {
  const ScaffoldTest({super.key});

  @override
  _ScaffoldTest createState() => _ScaffoldTest();
}

class _ScaffoldTest extends State<ScaffoldTest>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 1;
  late TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    if (kDebugMode) {
      print(1);
    }
    _tabController.addListener(() {
      if (kDebugMode) {
        print(_tabController.index);
      }
      switch (_tabController.index) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app bar"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((v) => Tab(text: v)).toList()),
      ),
      // drawer: new MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: 'school')
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: _onAdd, child: const Icon(Icons.add)),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
              alignment: Alignment.center, child: Text(e, textScaleFactor: 5));
        }).toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onAdd() {}
}

// class _MyDrawer extends
