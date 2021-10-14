import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../widgets/splash_content.dart';
import '../../../widgets/default_button.dart';

import 'package:hometech_app/screens/login/login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Disponibildiad los 365 dias del año",
      "image": "assets/images/flame-renovation-work.png"
    },
    {
      "text": "De la mano de expertos.",
      "image": "assets/images/flame-research.png"
    },
    {
      "text": "sin comprar artilujios.",
      "image": "assets/images/flame-design-science.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) {
                    return SplashContent(
                        image: splashData[index]["image"] ?? "",
                        text: splashData[index]["text"] ?? "");
                  },
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(children: [
                  const Spacer(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(splashData.length,
                          (index) => buildDot(index: index))),
                  const Spacer(flex: 3),
                  DefaultButton(
                      text: "Continuar",
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }),
                  const Spacer()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? primaryColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
