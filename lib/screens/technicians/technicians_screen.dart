import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometech_app/controller/request_controller.dart';
import 'package:hometech_app/screens/calendarPlanning/calendar_planning_screen.dart';

class TechniciansScreen extends StatefulWidget {
  static String routeName = "/technicians";
  final String category;

  TechniciansScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<TechniciansScreen> createState() => _TechniciansScreenState();
}

class _TechniciansScreenState extends State<TechniciansScreen> {
  final _requestService = Get.find<RequestController>();

  @override
  void initState() {
    super.initState();
  }

  Widget _Tech() {
    var technicians = _requestService.techniciansList;
    return Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: technicians.length,
            itemBuilder: (context, index) {
              return _Technitian(
                  technicians[index]["fullname"],
                  technicians[index]["especialidad"],
                  technicians[index]["puntaje"]);
            }),
      ],
    );
  }

  Widget _Technitian(String nombre, String especialidad, int puntaje) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        /* Navigator.push(context,
          MaterialPageRoute(builder: (context) => CalendarPlanningScreen())); */
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 200,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage(
                    'https://img-c.udemycdn.com/user/200_H/37526024_0001_2.jpg'),
                height: 150,
                width: 110,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: Theme.of(context).textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    especialidad,
                    style: Theme.of(context).textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        puntaje.toString(),
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Técnicos Disponibles',
                  style: Theme.of(context).textTheme.headline5,
                )),
            _search(),
            SizedBox(height: 10),
            FutureBuilder<String>(
              future: _requestService
                  .fetchTechnicians(), // function where you call your api
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                // AsyncSnapshot<Your object type>
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Please wait its loading...'));
                } else {
                  if (snapshot.hasError)
                    return Center(child: Text('Error: ${snapshot.error}'));
                  else
                    return Center(
                        child:
                            _Tech()); // snapshot.data  :- get your object which is pass from your downloadData() function
                }
              },
            ),
/*             _Tech(),
 */
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
