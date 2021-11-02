import 'package:flutter/material.dart';
import 'package:hometech_app/screens/categories/categories.dart';
import 'package:hometech_app/widgets/default_button.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            _title(),
            _search(),
            _card(),
            _category(context),
            _frecuent(),
            _others()
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xfffe904b), Color(0xfffb724c)],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 43,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 179,
                child: Text(
                  "¿Algo más especializado?",
                  style: TextStyle(
                    color: Color(0xfffef8f4),
                    fontSize: 13,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 179,
                child: Text(
                  "¡Pidenos ayuda!",
                  style: TextStyle(
                    color: Color(0xfffbfbfb),
                    fontSize: 17,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_category(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            width: 330,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      "Categorías",
                      style: TextStyle(
                        color: Color(0xff202020),
                        fontSize: 34,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 76),
                SizedBox(
                    width: 80,
                    child: DefaultButton(
                      text: "Ver todo",
                      onPress: (() => {
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesPage()),
                          }),
                      color: Colors.white,
                      // style: TextStyle(Navigator.push(
                    )
                    //   color: Color(0xff202020),
                    //   fontSize: 15,
                    //   decoration: TextDecoration.underline,
                    // ),

                    ),
              ],
            ),
          ),
        ],
      ),
      _sliders(),
    ],
  );
}

_frecuent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            width: 330,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      "Frecuentes",
                      style: TextStyle(
                        color: Color(0xff202020),
                        fontSize: 34,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 76),
                SizedBox(
                  width: 70,
                  child: Text(
                    "Ver todo",
                    style: TextStyle(
                      color: Color(0xff202020),
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      _sliders(),
    ],
  );
}

_others() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            width: 330,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      "Otros",
                      style: TextStyle(
                        color: Color(0xff202020),
                        fontSize: 34,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 76),
                SizedBox(
                  width: 70,
                  child: Text(
                    "Ver todo",
                    style: TextStyle(
                      color: Color(0xff202020),
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      _sliders(),
    ],
  );
}

Widget _sliders() {
  return Container(
    width: double.infinity,
    height: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, int index) {
                  return _slide();
                }))
      ],
    ),
  );
}

Widget _slide() {
  return Container(
    width: 200,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 179,
          //height: 172,
          padding: const EdgeInsets.only(
            top: 1,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                //height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: FlutterLogo(size: 125),
              ),
              SizedBox(height: 2.50),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Electrodomesticos",
                    style: TextStyle(
                      color: Color(0xff202020),
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                      width: 157,
                      //height: 30,
                      child:
                          Text("Neveras, licuadoras, lavadoras, entre otros")),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _search() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xffefefef),
    ),
    padding: const EdgeInsets.all(9),
    margin: EdgeInsets.all(25),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 165.50,
          height: 23.50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                padding: const EdgeInsets.only(
                  top: 1,
                  bottom: 4,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 12.50,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 7),
                  ],
                ),
              ),
              SizedBox(width: 3.50),
              SizedBox(
                width: 142,
                height: 40,
                child: Text(
                  "¿Qué necesitas?",
                  style: TextStyle(
                    color: Color(0xffa0a0a0),
                    fontSize: 17,
                  ),
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
  return Container(
    //width: 343,
    //height: 77,
    margin: EdgeInsets.all(25),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // width: 119,
              child: Text(
                "Inicio",
                style: TextStyle(
                  color: Color(0xff202020),
                  fontSize: 34,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              //width: 180,
              child: Text(
                "Explora los servicios",
                style: TextStyle(
                  color: Color(0xffa0a0a0),
                  fontSize: 17,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 15),
        Container(
          // width: 104,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xfffe904b), Color(0xfffb724c)],
            ),
          ),
          padding: const EdgeInsets.symmetric(
            // horizontal: 15,
            vertical: 13,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 5),
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(width: 15),
              Text(
                "Pedir Servicio",
                style: TextStyle(
                  color: Color(0xfffcfcfc),
                  fontSize: 10,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
      ],
    ),
  );
}
