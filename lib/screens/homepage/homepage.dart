import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _home(),
      bottomNavigationBar: _nav(),
    );
  }
}

class _nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 1, items: [
      BottomNavigationBarItem(icon: Icon(Icons.home)),
      BottomNavigationBarItem(icon: Icon(Icons.send)),
      BottomNavigationBarItem(icon: Icon(Icons.person_pin))
    ]);
  }
}

class _home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }
}
