import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatefulWidget {
  @override
  State<CardTable> createState() => _CardTableState();
}

class _CardTableState extends State<CardTable> {
  List<Color> colores = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];
  String selected = "";

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _activeButton(0);
              });
              selected = 'Eletrodomesticos';
            },
            child: _SigleCard(
                color: colores[0],
                icon: Icons.router,
                text: 'Eletrodomesticos'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _activeButton(1);
              });
              selected = 'Computadores';
            },
            child: _SigleCard(
                color: colores[1],
                icon: Icons.laptop_rounded,
                text: 'Computadores'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _activeButton(2);
              });
              selected = 'Casa';
            },
            child: _SigleCard(
                color: colores[2], icon: Icons.house_rounded, text: 'Casa'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _activeButton(3);
              });
              selected = 'Tuberías';
            },
            child: _SigleCard(
                color: colores[3],
                icon: Icons.plumbing_outlined,
                text: 'Tuberías'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _activeButton(4);
              });
              selected = 'Electrico';
            },
            child: _SigleCard(
                color: colores[4],
                icon: Icons.flash_on_rounded,
                text: 'Eléctrico'),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  _activeButton(5);
                });
                selected = 'A/C';
              },
              child: _SigleCard(
                  color: colores[5], icon: Icons.ac_unit, text: 'A/C')),
        ]),
        TableRow(children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  _activeButton(6);
                });
                selected = 'Televisores';
              },
              child: _SigleCard(
                  color: colores[6], icon: Icons.tv, text: 'Televisores')),
          GestureDetector(
            onTap: () {
              setState(() {
                _activeButton(7);
              });
              selected = 'Carpinteria';
            },
            child: _SigleCard(
                color: colores[7],
                icon: Icons.window_rounded,
                text: 'Carpintería'),
          ),
        ]),
      ],
    );
  }

  void _activeButton(int s) {
    if (colores[s] == Colors.black) {
      for (var i = 0; i < colores.length; i++) {
        colores[i] = Colors.black;
      }
      colores[s] = Colors.orange;
    } else {
      for (var i = 0; i < colores.length; i++) {
        colores[i] = Colors.black;
      }
    }
  }
}

class _SigleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SigleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: this.color,
          child: Icon(
            this.icon,
            size: 35,
            color: Colors.white,
          ),
          radius: 30,
        ),
        SizedBox(height: 10),
        Text(
          this.text,
          style: TextStyle(color: this.color, fontSize: 18),
        )
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: Color.fromRGBO(230, 230, 230, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
