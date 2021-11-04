import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SigleCard(
              color: Colors.black,
              icon: Icons.router,
              text: 'Eletrodomesticos'),
          _SigleCard(
              color: Colors.black,
              icon: Icons.laptop_rounded,
              text: 'Computadores'),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.black, icon: Icons.house_rounded, text: 'Casa'),
          _SigleCard(
              color: Colors.black,
              icon: Icons.plumbing_outlined,
              text: 'Tuberías'),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.black,
              icon: Icons.flash_on_rounded,
              text: 'Eléctico'),
          _SigleCard(color: Colors.black, icon: Icons.ac_unit, text: 'A/C'),
        ]),
        TableRow(children: [
          _SigleCard(color: Colors.black, icon: Icons.tv, text: 'Televisores'),
          _SigleCard(
              color: Colors.black,
              icon: Icons.window_rounded,
              text: 'Carpintería'),
        ]),
      ],
    );
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
