import 'dart:io';

import 'package:control_unidades/components/rounded_button.dart';
import 'package:control_unidades/homepage/Tractoform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DollyForm.dart';
import 'RemolqueForm.dart';
import 'consulta/vistapreliminar.dart';

class InspecTractoList extends StatelessWidget {
  final bool bolrem2;
  final Color colorTracto;
  final Color colorRemolque;
  final Color colorDolly;
  final Color colorRemolque2;
  final String unidad;
  final String placasunida;
  final String dolly;
  final String rem1;
  final String placasrem1;
  final String rem2;
  final String placasrem2;
  const InspecTractoList({
    Key key,
    this.bolrem2,
    this.colorTracto,
    this.colorRemolque,
    this.colorDolly,
    this.colorRemolque2,
    this.unidad,
    this.dolly,
    this.rem1,
    this.rem2,
    this.placasunida,
    this.placasrem1,
    this.placasrem2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

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
                print(unidad);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TractoForm(
                        unidad: unidad,
                        placa: placasunida,
                        variable: bolrem2,
                        colorDolly: colorDolly,
                        colorRemolque2: colorRemolque2,
                        colorRemolque: colorRemolque,
                        placasunida: placasunida,
                        rem1: rem1,
                        placasrem1: placasrem1,
                        rem2: rem2,
                        placasrem2: placasrem2,
                        dolly: dolly,
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
                        unidad: unidad,
                        placasunida: placasunida,
                        dolly: dolly,
                        rem: rem1,
                        placasrem1: placasrem1,
                        rem2: rem2,
                        placasrem2: placasrem2,
                        remolquebol: bolrem2,
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
                          dolly: dolly,
                          unidad: unidad,
                          placasunida: placasunida,
                          rem1: rem1,
                          placasrem1: placasrem1,
                          rem2: rem2,
                          placasrem2: placasrem2,
                          rem2bool: bolrem2,
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
                          unidad: unidad,
                          placasunida: placasunida,
                          rem2: rem2,
                          placasrem2: placasrem2,
                          tipoRemolque: "2",
                          dolly: dolly,
                          rem: rem1,
                          placasrem1: placasrem2,
                          remolquebol: bolrem2,
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
                    //
                    _vistaprevia(context);
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
          builder: (context) {
            return AlertDialog(
              title: Text('¿Esta seguro de Salír?'),
              content:
                  Text('Si sales de la aplicación la inspección se eliminará'),
              actions: <Widget>[
                OutlinedButton(
                  child: Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                OutlinedButton(
                  child: Text('SI'),
                  onPressed: () => exit(0),
                )
              ],
            );
          },
        ) ??
        false;
  }

  void _vistaprevia(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String motivoingreso = prefs.getString("motivoingreso");
    String unidad = prefs.getString("unidad");
    String llanta2 = prefs.getString("llantarevt2");
    String llanta4 = prefs.getString("llantarevt4");
    String llanta6 = prefs.getString("llantarevt6");
    String llanta8 = prefs.getString("llantarevt8");
    String llanta10 = prefs.getString("llantarevt10");
    String defensadelantera = prefs.getString("defensadelantera");
    String motor = prefs.getString("motor");
    String pisodecabiba = prefs.getString("pisodecabiba");
    String tanquedeDiesel = prefs.getString("tanquedeDiesel");
    String cMTDer = prefs.getString("cMTDer");
    String capTanqueLTDer = prefs.getString("capTanqueLTDer");
    String trampaDer = prefs.getString("trampaDer");
    String aluminio = prefs.getString("aluminio");
    String taponDieselDer = prefs.getString("taponDieselDer");
    String cabina = prefs.getString("cabina");
    String tanqueAire = prefs.getString("tanqueAire");
    String ejeImpulsor = prefs.getString("ejeImpulsor");
    String quintaRueda = prefs.getString("quintaRueda");
    String escape = prefs.getString("escape");
    String cMTIzq = prefs.getString("cMTIzq");
    String capTanqueLTIzq = prefs.getString("capTanqueLTIzq");
    String trampaIzq = prefs.getString("trampaIzq");
    String fierro = prefs.getString("fierro");
    String tapondeDieselIzq = prefs.getString("tapondeDieselIzq");
    String llanta1s = prefs.getString("llantarevt1");
    String llanta3s = prefs.getString("llantarevt3");
    String llanta5s = prefs.getString("llantarevt5");
    String llanta7s = prefs.getString("llantarevt7");
    String llanta9s = prefs.getString("llantarevt9");
    //dolly
    String llanta1D = prefs.getString("llanta1d");
    String llanta2D = prefs.getString("llanta2d");
    String llanta3D = prefs.getString("llanta3d");
    String llanta4D = prefs.getString("llanta4d");
    String llanta5D = prefs.getString("llanta5d");
    String llanta6D = prefs.getString("llanta6d");
    String llanta7D = prefs.getString("llanta7d");
    String llanta8D = prefs.getString("llanta8d");
    String dolly = prefs.getString("dolly");
    //rem
    String fmrem1 = prefs.getString("fmrem1");
    String serem1 = prefs.getString("serem1");
    String fdremrem1 = prefs.getString("fdremrem1");
    String partintderrem1 = prefs.getString("partintderrem1");
    String pisopartintrem1 = prefs.getString("pisopartintrem1");
    String llantarem1Eco0 = prefs.getString("llantaremrev1Eco0");
    String llantarem1Eco2 = prefs.getString("llantaremrev1Eco2");
    String llantarem1Eco4 = prefs.getString("llantaremrev1Eco4");
    String llantarem1Eco6 = prefs.getString("llantaremrev1Eco6");
    String pulizrem1 = prefs.getString("pulizrem1");
    String parinizqrem1 = prefs.getString("parinizqrem1");
    String techointrem1 = prefs.getString("techointrem1");
    String paredfrontalrem1 = prefs.getString("paredfrontalrem1");
    String llantarem1Eco1 = prefs.getString("llantaremrev1Eco1");
    String llantarem1Eco3 = prefs.getString("llantaremrev1Eco3");
    String llantarem1Eco5 = prefs.getString("llantaremrev1Eco5");
    String llantarem1Eco7 = prefs.getString("llantaremrev1Eco7");
    //rem2
    String fmrem2 = prefs.getString("fmrem2");
    String serem2 = prefs.getString("serem2");
    String fdremrem2 = prefs.getString("fdremrem2");
    String partintderrem2 = prefs.getString("partintderrem2");
    String pisopartintrem2 = prefs.getString("pisopartintrem2");
    String llantarem2Eco0 = prefs.getString("llantaremrev2Eco0");
    String llantarem2Eco2 = prefs.getString("llantaremrev2Eco2");
    String llantarem2Eco4 = prefs.getString("llantaremrev2Eco4");
    String llantarem2Eco6 = prefs.getString("llantaremrev2Eco6");
    String pulizrem2 = prefs.getString("pulizrem2");
    String parinizqrem2 = prefs.getString("parinizqrem2");
    String techointrem2 = prefs.getString("techointrem2");
    String paredfrontalrem2 = prefs.getString("paredfrontalrem2");
    String llantarem2Eco1 = prefs.getString("llantaremrev2Eco1");
    String llantarem2Eco3 = prefs.getString("llantaremrev2Eco3");
    String llantarem2Eco5 = prefs.getString("llantaremrev2Eco5");
    String llantarem2Eco7 = prefs.getString("llantaremrev2Eco7");

    print(llanta2D);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return VistaPreliminar(
            visible: bolrem2,
            //unidad
            unidad: unidad,
            placaunida: placasunida,
            motivoingreso: motivoingreso,
            llanta2: llanta2,
            llanta4: llanta4,
            llanta6: llanta6,
            llanta8: llanta8,
            llanta10: llanta10,
            defensadelantera: defensadelantera,
            motor: motor,
            pisodecabiba: pisodecabiba,
            tanquedeDiesel: tanquedeDiesel,
            cMTDer: cMTDer,
            capTanqueLTDer: capTanqueLTDer,
            trampaDer: trampaDer,
            aluminio: aluminio,
            taponDieselDer: taponDieselDer,
            cabina: cabina,
            tanqueAire: tanqueAire,
            ejeImpulsor: ejeImpulsor,
            quintaRueda: quintaRueda,
            escape: escape,
            cMTIzq: cMTIzq,
            capTanqueLTIzq: capTanqueLTIzq,
            trampaIzq: trampaIzq,
            fierro: fierro,
            tapondeDieselIzq: tapondeDieselIzq,
            llanta1s: llanta1s,
            llanta3s: llanta3s,
            llanta5s: llanta5s,
            llanta7s: llanta7s,
            llanta9s: llanta9s,
            //dolly
            llanta1d: llanta1D,
            llanta2d: llanta2D,
            llanta3d: llanta3D,
            llanta4d: llanta4D,
            llanta5d: llanta5D,
            llanta6d: llanta6D,
            llanta7d: llanta7D,
            llanta8d: llanta8D,
            dolly: dolly,
            //rem
            unidadrem1: rem1,
            rem1placa: placasrem1,
            fmrem1: fmrem1,
            serem1: serem1,
            fdremrem1: fdremrem1,
            partintderrem1: partintderrem1,
            pisopartintrem1: pisopartintrem1,
            llantarem1Eco0: llantarem1Eco0,
            llantarem1Eco2: llantarem1Eco2,
            llantarem1Eco4: llantarem1Eco4,
            llantarem1Eco6: llantarem1Eco6,
            pulizrem1: pulizrem1,
            parinizqrem1: parinizqrem1,
            techointrem1: techointrem1,
            paredfrontalrem1: paredfrontalrem1,
            llantarem1Eco1: llantarem1Eco1,
            llantarem1Eco3: llantarem1Eco3,
            llantarem1Eco5: llantarem1Eco5,
            llantarem1Eco7: llantarem1Eco7,
            //rem2
            unidadrem2: rem2,
            rem2placa: placasrem2,
            fmrem2: fmrem2,
            serem2: serem2,
            fdremrem2: fdremrem2,
            partintderrem2: partintderrem2,
            pisopartintrem2: pisopartintrem2,
            llantarem2Eco0: llantarem2Eco0,
            llantarem2Eco2: llantarem2Eco2,
            llantarem2Eco4: llantarem2Eco4,
            llantarem2Eco6: llantarem2Eco6,
            pulizrem2: pulizrem2,
            parinizqrem2: parinizqrem2,
            techointrem2: techointrem2,
            paredfrontalrem2: paredfrontalrem2,
            llantarem2Eco1: llantarem2Eco1,
            llantarem2Eco3: llantarem2Eco3,
            llantarem2Eco5: llantarem2Eco5,
            llantarem2Eco7: llantarem2Eco7,
          );
        },
      ),
    );
  }
}
