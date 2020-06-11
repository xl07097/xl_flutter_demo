import 'package:flutter/material.dart';

class DecorateTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("填充容器"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ]
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          gradient: LinearGradient(colors:[Colors.red, Colors.orange[700]] ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Colors.black54,
              offset: Offset(2.0,2.0)
            ),
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0,vertical:20.0),
          child: Text('Login',style: TextStyle(color:Colors.white),),
        ),
      ),
    );
  }
}
