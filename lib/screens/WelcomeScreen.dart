import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

        Container(
          alignment: Alignment.center,
          height: 280,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Container(
            width: double.infinity,
            height: 45.0,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff3F8FD2)),
                ),
                child: Text("Регистрация",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                onPressed: () {}),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Container(
            width: double.infinity,
            height: 45.0,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff3F8FD2)),
                ),
                child: Text("Вход",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                onPressed: () {}),
          ),
        ),
      ]),
    );
  }
}
