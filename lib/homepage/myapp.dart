import 'package:control_unidades/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'consulta/consulta.dart';

class Myapps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppsState();
}

class _MyAppsState extends State<Myapps> {
  var tokens;
  @override
  void initState() {
    _cargar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (tokens == null) {
      return Center(
        child: SplashScreen(
          seconds: 3,
          backgroundColor: Colors.white,
          image: Image.asset(
            'assets/images/st.png',
            alignment: Alignment.center,
          ),
          loaderColor: Colors.blue[900],
          loadingText: Text(
            "Bienvenido",
            style: TextStyle(
                fontFamily: "Arial", fontSize: 30, color: Colors.blue[900]),
          ),
          photoSize: 100.0,
          navigateAfterSeconds: LoginScreen(),
        ),
      );
    } else {
      return Center(
        child: SplashScreen(
          seconds: 3,
          backgroundColor: Colors.white,
          image: Image.asset(
            'assets/images/st.png',
            alignment: Alignment.center,
          ),
          loaderColor: Colors.blue[900],
          loadingText: Text(
            "Bienvenido",
            style: TextStyle(
                fontFamily: "Arial", fontSize: 30, color: Colors.blue[900]),
          ),
          photoSize: 100.0,
          navigateAfterSeconds: Consulta(),
        ),
      );
    }
  }

  _cargar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("Token");
    setState(() {
      tokens = token;
    });
  }
}
