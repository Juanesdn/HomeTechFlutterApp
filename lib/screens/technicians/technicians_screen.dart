import 'package:flutter/material.dart';
import 'package:hometech_app/screens/calendarPlanning/calendar_planning_screen.dart';

class TechniciansScreen extends StatelessWidget {
  static String routeName = "/technicians";
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
            _Tech(context),
          ],
        ),
      ),
    );
  }
}

Widget _Tech(context) {
  return Column(
    children: [
      _Technitian(context),
      _Technitian(context),
      _Technitian(context),
      _Technitian(context),
      _Technitian(context),
      _Technitian(context),
    ],
  );
}

Widget _Technitian(context) {
  final size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CalendarPlanningScreen()));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
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
                  'Luis Orozco',
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'Plumero',
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
                      '2.5',
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
