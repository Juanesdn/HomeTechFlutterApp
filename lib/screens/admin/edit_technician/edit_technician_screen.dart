import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometech_app/constants.dart';
import 'package:hometech_app/controller/auth_controller.dart';

class EditTechnicianScreen extends StatefulWidget {
  const EditTechnicianScreen({Key? key}) : super(key: key);
  @override
  _EditTechnicianScreenState createState() => _EditTechnicianScreenState();
}

class TechnicianListDataModel {
  String technician_name;
  String technician_specialization;
  TechnicianListDataModel(this.technician_name, this.technician_specialization);
}

class _EditTechnicianScreenState extends State<EditTechnicianScreen> {
  final ScrollController _firstController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      _technicianChoose = technicianDataList[0];
    });
  }

  //String _technicianChoose;
  TechnicianListDataModel? _technicianChoose;

  void _onDropDownItemSelected(TechnicianListDataModel? newSelectedTechnician) {
    setState(() {
      _technicianChoose = newSelectedTechnician;
    });
  }

  List<TechnicianListDataModel> technicianDataList = [
    //TechnicianListDataModel("Si", "Seleccione un tipo de tecnico"),
    TechnicianListDataModel("Luis ", "Bocinas"),
    TechnicianListDataModel("Juan", "Teclados"),
    TechnicianListDataModel("Valeria", "Laptops"),
  ];

  void nada() {}

  void createTechnician() async {
    _authController
        .createTechnician(_technicianChoose!.technician_specialization);
    Navigator.pop(context);
  }

  defaultButton(String labelText, VoidCallback onPressed) => Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          gradient: labelText == "Cancelar" ? null : primaryGradientColor,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            minimumSize: const Size(163, 58),
            primary: labelText == "Cancelar"
                ? Color(0xFFF2F2F2)
                : Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Text(
            labelText,
            style: labelText == "Cancelar"
                ? TextStyle(color: Color(0xFFB0B0B0))
                : TextStyle(color: Color(0xFFF7F7F8)),
          ),
        ),
      );

  defaultTextFormField(
          String label, int i, TextEditingController textEditingController) =>
      Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: textEditingController,
          maxLines: i,
          style: defaultTextStyle(),
          decoration: defaultInputDecoration(label),
        ),
      );

  defaultInputDecoration(String label) => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Color(0xFFF0F0F0),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: primaryColor),
        ),
        labelStyle: TextStyle(
          color: Color(0xFFAEAEB2),
        ),
        labelText: label,
      );

  defaultFormField() => Padding(
        padding: EdgeInsets.all(10),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return defualtInputDecorator();
          },
        ),
      );

  defaultTextStyle() => TextStyle(
        color: Color(0xFF2B2B2B),
        foreground: null,
      );

  defualtInputDecorator() => InputDecorator(
        decoration: defaultInputDecoration(""),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<TechnicianListDataModel>(
            style: defaultTextStyle(),
            hint: Text(
              "Especializacion",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            items: technicianDataList
                .map<DropdownMenuItem<TechnicianListDataModel>>(
                    (TechnicianListDataModel value) {
              return defaultDropdownMenuItem(value);
            }).toList(),
            isExpanded: true,
            isDense: true,
            onChanged: (TechnicianListDataModel? newSelectedTechnician) {
              _onDropDownItemSelected(newSelectedTechnician);
            },
            value: _technicianChoose,
          ),
        ),
      );

  defaultDropdownMenuItem(TechnicianListDataModel tldm) => DropdownMenuItem(
        value: tldm,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 15,
            ),
            Text(tldm.technician_specialization),
          ],
        ),
      );

  defaultSafeArea() => Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.topCenter,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Editar T??cnico",
                      style: TextStyle(
                        color: Color(0xFF2B2B2B),
                        backgroundColor: Colors.transparent,
                        fontSize: 34,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                defaultTextFormField("Fullname", 1, _authController.fullName),
                defaultTextFormField("Email", 1, _authController.email),
                defaultTextFormField("Celular", 1, _authController.celular),
                defaultFormField(),
                Row(
                  children: [
                    Expanded(
                      child:
                          defaultTextFormField("Edad", 1, _authController.edad),
                    ),
                    Expanded(
                      child: defaultTextFormField(
                          "Experiencia", 1, _authController.experiencia),
                    ),
                  ],
                ),
                defaultTextFormField(
                    "Localizacion", 1, _authController.localizacion),
                defaultTextFormField("Acerca de", 3, _authController.acercaDe),
                Row(
                  children: [
                    Expanded(
                      child: defaultTextFormField(
                          "Puntaje", 1, _authController.puntaje),
                    ),
                    Expanded(
                      child: defaultTextFormField(
                          "Precio por hora", 1, _authController.precioPorHora),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    defaultButton("Cancelar", () {
                      Navigator.pop(context);
                    }),
                    defaultButton("Guardar", () {
                      createTechnician();
                    })
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          // Child can also be SingleChildScrollView, GridView, etc.
          child: defaultSafeArea(),
        ),
      ),
    );
  }
}


//ListView.builder(
//          itemCount: 10,
  //        itemBuilder: (context, index) {
   //         return Text(
     //         " title: Text('Index )",
       //     );
        //  },
        //),