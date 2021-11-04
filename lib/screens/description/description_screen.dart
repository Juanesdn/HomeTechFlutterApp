import 'package:flutter/material.dart';
import 'package:hometech_app/screens/technicians/technicians_screen.dart';

class DescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            _Overview(),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xffe7e7e9),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.all(0),
          title: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Colors.black12,
              child: buildFormField())),
    );
  }
}

TextFormField buildFormField() {
  return TextFormField(
      decoration: const InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: "Problema",
    hintText: "Ingresa el problema aqui",
    hintStyle: TextStyle(fontSize: 10.0),
  ));
}

TextFormField builField() {
  return TextFormField(
      maxLines: 8,
      minLines: 1,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Descripción",
          hintText: "Ingresa la descripción del problema aquí"));
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            builField(),
            SizedBox(
              height: 10,
            ),
            _button(context),
          ],
        ));
  }
}

Widget _button(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TechniciansScreen()));
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
                  left: 80,
                  right: 96,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Elige al Técnico",
                      style: TextStyle(
                        color: Color(0xffe7e7e9),
                        fontSize: 16,
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
