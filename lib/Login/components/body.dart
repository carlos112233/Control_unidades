import 'package:control_unidades/class/response.dart';
import 'package:control_unidades/class/verapp.dart';
import 'package:control_unidades/components/round_input_field.dart';
import 'package:control_unidades/components/rounded_button.dart';
import 'package:control_unidades/components/rounded_passwordfield.dart';
import 'package:control_unidades/homepage/consulta/consulta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:control_unidades/class/error.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super();

  Future<void> _showMyDialog(
      BuildContext context, String usuario, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (usuario == null || usuario == '') {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Usuario'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('No a ingresado Usuario'),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (password == null || password == '') {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Contraseña'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('No a ingresado Contraseña'),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      String url2 = "http://supertrack-net.ddns.net:8000/api/login";

      final String users = usuario;
      final String pass = password;
      var respuesta = await http.post(url2, body: {
        'user': users,
        'password': pass
      }, headers: {
        'Accept': 'application/javascript',
        'Content-Type': 'application/x-www-form-urlencoded'
      });

      // Error: toString of Response is assigned to jsonDataString.

      final mesaje = errorFromJson(respuesta.body);

      print(mesaje.message);
      if (mesaje.message == '' || mesaje.message == null) {
        final resultado = reqResponseFromJson(respuesta.body);
        prefs.setString('user', resultado.user.name);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Consulta(),
            ),
            (Route<dynamic> route) => false);
      } else if (mesaje.message == 'Invalid Credentials') {
        return showDialog<void>(
          context: context,
          barrierDismissible:
              false, //this means the user must tap a button to exit the Alert Dialog
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Usuario'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('El usuario o contraseña erronea'),
                  ],
                ),
              ),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void updatebuil(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    print(versionName);
    String url2 =
        "http://supertrack-net.ddns.net:50371/impbarcodeapp/src/php/c.u/version_app.php";
    var respuesta = await http.post(url2, body: {
      'ver': versionName,
    }, headers: {
      'Accept': 'application/javascript',
      'Content-Type': 'application/x-www-form-urlencoded'
    });
    final ver = verAppFromJson(respuesta.body);
    final newValue = ver.nombreVersin.replaceAll(".", "");
    final newValue2 = versionName.replaceAll(".", "");
    var verg = int.parse(newValue);
    var verl = int.parse(newValue2);

    print("local: $verl  \nglobal: $verg");
    if (verg > verl) {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Actualización'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Hay una nueva actualización'),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              //
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('Descargar'),
                onPressed: _launchURL,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: Text("Seguir"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  _launchURL() async {
    const url =
        'http://supertrack-net.ddns.net:50371/impbarcodeapp/src/php/c.u/ver_app/cu.apk';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    updatebuil(context);
    final TextEditingController user = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 4000,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 1,
                  ),
                  SvgPicture.asset(
                    "assets/icons/camion.svg",
                    height: size.height * 0.40,
                  ),
                  Text(
                    "Control de unidades",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  RoundedInputField(
                    controllers: user,
                    hintText: "Ingrese usuario",
                    icon: Icons.person,
                    onChaged: (value) {},
                    enabled: true,
                  ),
                  RoundedPasswordField(),
                  RoundButton(
                    text: "Iniciar",
                    color: Colors.redAccent,
                    press: () {
                      var titleTextValue = store.get("titleTextValue");
                      String pass = titleTextValue();
                      _showMyDialog(context, user.text, pass);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
