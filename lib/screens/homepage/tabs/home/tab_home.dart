import 'package:flutter/material.dart';
import 'package:hometech_app/screens/categories/categories.dart';
import 'package:hometech_app/screens/description/description_screen.dart';
import 'package:hometech_app/widgets/default_button.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      _slideElectroD(context),
      _slideComputers(),
      _slideCasa(),
      _slidePipes(),
      _slideElectric(),
    ];

    List<Widget> listWidgetF = [
      _slideComputers(),
      _slideCasa(),
      _slideElectroD(context),
    ];

    List<Widget> listWidgetO = [
      _slidePipes(),
      _slideElectric(),
      _slideAC(),
      _slideCarpenter(),
    ];
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            _title(context),
            _search(),
            _card(),
            _category(context, listWidget),
            _frecuent(listWidgetF),
            _others(listWidgetO)
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
          Row(
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
              Container(
                margin: EdgeInsets.all(0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://st4.depositphotos.com/5532432/22087/v/600/depositphotos_220871294-stock-illustration-man-with-laptop-in-workplace.jpg'),
                    fit: BoxFit.fill,
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

_category(BuildContext context, List<Widget> listWidget) {
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
                        fontSize: 32,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 76),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesPage()));
                  },
                  child: SizedBox(
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
                ),
              ],
            ),
          ),
        ],
      ),
      _sliders(listWidget),
    ],
  );
}

_frecuent(listWidget) {
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
                        fontSize: 32,
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
      _sliders(listWidget),
    ],
  );
}

_others(listWidget) {
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
                        fontSize: 32,
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
      _sliders(listWidget),
    ],
  );
}

Widget _sliders(List<Widget> listWidget) {
  return Container(
    width: double.infinity,
    height: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listWidget.length,
                itemBuilder: (_, int index) {
                  return listWidget[index];
                }))
      ],
    ),
  );
}

Widget _slideElectroD(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DescriptionScreen()));
    },
    child: Container(
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
                  child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://decortips.com/es/wp-content/uploads/2018/09/electrodomesticos-cocina-768x512.jpg')),
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
                        child: Text(
                            "Neveras, licuadoras, lavadoras, entre otros")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _slideComputers() {
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
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://i.dell.com/is/image/DellContent//content/dam/global-site-design/product_images/dell_client_products/desktops/optiplex_desktops/franchise%20composite/desktop_optiplex_franchise-page_hero_540x310.jpg?fmt=jpg&wid=547')),
              ),
              SizedBox(height: 5.50),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Computadores",
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
                      child: Text(
                          "Computadores, Servidores, Pantallas, entre otros")),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _slideCasa() {
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
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'http://www.eltiempo.com/files/image_640_428/files/crop/uploads/2017/04/13/58f0012927bf1.r_1492229497780.0-107-3000-1607.jpeg')),
              ),
              SizedBox(height: 5.50),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Casa",
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
                      child: Text(
                          "Reparaciones, Modificaciones, Pintura, entre otros")),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _slidePipes() {
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
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'http://blog.dipacmanta.com/wp-content/uploads/2019/01/tuberias-de-agua.jpg')),
              ),
              SizedBox(height: 5.50),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tuberías",
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
                      child: Text(
                          "Desagües, Fugas de Agua, Reparaciones, entre otros")),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _slideElectric() {
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
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'http://ampliaydecoratuespacio.com/wp-content/uploads/2016/03/electricidad-2.jpg')),
              ),
              SizedBox(height: 5.50),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eléctrico",
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
                      child: Text(
                          "Bajo Voltaje, Switches, Reparaciones, entre otros")),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _slideAC() {
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
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://media.istockphoto.com/photos/installation-service-fix-repair-maintenance-of-an-air-conditioner-picture-id1169452266')),
              ),
              SizedBox(height: 5.50),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A/C",
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
                      child: Text(
                          "Arreglo de Aires Acondicionados, Filtros, etc")),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _slideCarpenter() {
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
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU2207py0whGoh7FxAxyVVkSVrQhBr9wcZI9wYA-fbeXEqwJKTgaJKm1GlLEgr8ni3sPw&usqp=CAU')),
              ),
              SizedBox(height: 5.50),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Carpintería",
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
                      child: Text(
                          "Carpintería, arreglos en madera, arreglos, etc")),
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

Widget _title(context) {
  return Container(
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
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoriesPage()));
          },
          child: Container(
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
        ),
      ],
    ),
  );
}
