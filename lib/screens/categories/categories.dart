import 'package:flutter/material.dart';
import 'package:hometech_app/screens/categories/widgets/card_table.dart';
import 'package:hometech_app/screens/description/description_screen.dart';
import 'package:hometech_app/screens/technicians/technicians_screen.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _categories(context),
    );
  }
}

Widget _categories(context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        _title(),
        SizedBox(
          width: 50,
          height: 20,
        ),
        CardTable(),
        SizedBox(
          width: 50,
          height: 50,
        ),
        _button(context),
        SizedBox(
          width: 50,
          height: 50,
        ),
      ],
    ),
  );
}

Widget _button(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DescriptionScreen()));
    },
    child: Column(
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
          "Categor??as",
          style: TextStyle(
            color: Color(0xff2b2b2b),
            fontSize: 34,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      SizedBox(
        width: 50,
        height: 20,
      ),
      SizedBox(
        width: 316,
        child: Text(
          "Dinos en qu?? necesitas ayuda",
          style: TextStyle(
            color: Color(0xffa0a0a0),
            fontSize: 17,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      SizedBox(
        child: Text(
          "Escoge uno",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xff2b2b2b),
            fontSize: 22,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      )
    ],
  );
}
