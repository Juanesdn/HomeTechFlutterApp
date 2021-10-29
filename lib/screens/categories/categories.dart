import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _categories(),
    );
  }
}

Widget _categories() {
  return Column(
    children: [_title(), _choose(), _category(), _button()],
  );
}

Widget _choose() {
  return SizedBox(
    width: 152,
    child: Text(
      "Escoge uno",
      style: TextStyle(
        color: Color(0xff2b2b2b),
        fontSize: 22,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget _button() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 305,
        height: 58,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                  opacity: 0.40,
                  child: Container(
                    width: 269,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Color(0xfffe904b), Color(0xfffb724c)],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 305,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color(0xfffe904b), Color(0xfffb724c)],
                ),
              ),
              padding: const EdgeInsets.only(
                left: 103,
                right: 96,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pedir Ayuda",
                    style: TextStyle(
                      color: Color(0xffe7e7e9),
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _category() {
  return Container(
    width: 343,
    height: 524,
    child: Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 165,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xfff7f7f7),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 49,
                vertical: 43,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Chasing",
                        style: TextStyle(
                          color: Color(0xff2b2b2b),
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 163,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xfff7f7f7),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 49,
                vertical: 43,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlutterLogo(size: 48),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Barking",
                        style: TextStyle(
                          color: Color(0xff2b2b2b),
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xfff7f7f7),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 49,
                vertical: 43,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlutterLogo(size: 48),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Modem",
                        style: TextStyle(
                          color: Color(0xff2b2b2b),
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 163,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xfff7f7f7),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 49,
                vertical: 43,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Laptop",
                        style: TextStyle(
                          color: Color(0xff2b2b2b),
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xfff7f7f7),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 49,
                vertical: 43,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlutterLogo(size: 48),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Teclado",
                        style: TextStyle(
                          color: Color(0xff2b2b2b),
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 191,
          top: 288,
          child: Opacity(
            opacity: 0.40,
            child: Container(
              width: 141,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xfffb724c),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 163,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Color(0xfffb724c),
                  width: 1.50,
                ),
                color: Color(0xfff7f7f7),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 49,
                vertical: 43,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 47,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Monitor",
                        style: TextStyle(
                          color: Color(0xff2b2b2b),
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _title() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 329,
        child: Text(
          "Categorías",
          style: TextStyle(
            color: Color(0xff2b2b2b),
            fontSize: 34,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      SizedBox(
        width: 316,
        child: Text(
          "Dinos en qué necesitas ayuda",
          style: TextStyle(
            color: Color(0xffa0a0a0),
            fontSize: 17,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
