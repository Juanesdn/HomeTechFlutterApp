import 'package:flutter/material.dart';
import 'package:hometech_app/screens/homepage/homepage.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.lightGreen,
                    size: 100,
                  ),
                  Text('Su pedido ha sido un exito'),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(icon: Icons.call, text: 'Chat'),
          CustomButton(icon: Icons.map_sharp, text: 'Ruta'),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: CustomButton(icon: Icons.home, text: 'Home')),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.icon,
          color: Colors.blue,
          size: 50,
        ),
        Text(this.text, style: TextStyle(color: Colors.blue, fontSize: 20))
      ],
    );
  }
}
