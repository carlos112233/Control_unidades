import 'package:control_unidades/class/count.dart';
import 'package:control_unidades/class/cperror.dart';
import 'package:control_unidades/class/cpunidades.dart';
import 'package:control_unidades/class/dolly.dart';
import 'package:control_unidades/class/llantasTrc.dart';
import 'package:control_unidades/class/remolque1.dart';
import 'package:control_unidades/class/remolques.dart';
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
    String url =
        "http://supertrack-net.ddns.net:50371/Controldeunidades/php/consulta_cp.php";
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
            "http://supertrack-net.ddns.net:50371/Controldeunidades/php/remolques.php";
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
        final remolque = remolque1FromJson(respuesta2.body);
        String remplaca = remolque.rem1.placas.placa1;
        int i = 0;
        remolque.rem1.llantas.forEach((element) {
          prefs.setString("llantarem1Eco$i", element.llantaNumEco);
          prefs.setString("llantarem1marca$i", element.marcaDescrip);
          prefs.setString("llantarem1des$i", element.descripcion);
          i++;
        });

        String url3 =
            "http://supertrack-net.ddns.net:50371/Controldeunidades/php/trac_llantas.php";
        var respuesta3 = await http.post(url3, body: {
          'eco': datos.tractoNumEco,
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final llantas = llantasTracFromJson(respuesta3.body);
        i = 0;
        llantas.llanta.forEach((key, value) {
          prefs.setString("llantaTractoeco$i", value.llantaNumEco);
          prefs.setString("llantaTracto$i", value.descrip);
          prefs.setString("llantaTractomarca$i", value.marcaDescrip);
          i++;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Formulario(
                clbitacora: datos.claveBitacora,
                operador: datos.operadorNombre,
                unidad: datos.tractoNumEco,
                placaunidad: datos.tractoPlacas,
                cliente: datos.clienteNombre,
                terbitacora: datos.terminalBitacora,
                folbitacora: datos.folioBitacora,
                rem1: datos.remNe1,
                rem1placa: remplaca,
                origen: datos.origenNom,
                destino: datos.destinatarioNom,
                ruta: datos.rutaServicio,
              );
            },
          ),
        );
      } else {
        String url2 =
            "http://supertrack-net.ddns.net:50371/Controldeunidades/php/remolques.php";
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
        String url4 =
            "http://supertrack-net.ddns.net:50371/Controldeunidades/php/Dolly_llant.php";
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
          prefs.setString("llantaDDes$i", element.descripcion);
          prefs.setString("llantaDE$i", element.llantaNumEco);
          prefs.setString("llantaDM$i", element.marcaDescrip);
          print("$i dolly-" + element.llantaNumEco);
          i++;
        });
        i = 0;
        String rem1placas = remolque.rem1.placas.placa1;
        String rem2placas = remolque.rem2.placas.placa2;

        remolque.rem1.the0.llantas.forEach((element) {
          prefs.setString("llantarem1descrip$i", element.descripcion);
          prefs.setString("llantarem1Eco$i", element.llantaNumEco);
          prefs.setString("llantarem1marca$i", element.marcaDescrip);
          print("$i rem1-" + element.llantaNumEco);
          i++;
        });
        i = 0;
        remolque.rem2.the0.llantas.forEach((element) {
          prefs.setString("llantarem2descrip$i", element.descripcion);
          prefs.setString("llantarem2Eco$i", element.llantaNumEco);
          prefs.setString("llantarem2marca$i", element.marcaDescrip);
          print("$i rem2-" + element.llantaNumEco);
          i++;
        });

        String url3 =
            "http://supertrack-net.ddns.net:50371/Controldeunidades/php/trac_llantas.php";
        var respuesta3 = await http.post(url3, body: {
          'eco': datos.tractoNumEco,
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final llantas = llantasTracFromJson(respuesta3.body);
        i = 0;
        llantas.llanta.forEach((key, value) {
          prefs.setString("llantaTractoeco$i", value.llantaNumEco);
          prefs.setString("llantaTracto$i", value.descrip);
          prefs.setString("llantaTractomarca$i", value.marcaDescrip);
          print("$i trac-" + value.llantaNumEco);
          i++;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Formulario(
                clbitacora: datos.claveBitacora,
                operador: datos.operadorNombre,
                unidad: datos.tractoNumEco,
                placaunidad: datos.tractoPlacas,
                cliente: datos.clienteNombre,
                terbitacora: datos.terminalBitacora,
                folbitacora: datos.folioBitacora,
                rem1: datos.remNe1,
                rem1placa: rem1placas,
                dolly: datos.dollyNe,
                rem2: datos.remNe2,
                rem2placa: rem2placas,
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

  Future<void> _tracto(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tr = prefs.getString("valor");
    if (tr != null || tr != '') {
      String url2 =
          "http://supertrack-net.ddns.net:50371/Controldeunidades/php/cont_historico.php";
      var respuesta2 = await http.post(url2,
          body: {'count': tr},
          headers: {'Content-Type': 'application/x-www-form-urlencoded'});
      final count = countFromJson(respuesta2.body);
      int conteo = count.reg;
      final error = cpErrorFromJson(respuesta2.body);
      if (error.mensaje == null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return HistoricoTracto(
                historico: conteo,
                unidad: tr.toUpperCase(),
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
                  Text("Esta vacio el campo"),
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
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 350,
        width: 250,
        child: Column(
          children: <Widget>[
            MyWidget(
              seleccion: seleccion,
            ),
            SizedBox(
              height: 20,
            ),
            RoundButton(
              text: 'Enviar',
              press: () {
                print(seleccion);
                if (seleccion == "Unidad") {
                  _tracto(context);
                } else if (seleccion == "Carta porte") {
                  _datos(context);
                } else if (seleccion == null) {
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
  final seleccion;

  const MyWidget({this.seleccion});
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.seleccion == "Unidad") {
      return TextField(
        //                       <--- TextField
        decoration:
            InputDecoration(border: InputBorder.none, hintText: "ST123"),
        onChanged: (text) {
          _doSomething(text);
        },
      );
    } else if (widget.seleccion == "Carta porte") {
      return TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: "PUE123"),
        onChanged: (text) {
          _doSomething(text);
        },
      );
    } else if (widget.seleccion == "Catálogo de unidades") {
      return Column(
        children: <Widget>[
          Text(
            "Unidad",
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: "ST123"),
            onChanged: (text) {
              _doSomething(text);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Remolque-1",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: "2154565"),
            onChanged: (text) {
              _doSomething(text);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Remolque 2",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "5465121 Opcional"),
            onChanged: (text) {
              _doSomething(text);
            },
          ),
        ],
      );
    } else {
      return TextField(
        //                       <--- TextField
        decoration: InputDecoration(
            border: InputBorder.none, hintText: "No ha seleccionado"),
        onChanged: (text) {
          _doSomething(text);
        },
      );
    }
  }

  void _doSomething(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(text);
    prefs.setString("valor", text);
  }
}
