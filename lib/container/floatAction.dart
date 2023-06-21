import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FloatActionTest extends StatefulWidget {
  const FloatActionTest({super.key});

  @override
  _FloatActionTest createState() => _FloatActionTest();
}

class _FloatActionTest extends State<FloatActionTest>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            const SizedBox(), //中间位置空出
            IconButton(icon: const Icon(Icons.business), onPressed: () {}),
            IconButton(icon: const Icon(Icons.business), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  void _onAdd() {}
}
