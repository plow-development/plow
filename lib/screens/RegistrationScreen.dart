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
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Фамилия',
            ),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Имя',
            ),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Дата рождения',
            ),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 5,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            'Пол',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 30.0, right: 30.0),
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: TextButton(
                        child: Text('Мужской',
                            style: TextStyle(fontSize: 15, color: Colors.black)),
                        onPressed: () {}),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(''),
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                  TextButton(
                      child: Text('Женский',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      onPressed: () {}),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(''),
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Адрес электронной почты',
            ),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Логин',
            ),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Пароль',
            ),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Container(
            width: double.infinity,
            height: 45.0,
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff3F8FD2)),
                ),
                child: Text("Продолжить",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {}),
          ),
        ),
      ]),
    );
  }
}