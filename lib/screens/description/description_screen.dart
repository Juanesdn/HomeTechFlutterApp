import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometech_app/controller/request_controller.dart';
import 'package:hometech_app/screens/technicians/technicians_screen.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  final _requestController = Get.find<RequestController>();

  TextFormField buildFormField() {
    return TextFormField(
        controller: _requestController.problem,
        decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Problema",
          hintText: "Ingresa el problema aqui",
        ));
  }

  TextFormField builField() {
    return TextFormField(
        controller: _requestController.description,
        maxLines: 8,
        minLines: 1,
        decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "Descripción",
            hintText: "Ingresa la descripción del problema aquí"));
  }

  Widget _button(context) {
    return GestureDetector(
      onTap: () {
        Get.to(TechniciansScreen(category: ""));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe7e7e9),
        centerTitle: true,
        title: Text("Describe tu problema"),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Form(
                child: Column(
                  children: [
                    buildFormField(),
                    SizedBox(height: 10),
                    builField(),
                    SizedBox(
                      height: 10,
                    ),
                    _button(context),
                  ],
                ),
              ))),
    );
  }
}
