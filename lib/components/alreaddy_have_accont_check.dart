import 'package:flutter/material.dart';
import '../constant.dart';

class AlreadyHaveAnAccontCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccontCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿No recuerdas tu Contraseña?" : "",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Recuperar" : "No",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
