import 'package:flutter/material.dart';
import 'package:hometech_app/screens/homepage/tabs/chat/tab_chat.dart';
import 'package:hometech_app/screens/homepage/tabs/home/tab_home.dart';
import 'package:hometech_app/screens/homepage/tabs/profile/tab_profile.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ChangeNotifierProvider(
      create: (_) => new _NavModel(),
      child: Scaffold(
        body: _home(),
        bottomNavigationBar: _nav(),
      ),
    );
  }
}

class _nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<_NavModel>(context);

    return BottomNavigationBar(
      currentIndex: navModel.getActualPage,
      onTap: (i) => navModel.setActualPage = i,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.send),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: "Perfil",
        ),
      ],
    );
  }
}

class _home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<_NavModel>(context);

    return SafeArea(
      child: PageView(
        controller: navModel.getPageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.white,
            child: TabHome(),
          ),
          Container(
            color: Colors.white,
            child: TabChat(),
          ),
          Container(
            color: Colors.white,
            child: TabProfile(),
          ),
        ],
      ),
    );
  }
}

class _NavModel with ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = new PageController(initialPage: 0);

  int get getActualPage => this._actualPage;

  set setActualPage(int value) {
    this._actualPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get getPageController => this._pageController;
}
