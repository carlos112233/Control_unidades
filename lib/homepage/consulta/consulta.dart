import 'dart:io';

import 'package:control_unidades/Login/components/background.dart';
import 'package:control_unidades/components/inputconsulta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Consulta extends StatefulWidget {
  @override
  _ConsultaState createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  List<String> _locations = ['Carta porte', 'Unidad']; // Option 2
  String _selectedLocation; // Option 2
  bool ver = false;

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
        _onBackPressed(context);
      },
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(
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
                      width: size.width * .40,
                      height: 50,
                      child: DropdownButton(
                        iconSize: 50,
                        hint: Center(
                          child: Text(
                            'Seleccione',
                            style: TextStyle(fontSize: 30, color: Colors.black),
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
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            )),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                InputCPUnidades(
                  ver: ver,
                  seleccion: _selectedLocation,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                OutlinedButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                OutlinedButton(
                  child: Text('Yes'),
                  onPressed: () => exit(0),
                )
              ],
            );
          },
        ) ??
        false;
  }
}
