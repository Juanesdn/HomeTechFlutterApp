import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechnicianListScreen extends StatefulWidget {
  const TechnicianListScreen({Key? key}) : super(key: key);
  @override
  TechnicianListScreenState createState() => TechnicianListScreenState();
}

class Person {
  String name;
  int age;
  num height;
  Person(this.name, this.age, this.height);
}

class TechnicianListScreenState extends State<TechnicianListScreen> {
  bool sortAgeAsc = true;
  bool sortAsc = true;
  bool sortHeightAsc = true;
  bool sortNameAsc = true;
  int? sortColumnIndex, columnIndex; //creo
  List<Person> persons = [
    Person("George ", 18, 173),
    Person("Dave ", 21, 183),
    Person("Sam ", 55, 170),
  ];

  @override
  void initState() {
    super.initState();
    persons = [
      Person("George ", 18, 173),
      Person("Dave ", 21, 183),
      Person("Sam ", 55, 170),
    ];
  }

  void nada() {}

  @override
  Widget build(BuildContext context) {
    var myColumns = [
      DataColumn(
        label: Text('name'),
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
        label: Text('age'),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == sortColumnIndex) {
              sortAsc = sortAgeAsc = sortAscending;
            } else {
              sortColumnIndex = columnIndex;
              sortAsc = sortAgeAsc;
            }
            persons.sort((a, b) => a.age.compareTo(b.age));
            if (!sortAscending) {
              persons = persons.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: Text('Hight'),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == sortColumnIndex) {
              sortAsc = sortHeightAsc = sortAscending;
            } else {
              sortColumnIndex = columnIndex;
              sortAsc = sortHeightAsc;
            }
            persons.sort((a, b) => a.height.compareTo(b.height));
            if (!sortAscending) {
              persons = persons.reversed.toList();
            }
          });
        },
      ),
    ];

    var myRows = persons.map((person) {
      return DataRow(cells: [
        DataCell(Text(person.name)),
        DataCell(Text('${person.age}')),
        DataCell(Text('${person.height}cm')),
      ]);
    });

    return Scaffold(
      body: Center(
        child: Container(
            child: DataTable(
          columns: myColumns,
          rows: myRows.toList(),
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAsc,
        )),
      ),
    );
  }
}
