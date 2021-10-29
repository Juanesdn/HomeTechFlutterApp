import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabProfile extends StatelessWidget {
  avatarCircular(Widget icon) => CircleAvatar(
        backgroundColor: Color(0xFFF0F0F0),
        radius: 22,
        child: Center(child: icon),
      );

  profilePicture() => Container(
        margin: EdgeInsets.all(20),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/flame-research.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
      );

  textPLUSicon(
          String order, String text, TextStyle textStyle, Widget iconWidget) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: order == "textIcon"
            ? <Widget>[
                Text(
                  text,
                  style: textStyle,
                ),
                iconWidget,
              ]
            : <Widget>[
                iconWidget,
                Text(
                  text,
                  style: textStyle,
                ),
              ],
      );

  nameTextStyle() => TextStyle(
        color: Color(0xFF2B2B2B),
        backgroundColor: Colors.transparent,
        fontSize: 34,
        letterSpacing: -0.41,
      );

  locationTextStyle() => TextStyle(
        color: Color(0xFFA1A1A2),
        backgroundColor: Colors.transparent,
        fontSize: 17,
        letterSpacing: -0.41,
      );

  menuItemTextStyle() => TextStyle(
        color: Color(0xFF2B2B2B),
        backgroundColor: Colors.transparent,
        fontSize: 15,
        letterSpacing: -0.41,
      );

  settingIcon() => Icon(
        Icons.settings_outlined,
        color: Color(0xFF2B2B2B),
        size: 20.0,
      );

  notificationIcon() => Icon(
        Icons.notifications_none_outlined,
        color: Color(0xFF2B2B2B),
        size: 20.0,
      );

  editIcon() => Icon(
        Icons.edit_outlined,
        color: Color(0xFF2B2B2B),
        size: 17.0,
      );

  locationIcon() => Icon(
        Icons.location_on_outlined,
        color: Color(0xFFA1A1A2),
        size: 17.0,
      );

  serviceIcon() => Icon(
        Icons.construction_outlined,
        color: Color(0xFF2B2B2B),
        size: 20.0,
      );

  favoriteIcon() => Icon(
        Icons.favorite_outline_outlined,
        color: Color(0xFF2B2B2B),
        size: 20.0,
      );

  walletIcon() => Icon(
        Icons.money_outlined,
        color: Color(0xFF2B2B2B),
        size: 20.0,
      );

  void nada() {}

  menuButton(Widget textPLUSicon) => Container(
        alignment: Alignment.topCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(343, 58),
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () => nada(),
            child: textPLUSicon,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    avatarCircular(settingIcon()),
                    avatarCircular(notificationIcon()),
                  ],
                ),
                profilePicture(),
                textPLUSicon(
                  "textIcon",
                  "Cristian Downey",
                  nameTextStyle(),
                  editIcon(),
                ),
                textPLUSicon(
                  "iconText",
                  "Barranquilla, Atlantico",
                  locationTextStyle(),
                  locationIcon(),
                ),
                SizedBox(
                  height: 12,
                ),
                menuButton(
                  textPLUSicon(
                    "iconText",
                    "Billetera",
                    menuItemTextStyle(),
                    walletIcon(),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                menuButton(
                  textPLUSicon(
                    "iconText",
                    "Servicios",
                    menuItemTextStyle(),
                    serviceIcon(),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                menuButton(
                  textPLUSicon(
                    "iconText",
                    "Mis favoritos",
                    menuItemTextStyle(),
                    favoriteIcon(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
