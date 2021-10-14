import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: primaryColor,
          onPressed: onPress,
          child: Text(text,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white))),
    );
  }
}
