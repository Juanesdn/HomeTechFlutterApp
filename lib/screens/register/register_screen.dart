import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static String routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  Color _getTextColor(Set<MaterialState> states) => states.any(<MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      }.contains)
          ? Colors.green
          : Colors.blue;
  /*
  testButton() => ElevatedButton.icon(
      onPressed: () {/* do something here */},
      //icon: googleLogo(),
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(_getTextColor),
      ),
      label: Text(
        "Update",
        style: TextStyle(color: Colors.white),
      ));
  */
  registrarseButton() => MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: primaryColor,
      onPressed: () => setState(() => _isPasswordVisible = _isPasswordVisible),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(130, 20, 130, 20),
        child: Text(
          "Registrarse",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ));
  /*
  googleLogo() => Image.asset(
        "../../../assets/images/Google_logo.png",
        height: 30,
        width: 30,
      );

  facebookLogo() => Image.asset(
        "../../../assets/images/Facebook_logo.png",
        height: 30,
        width: 30,
      );
      */

  redSocialButton() => MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color(0xFF3B5998),
        onPressed: () =>
            setState(() => _isPasswordVisible = _isPasswordVisible),
        child: Text(
          "Conectarse con facebook",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  passwordIconButton() => IconButton(
        color: primaryColor,
        icon: _isPasswordVisible
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        onPressed: () =>
            setState(() => _isPasswordVisible = !_isPasswordVisible),
      );

  defaultInputDecoration(String label) => InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        fillColor: Color(0xFFF0F0F0),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: primaryColor),
        ),
        labelStyle: TextStyle(color: Color(0xFFAEAEB2)),
        labelText: label,
        suffixIcon:
            label == "Password" ? passwordIconButton() : SizedBox.shrink(),
      );

  fullnameTextFormField() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          foreground: null,
          color: Color(0xFF2B2B2B),
        ),
        decoration: InputDecoration(
            fillColor: Color(0xF0F0F0),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            hintText: 'Fullname'),
      );

  emailTextFormField() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          foreground: null,
          color: Color(0xFF2B2B2B),
        ),
        decoration: InputDecoration(
            fillColor: Color(0xF0F0F0),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            hintText: 'Email'),
      );

  passwordTextFormField() => TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_isPasswordVisible,
        maxLines: 1,
        style: TextStyle(
          foreground: null,
          color: Color(0xFF2B2B2B),
        ),
        decoration: InputDecoration(
            fillColor: Color(0xF0F0F0),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            hintText: 'Password'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF2B2B2B)),
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 4,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 25),
              child: SingleChildScrollView(
                  child: Column(children: [
                Text(
                  'Empecemos aquí',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.41,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 25),
                  child: Text(
                    "Registrate para empezar",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF7A7A7A),
                      fontFamily: "Poppins",
                      fontSize: 17,
                      letterSpacing: -0.41,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
                  child: fullnameTextFormField(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
                  child: emailTextFormField(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
                  child: passwordTextFormField(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
                  child: registrarseButton(),
                ),
                Text(
                  "Por medio del registro, estoy de acuerdo con los Terminos de servicio y  Políticas de privacidad",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7A7A7A),
                    fontFamily: "Poppins",
                    fontSize: 14,
                    letterSpacing: -0.41,
                  ),
                )
              ])),
            ),
          ),
        ));
  }
}
