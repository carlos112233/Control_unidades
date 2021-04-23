import 'package:control_unidades/components/LabeledCheckbox.dart';
import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:control_unidades/components/rounded_button.dart';
import 'package:flutter/material.dart';

import 'Listadeinspeccion.dart';

class RemolqueForm extends StatelessWidget {
  final String tipoRemolque;
  final String rem;
  final String placas;
  final bool remolque;
  final Color colorTracto;
  final Color colorRemolque;
  final Color colorDolly;
  final Color colorRemolque2;
  const RemolqueForm({
    Key key,
    this.tipoRemolque,
    this.rem,
    this.placas,
    this.remolque,
    this.colorTracto,
    this.colorRemolque,
    this.colorDolly,
    this.colorRemolque2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Remolque-$tipoRemolque"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: GestureDetector(
                onTap: () {
                  if (tipoRemolque == "1") {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InspecTractoList(
                            colorRemolque: Colors.green,
                            colorDolly: colorDolly,
                            colorRemolque2: colorRemolque2,
                            colorTracto: colorTracto,
                            bolrem2: remolque,
                          ),
                        ),
                        (Route<dynamic> route) => false);
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InspecTractoList(
                            colorRemolque2: Colors.green,
                            colorDolly: colorDolly,
                            colorRemolque: colorRemolque,
                            colorTracto: colorTracto,
                            bolrem2: remolque,
                          ),
                        ),
                        (Route<dynamic> route) => false);
                  }
                },
                child: Icon(
                  Icons.save,
                  size: 30.0,
                ),
              )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: size.height * .95,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: size.width * .513,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      LabeledCheckbox2(
                        label: "Economico Rem:",
                        value: true,
                        values: rem,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        ancho: 130,
                      ),
                      MyStatefulWidget(),
                    ],
                  ),
                ),
                Container(
                  width: size.width * .485,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      LabeledCheckbox2(
                        label: "placas:",
                        value: true,
                        values: placas,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        ancho: 130,
                      ),
                      MyStateful2Widget()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RoundButton(
              color: Colors.green,
              text: "Guardar",
              press: () {
                print(tipoRemolque);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          label: "Fisicomecanica:",
          descripcion: "Motivo del daño",
          value: _isSelected,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Sello de entrada:",
          descripcion: "Motivo del daño",
          value: _isSelected2,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected2 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Afuera/Debajo del remolque:",
          descripcion: "Motivo del daño",
          value: _isSelected3,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .21,
          onChanged: (bool values) {
            setState(() {
              this._isSelected3 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Parte int. lado derecho :",
          descripcion: "Motivo del daño",
          value: _isSelected4,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected4 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 1:",
          descripcion: "Motivo del daño",
          value: _isSelected11,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected11 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 3:",
          descripcion: "Motivo del daño",
          value: _isSelected12,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected12 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 5:",
          descripcion: "Motivo del daño",
          value: _isSelected13,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected13 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 7:",
          descripcion: "Motivo del daño",
          value: _isSelected14,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected14 = values;
            });
          },
        ),
      ],
    );
  }
}

class MyStateful2Widget extends StatefulWidget {
  const MyStateful2Widget({key}) : super(key: key);

  @override
  _MyStateful2WidgetState createState() => _MyStateful2WidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateful2WidgetState extends State<MyStateful2Widget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          label: "Puertas por Fuera/Dentro:",
          descripcion: "Motivo del daño",
          value: _isSelected,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .20,
          onChanged: (bool values) {
            setState(() {
              this._isSelected = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Parte int. lado Izq.:",
          descripcion: "Motivo del daño",
          value: _isSelected2,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected2 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Techo parte Int.:",
          descripcion: "Motivo del daño",
          value: _isSelected3,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected3 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Pared Frontal:",
          descripcion: "Motivo del daño",
          value: _isSelected5,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected5 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Piso Parte Int.:",
          descripcion: "Motivo del daño",
          value: _isSelected6,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected6 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 2:",
          descripcion: "Motivo del daño",
          value: _isSelected11,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected11 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 4:",
          descripcion: "Motivo del daño",
          value: _isSelected12,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected12 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 6:",
          descripcion: "Motivo del daño",
          value: _isSelected13,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected13 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Llanta 8:",
          descripcion: "Motivo del daño",
          value: _isSelected14,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected14 = values;
            });
          },
        ),
      ],
    );
  }
}
