import 'package:control_unidades/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Myapps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppsState();
}

class _MyAppsState extends State<Myapps> {
  @override
  Widget build(BuildContext context) {
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
  }
}
