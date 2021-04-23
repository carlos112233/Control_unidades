import 'package:control_unidades/components/LabeledCheckbox.dart';
import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consulta/consulta.dart';

class Tracto2Form extends StatelessWidget {
  final String unidad;
  final String fecha;
  const Tracto2Form({
    Key key,
    this.unidad,
    this.fecha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracto"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Consulta(),
                      ),
                      (Route<dynamic> route) => false);
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
          Column(
            children: <Widget>[
              Text(
                "\nTracto\n",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Container(
            height: size.height * 1.75,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: size.width * .49,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      LabeledCheckbox2(
                        label: "Unidad: ",
                        values: unidad,
                        active: false,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        ancho: size.height * .28,
                      ),
                      MyStateful2Widget(),
                    ],
                  ),
                ),
                Container(
                  width: size.width * .49,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      MyStatefulWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// This is the private State class that goes with MyStatefulWidget.
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
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;
  bool _isSelected8 = false;
  bool _isSelected9 = false;
  bool _isSelected10 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  bool _isSelected15 = false;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          controller: controller,
          onChanged2: _doSomething,
          label: "Motivo de  ingreso: ",
          descripcion: "Motivo del daño",
          value: true,
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
          label: "Defensa delantera:",
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
          label: "Motor:",
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
          label: "Llantas:",
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
          label: "Piso de cabiba :",
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
          label: "Tanque de Diesel:",
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
          label: "CM T. Der.:",
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
          label: "Cap. Tanque LT. Der.:",
          descripcion: "Motivo del daño",
          value: _isSelected7,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected7 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Trampa Der.:",
          descripcion: "Motivo del daño",
          value: _isSelected8,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected8 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Aluminio:",
          descripcion: "Motivo del daño",
          value: _isSelected9,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected9 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Tapon de Diesel Der.:",
          descripcion: "Motivo del daño",
          value: _isSelected10,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected10 = values;
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
        LabeledCheckbox(
          label: "Llanta 10:",
          descripcion: "Motivo del daño",
          value: _isSelected15,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected15 = values;
            });
          },
        ),
        Text("\n"),
      ],
    );
  }

  Future<void> _doSomething(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString("valor", text);
    });
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
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;
  bool _isSelected8 = false;
  bool _isSelected9 = false;
  bool _isSelected10 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  bool _isSelected15 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          label: "Cabina:",
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
          label: "Tanque de Aire:",
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
          label: "Eje impulsor:",
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
          label: "Quinta rueda :",
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
          label: "Escape :",
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
          label: "CM T. Der.:",
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
          label: "Cap. Tanque LT. Izq.:",
          descripcion: "Motivo del daño",
          value: _isSelected7,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected7 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Trampa Izq.:",
          descripcion: "Motivo del daño",
          value: _isSelected8,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected8 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Fierro:",
          descripcion: "Motivo del daño",
          value: _isSelected9,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected9 = values;
            });
          },
        ),
        LabeledCheckbox(
          label: "Tapon de Diesel Izq:",
          descripcion: "Motivo del daño",
          value: _isSelected10,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected10 = values;
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
        LabeledCheckbox(
          label: "Llanta 9:",
          descripcion: "Motivo del daño",
          value: _isSelected15,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected15 = values;
            });
          },
        ),
        Text("\n"),
      ],
    );
  }
}
