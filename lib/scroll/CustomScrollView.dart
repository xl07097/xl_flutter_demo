import 'package:flutter/material.dart';

class CustomScrollViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 234.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Dem0"),
              background: Image.asset('static/222.jpg'),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0),
              delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20
              ),
            ),
          ),
          SliverFixedExtentList(itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate((BuildContext context, int index){
            return new Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: new Text('list item $index'),
                    );
            },
          childCount: 50 //50个列表项
          ),)
        ]
      ),
    );
  }
}
