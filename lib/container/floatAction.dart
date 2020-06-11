import 'package:flutter/material.dart';

class FloatActionTest extends StatefulWidget {
  @override
  _FloatActionTest createState() => _FloatActionTest();
}

class _FloatActionTest extends State<FloatActionTest>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      print(_tabController.index);
      switch (_tabController.index) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app bar"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((v) => Tab(text: v)).toList()),
      ),
      // drawer: new MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business), onPressed: () {}),
            IconButton(icon: Icon(Icons.business), onPressed: () {}),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: _onAdd),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
              alignment: Alignment.center, child: Text(e, textScaleFactor: 5));
        }).toList(),
      ),
    );
  }

  void _onAdd() {}
}
