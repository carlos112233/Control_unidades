import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Listadeinspeccion.dart';

class Formulario extends StatelessWidget {
  final String clbitacora;
  final String operador;
  final String unidad;
  final String placaunidad;
  final String cliente;
  final String terbitacora;
  final String folbitacora;
  final String tractoClave;
  final String tractoNumEco;
  final String rem1;
  final String rem1placa;
  final String rem2;
  final String rem2placa;
  final String dolly;
  final String origen;
  final String destino;
  final String ruta;
  // final String remplaca;
  // final String remplaca2;
  const Formulario({
    Key key,
    this.clbitacora,
    this.terbitacora,
    this.folbitacora,
    this.tractoClave,
    this.tractoNumEco,
    this.operador,
    this.cliente,
    this.unidad,
    this.rem1,
    this.rem2,
    this.dolly,
    this.origen,
    this.destino,
    this.ruta,
    this.placaunidad,
    this.rem1placa,
    this.rem2placa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
    // _controller.text = remplaca;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: GestureDetector(
                onTap: () {
                  _fecha(context, unidad, rem1, rem2, dolly);
                },
                child: Icon(
                  Icons.arrow_right_alt,
                  size: 50.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Text(
                  "\nInformacion de carta porte\n",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          width: size.width * .40,
                          color: Colors.white,
                          child: Column(
                            children: [
                              LabeledCheckbox2(
                                label: 'CartaPorte:  ',
                                descripcion: '',
                                active: false,
                                values: terbitacora.trim() + folbitacora,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                value: true,
                                onChanged: (bool newValue) {},
                                ancho: size.width * .20,
                              ),
                            ],
                          )),
                      Container(
                        width: size.width * .40,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            LabeledCheckbox2(
                              label: 'Operador:    ',
                              descripcion: '',
                              active: false,
                              values: operador,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              value: true,
                              onChanged: (bool newValue) {},
                              ancho: size.width * .27,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: size.width * .40,
                    height: 10,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        LabeledCheckbox2(
                          label: 'Unidad Tracto:  ',
                          descripcion: '',
                          active: false,
                          values: unidad,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          value: true,
                          onChanged: (bool newValue) {},
                          ancho: size.width * .18,
                        ),
                        LabeledCheckbox2(
                          label: 'Dolly:              ',
                          descripcion: '',
                          active: false,
                          values: dolly,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          value: true,
                          onChanged: (bool newValue) {},
                          ancho: size.width * .20,
                        ),
                        LabeledCheckbox2(
                          label: 'Origen:  ',
                          descripcion: '',
                          active: false,
                          values: origen,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          value: true,
                          onChanged: (bool newValue) {},
                          ancho: 250,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * .40,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        LabeledCheckbox2(
                          label: 'Remolque1:       ',
                          descripcion: '',
                          active: false,
                          values: rem1,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          value: true,
                          onChanged: (bool newValue) {},
                          ancho: size.width * .25,
                        ),
                        LabeledCheckbox2(
                          label: 'Remolque2:  ',
                          descripcion: '',
                          active: false,
                          values: rem2,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          value: true,
                          onChanged: (bool newValue) {},
                          ancho: size.width * .27,
                        ),
                        LabeledCheckbox2(
                          label: 'Destino:  ',
                          descripcion: '',
                          active: false,
                          values: destino,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          value: true,
                          onChanged: (bool newValue) {},
                          ancho: size.width * .30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            LabeledCheckbox2(
              controller: _controller,
              label: 'Ruta del viaje: ',
              active: false,
              values: ruta,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              value: true,
              onChanged: (bool newValue) {},
              ancho: size.width * .20,
            ),
            MyStateful2Widget(),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _fecha(
    BuildContext context,
    String unidad,
    String remolque,
    String remolque2,
    String dolly,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool fecha = prefs.getBool('fecha');
    String entrada = prefs.getString('Entrada');
    prefs.setString("unidad", unidad);
    prefs.setString("remolque", remolque);
    prefs.setString("remolque2", remolque2);
    prefs.setString("dolly", dolly);
    if (fecha != false) {
      prefs.setBool("fecha", false);
      print(entrada);

      if (rem2 == null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return InspecTractoList(
                unidad: unidad,
                placasunida: placaunidad,
                rem1: remolque,
                placasrem1: rem1placa,
                bolrem2: false,
              );
            },
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return InspecTractoList(
                bolrem2: true,
                unidad: unidad,
                placasunida: placaunidad,
                rem1: remolque,
                placasrem1: rem1placa,
                rem2: remolque2,
                placasrem2: rem2placa,
                dolly: dolly,
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
            title: Text('Fecha'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('No a seleccionado la fecha de entrada'),
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
