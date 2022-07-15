import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('stat.png'),
    );
  }

}