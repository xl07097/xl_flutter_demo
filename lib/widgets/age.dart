import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.brown),
    home: const MyHomePage()
  )
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double age = 0.0;
  var selectedYear;
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation = animationController;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  void _showPicker() {
    showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: DateTime(2018),
        lastDate: DateTime.now()).then((DateTime dt) {
      selectedYear = dt.year;
      calculateAge();
    } as FutureOr Function(DateTime? value));
  }

  void calculateAge() {
    setState(() {
      age = (2018 - selectedYear).toDouble();
      animation = Tween<double>(begin: animation.value, end: age).animate(
          CurvedAnimation(
              curve: Curves.fastOutSlowIn, parent: animationController));

      animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BackButton(color: Colors.black,onPressed: _showPicker,),

            // new OutlinedButton(
            //   child: new Text(selectedYear != null
            //       ? selectedYear.toString()
            //       : "Select your year of birth"),
            //   borderSide: new BorderSide(color: Colors.black, width: 3.0),
            //   color: Colors.white,
            //   onPressed: _showPicker,
            // ),
            const Padding(
              padding: EdgeInsets.all(20.0),
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Text(
                "Your Age is ${animation.value.toStringAsFixed(0)}",
                style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}