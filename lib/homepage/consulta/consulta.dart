import 'dart:io';

import 'package:control_unidades/Login/components/background.dart';
import 'package:control_unidades/components/inputconsulta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Consulta extends StatefulWidget {
  @override
  _ConsultaState createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  List<String> _locations; // Option 2
  String _selectedLocation; // Option 2
  bool ver = false;

  lista() async {
    var lista;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        lista = ['Carta porte', 'Unidad'];
      }
    } on SocketException catch (_) {
      lista = ['Catálogo de unidades'];
    }

    setState(() {
      _locations = lista;
    });
  }

  @override
  void initState() {
    lista();
    sleep(Duration(seconds: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));

    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        _onBackPressed(context, "");
      },
      child: Scaffold(
        body: Background(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  onPressed: () {
                    _onBackPressed(context, "si");
                  },
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Icon(
                    Icons.exit_to_app,
                    size: 45,
                  ),
                  padding: EdgeInsets.all(10),
                  shape: CircleBorder(),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Container(
                        child: Text(
                          "Control de unidades",
                          style: TextStyle(fontSize: 34, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width * .50,
                          height: 50,
                          child: DropdownButton(
                            iconSize: 50,
                            hint: Center(
                              child: Text(
                                'Seleccione',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ), // Not necessary for Option 1
                            value: _selectedLocation,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation = newValue;
                                ver = true;
                              });
                            },
                            items: _locations.map((location) {
                              return DropdownMenuItem(
                                child: Center(
                                    child: Text(
                                  location,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                )),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InputCPUnidades(
                      ver: ver,
                      seleccion: _selectedLocation,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context, String salir) async {
    String mensaje = "¿Estás seguro de que quieres de la app?";
    if (salir == "si") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      mensaje = "¿Estás seguro de que quieres de sesión?";
      prefs.clear();
    }

    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sugerencia!'),
              content: Text(mensaje),
              actions: <Widget>[
                OutlinedButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                OutlinedButton(
                  child: Text('si'),
                  onPressed: () => exit(0),
                )
              ],
            );
          },
        ) ??
        false;
  }
}
