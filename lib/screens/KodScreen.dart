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
          height: 250,
        ),
        Padding(
          padding: EdgeInsets.only(right: 50),
          child: Text('Введите код подтверждения'),
        ),
        Container(
          alignment: Alignment.center,
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 55,
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
                child: Text("Подтвердить",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                onPressed: () {}),
          ),
        ),
      ]),
    );
  }
}