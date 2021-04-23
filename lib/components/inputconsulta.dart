import 'package:control_unidades/class/cperror.dart';
import 'package:control_unidades/class/cpunidades.dart';
import 'package:control_unidades/class/dolly.dart';
import 'package:control_unidades/class/llantasTrc.dart';
import 'package:control_unidades/class/remolque1.dart';
import 'package:control_unidades/class/remolques.dart';
import 'package:control_unidades/class/tracto.dart';
import 'package:control_unidades/components/rounded_button.dart';
import 'package:control_unidades/homepage/consulta/formulario.dart';
import 'package:control_unidades/homepage/consulta/historicoTracto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InputCPUnidades extends StatelessWidget {
  final bool ver;
  final String seleccion;
  const InputCPUnidades({
    Key key,
    this.ver,
    this.seleccion,
  }) : super(key: key);

  void _datos(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cp = prefs.getString("valor");
    String url = "http://192.168.0.59:8000/proyectos/barcodePC/consulta_cp.php";
    var respuesta = await http.post(url, body: {
      'cp': cp
    }, headers: {
      'Accept': 'application/javascript',
      'Content-Type': 'application/x-www-form-urlencoded'
    });

    final error = cpErrorFromJson(respuesta.body);

    if (error.mensaje == null) {
      final datos = cpUnidadesFromJson(respuesta.body);
      print(datos.cartaporte);
      var respuesta2;
      if (datos.remNe2 == null) {
        String url2 =
            "http://192.168.0.59:8000/proyectos/barcodePC/remolques.php";
        respuesta2 = await http.post(
          url2,
          body: {
            'rem': datos.remNe1,
            'rem2': '',
          },
          headers: {
            'Accept': 'application/javascript',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        );
        final remolque = rem1FromJson(respuesta2.body);
        prefs.setString("PlacaRem", remolque.rem1.placas.placa1);
        for (var i = 0; i < remolque.rem1.the0.llantas.length; i++) {
          prefs.setString(
              "llantarem1-$i", remolque.rem1.the0.llantas[i].descripcion);
          prefs.setString(
              "llantarem1marca-$i", remolque.rem1.the0.llantas[i].marcaDescrip);
        }

        String url3 =
            "http://192.168.0.59:8000/proyectos/barcodePC/trac_llantas.php";
        var respuesta3 = await http.post(url3, body: {
          'eco': datos.tractoNumEco,
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final llantas = llantasTracFromJson(respuesta3.body);
        int i = 0;
        llantas.llanta.forEach((key, value) {
          prefs.setString("llantaTractoeco-$i", value.llantaNumEco);
          prefs.setString("llantadescrip-$i", value.descrip);
          i++;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Formulario(
                clbitacora: datos.claveBitacora,
                operador: datos.operadorNombre,
                unidad: datos.tractoNumEco,
                cliente: datos.clienteNombre,
                terbitacora: datos.terminalBitacora,
                folbitacora: datos.folioBitacora,
                rem1: datos.remNe1,
                dolly: datos.dollyNe,
                rem2: datos.remNe2,
                origen: datos.origenNom,
                destino: datos.destinatarioNom,
                ruta: datos.rutaServicio,
              );
            },
          ),
        );
      } else {
        String url2 =
            "http://192.168.0.59:8000/proyectos/barcodePC/remolques.php";
        respuesta2 = await http.post(
          url2,
          body: {
            'rem': datos.remNe1,
            'rem2': datos.remNe2,
          },
          headers: {
            'Accept': 'application/javascript',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        );
        final remolque = remolquesFromJson(respuesta2.body);
        prefs.setString("PlacaRem", remolque.rem1.placas.placa1);
        prefs.setString("PlacaRem2", remolque.rem2.placas.placa2);
        String url4 =
            "http://192.168.0.59:8000/proyectos/barcodePC/Dolly_llant.php";
        var respuesta4 = await http.post(
          url4,
          body: {
            'dolly': datos.dollyNe,
          },
          headers: {
            'Accept': 'application/javascript',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        );
        final llantasDol = dollyFromJson(respuesta4.body);

        int i = 0;
        llantasDol.llantas.forEach((element) {
          prefs.setString("llantaDol-$i", element.descripcion);
          prefs.setString("llantaDol-$i", element.marcaDescrip);
        });
        i = 0;
        remolque.rem1.the0.llantas.forEach((element) {
          prefs.setString("llantarem1-$i", element.descripcion);
          prefs.setString("llantarem1marca-$i", element.marcaDescrip);
          i++;
        });
        i = 0;
        remolque.rem2.the0.llantas.forEach((element) {
          prefs.setString("llantarem1-$i", element.descripcion);
          prefs.setString("llantarem1marca-$i", element.marcaDescrip);
          i++;
        });

        String url3 =
            "http://192.168.0.59:8000/proyectos/barcodePC/trac_llantas.php";
        var respuesta3 = await http.post(url3, body: {
          'eco': datos.tractoNumEco,
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final llantas = llantasTracFromJson(respuesta3.body);
        i = 0;
        llantas.llanta.forEach((key, value) {
          prefs.setString("llantaTracto-$i", value.descrip);
          prefs.setString("llantaTractomarca-$i", value.marcaDescrip);
        });

        // prefs.setString("llantaTractoeco-0", llantas.llanta[0].llantaNumEco);
        // prefs.setString("llantadescrip-0", llantas.llanta[0].descrip);
        // prefs.setString("llantaposicion-0", llantas.llanta[0].llantaPos);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Formulario(
                clbitacora: datos.claveBitacora,
                operador: datos.operadorNombre,
                unidad: datos.tractoNumEco,
                cliente: datos.clienteNombre,
                terbitacora: datos.terminalBitacora,
                folbitacora: datos.folioBitacora,
                rem1: datos.remNe1,
                dolly: datos.dollyNe,
                rem2: datos.remNe2,
                origen: datos.origenNom,
                destino: datos.destinatarioNom,
                ruta: datos.rutaServicio,
              );
            },
          ),
        );
      }
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(error.mensaje),
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

  void _tracto(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tr = prefs.getString("valor");
    String url = "http://192.168.0.59:8000/proyectos/barcodePC/tracto.php";
    var respuesta = await http.post(url, body: {
      'tr': tr
    }, headers: {
      'Accept': 'application/javascript',
      'Content-Type': 'application/x-www-form-urlencoded'
    });

    final error = cpErrorFromJson(respuesta.body);

    if (error.mensaje == null) {
      final datos = tractoFromJson(respuesta.body);
      print(datos.tractoNumEco);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return HistoricoTracto(
              historico: 20,
            );
          },
        ),
      );
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(error.mensaje),
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

  @override
  Widget build(BuildContext context) {
    String valor;

    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 250,
        width: 250,
        child: Column(
          children: <Widget>[
            MyWidget(),
            SizedBox(
              height: 15,
            ),
            RoundButton(
              text: 'Enviar',
              press: () {
                if (seleccion == "Unidad") {
                  _tracto(context);
                } else if (seleccion == "Carta porte") {
                  _datos(context);
                } else if (valor == null) {
                  print("$seleccion <-");
                  return showDialog<void>(
                    context: context,
                    barrierDismissible:
                        false, //this means the user must tap a button to exit the Alert Dialog
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                  "No ingresado datos o no selecciono una opción"),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      //                       <--- TextField
      onChanged: (text) {
        _doSomething(text);
      },
    );
  }

  Future<void> _doSomething(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString("valor", text);
    });
  }
}
