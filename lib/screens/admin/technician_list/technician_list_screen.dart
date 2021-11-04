import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/screens/admin/edit_technician/edit_technician_screen.dart';

class TechnicianListScreen extends StatefulWidget {
  const TechnicianListScreen({Key? key}) : super(key: key);
  @override
  TechnicianListScreenState createState() => TechnicianListScreenState();
}

class Person {
  String name;
  String type;
  Person(this.name, this.type);
}

class TechnicianListScreenState extends State<TechnicianListScreen> {
  bool sortAsc = true;
  bool sortTypeAsc = true;
  bool sortNameAsc = true;
  int? sortColumnIndex, columnIndex; //creo
  List<Person> persons = [
    Person("Juan ", "Electrista"),
    Person("Luis ", "Plumero"),
    Person("Valeria ", "Eletrónico"),
  ];

  @override
  void initState() {
    super.initState();
    persons = [
      Person("Juan ", "Electrista"),
      Person("Luis ", "Plumero"),
      Person("Valeria ", "Eletrónico"),
    ];
  }

  void nada() {}

  @override
  Widget build(BuildContext context) {
    var myColumns = [
      DataColumn(
        label: Text('Nombre'),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == sortColumnIndex) {
              sortAsc = sortNameAsc = sortAscending;
            } else {
              sortColumnIndex = columnIndex;
              sortAsc = sortNameAsc;
            }
            persons.sort((a, b) => a.name.compareTo(b.name));
            if (!sortAscending) {
              persons = persons.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: Text('Tipo Técnico'),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == sortColumnIndex) {
              sortAsc = sortTypeAsc = sortAscending;
            } else {
              sortColumnIndex = columnIndex;
              sortAsc = sortTypeAsc;
            }
            persons.sort((a, b) => a.type.compareTo(b.type));
            if (!sortAscending) {
              persons = persons.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: Text('Editar'),
      ),
      DataColumn(
        label: Text('Eliminar'),
      ),
    ];

    var myRows = persons.map((person) {
      return DataRow(cells: [
        DataCell(Text(person.name)),
        DataCell(Text('${person.type}')),
        DataCell(Icon(Icons.edit), onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditTechnicianScreen()));
        }),
        DataCell(Icon(Icons.delete), onTap: () {}),
      ]);
    });

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            _title(context),
            SizedBox(
              height: 10,
            ),
            _search(),
            Container(
                child: DataTable(
              columnSpacing: 20,
              columns: myColumns,
              rows: myRows.toList(),
              sortColumnIndex: sortColumnIndex,
              sortAscending: sortAsc,
            )),
          ],
        ),
      ),
    );
  }
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
                        Icons.search,
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
                  "Buscar",
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
                "Lista de técnicos",
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditTechnicianScreen()));
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
                  "Agregar Técnico",
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
