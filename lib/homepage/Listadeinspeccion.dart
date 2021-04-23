import 'package:control_unidades/components/rounded_button.dart';
import 'package:control_unidades/homepage/Tractoform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DollyForm.dart';
import 'RemolqueForm.dart';
import 'consulta/vistapreliminar.dart';

class InspecTractoList extends StatelessWidget {
  final bool bolrem2;
  final Color colorTracto;
  final Color colorRemolque;
  final Color colorDolly;
  final Color colorRemolque2;
  const InspecTractoList({
    Key key,
    this.bolrem2,
    this.colorTracto,
    this.colorRemolque,
    this.colorDolly,
    this.colorRemolque2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    print(bolrem2);
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        _onBackPressed(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lista de Inspección"),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Tracto"),
              subtitle: Text("Inspección"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TractoForm(
                        variable: bolrem2,
                        colorDolly: colorDolly,
                        colorRemolque2: colorRemolque2,
                        colorRemolque: colorRemolque,
                      );
                    },
                  ),
                );
              },
              tileColor: colorTracto,
            ),
            ListTile(
              title: Text("Remolque"),
              subtitle: Text("Inspección "),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return RemolqueForm(
                        tipoRemolque: "1",
                        rem: "697929",
                        placas: "534-UR-6",
                        remolque: bolrem2,
                        colorDolly: colorDolly,
                        colorRemolque2: colorRemolque2,
                        colorTracto: colorTracto,
                      );
                    },
                  ),
                );
              },
              tileColor: colorRemolque,
            ),
            Visibility(
              visible: bolrem2,
              child: ListTile(
                title: Text("Dolly"),
                subtitle: Text("Inspección"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Dolly(
                          llanta1: "5465125",
                          llanta2: "5465134",
                          dolly: "SD-011",
                          rem2: bolrem2,
                          colorDolly: colorDolly,
                          colorRemolque: colorRemolque,
                          colorRemolque2: colorRemolque2,
                          colorTracto: colorTracto,
                        );
                      },
                    ),
                  );
                },
                tileColor: colorDolly,
              ),
            ),
            Visibility(
              visible: bolrem2,
              child: ListTile(
                title: Text("Remolque 2"),
                subtitle: Text("Inspección"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return RemolqueForm(
                          tipoRemolque: "2",
                          rem: "697927",
                          placas: "MMS-S52-1",
                          remolque: bolrem2,
                          colorDolly: colorDolly,
                          colorRemolque: colorRemolque,
                          colorRemolque2: colorRemolque2,
                          colorTracto: colorTracto,
                        );
                      },
                    ),
                  );
                },
                tileColor: colorRemolque2,
              ),
            ),
            Center(
              child: RoundButton(
                text: "Finalizar inspección",
                color: Colors.red,
                press: () {
                  if ((colorDolly != null &&
                          colorRemolque != null &&
                          colorRemolque2 != null &&
                          colorTracto != null) ||
                      (colorTracto != null &&
                          bolrem2 == false &&
                          colorRemolque != null)) {
                    //inserción
                    //
                    //
                    //
                    //
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VistaPreliminar(
                            visible: bolrem2,
                          ),
                        ),
                        (Route<dynamic> route) => false);
                  } else {
                    _inspeccion(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _inspeccion(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, //this means the user must tap a button to exit the Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Inspección'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('No a Terminado la Inspección de la unidad'),
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

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Esta seguro de Salír?'),
            content: new Text(
                'Si sales de la aplicación la inspección se eliminará'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("Si"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
