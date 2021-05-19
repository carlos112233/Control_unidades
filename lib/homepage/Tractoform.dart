import 'package:control_unidades/components/LabeledCheckbox.dart';
import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Listadeinspeccion.dart';

class TractoForm extends StatelessWidget {
  final String unidad;
  final String placasunida;
  final String placa;
  final String dolly;
  final String rem1;
  final String placasrem1;
  final String rem2;
  final String placasrem2;
  final bool variable;
  final Color colorRemolque;
  final Color colorDolly;
  final Color colorRemolque2;
  final String motivo;
  const TractoForm({
    Key key,
    this.variable,
    this.colorRemolque,
    this.colorDolly,
    this.colorRemolque2,
    this.unidad,
    this.motivo,
    this.placa,
    this.placasunida,
    this.dolly,
    this.rem1,
    this.placasrem1,
    this.rem2,
    this.placasrem2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tracto",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InspecTractoList(
                          colorTracto: Colors.green,
                          colorDolly: colorDolly,
                          colorRemolque2: colorRemolque2,
                          colorRemolque: colorRemolque,
                          bolrem2: variable,
                          unidad: unidad,
                          placasunida: placa,
                          rem1: rem1,
                          placasrem1: placasrem1,
                          rem2: rem2,
                          placasrem2: placasrem2,
                          dolly: dolly,
                        ),
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
                "Seleccione en caso de algún daño",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            height: size.height * 2.4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: size.width * .49,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      MyStateful2Widget(
                        unidad: unidad,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * .49,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      MyStatefulWidget(
                        placa: placa,
                      ),
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

class MyStatefulWidget extends StatefulWidget {
  final String placa;
  const MyStatefulWidget({
    key,
    this.placa,
  }) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
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
  final llanta2s = TextEditingController();
  final llanta4s = TextEditingController();
  final llanta6s = TextEditingController();
  final llanta8s = TextEditingController();
  final llanta10s = TextEditingController();
  String llanta2 = '';
  String llanta4 = '';
  String llanta6 = '';
  String llanta8 = '';
  String llanta10 = '';
  final defensadelantera = TextEditingController();
  final motor = TextEditingController();
  final pisodecabiba = TextEditingController();
  final tanquedeDiesel = TextEditingController();
  final cMTDer = TextEditingController();
  final capTanqueLTDer = TextEditingController();
  final trampaDer = TextEditingController();
  final aluminio = TextEditingController();
  final taponDieselDer = TextEditingController();
  final motivoingreso = TextEditingController();

  void llenar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    llanta2 = prefs.getString("llantaTractoeco1").trim();
    llanta4 = prefs.getString("llantaTractoeco3").trim();
    llanta6 = prefs.getString("llantaTractoeco5").trim();
    llanta8 = prefs.getString("llantaTractoeco7").trim();
    llanta10 = prefs.getString("llantaTractoeco9").trim();
  }

  @override
  void initState() {
    super.initState();
    llenar();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Placas: ",
          values: widget.placa,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: 120,
        ),
        LabeledCheckbox(
          controller: motivoingreso,
          onChanged2: _doSomething,
          label: "Motivo de  ingreso: ",
          descripcion: "Observación",
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
          controller: defensadelantera,
          onChanged2: _doSomething,
          label: "Defensa delantera:",
          descripcion: "Observación",
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
          controller: motor,
          label: "Motor:",
          onChanged2: _doSomething,
          descripcion: "Observación",
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
          controller: pisodecabiba,
          onChanged2: _doSomething,
          label: "Piso de cabiba :",
          descripcion: "Observación",
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
          controller: tanquedeDiesel,
          onChanged2: _doSomething,
          label: "Tanque de Diesel:",
          descripcion: "Observación",
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
          controller: cMTDer,
          onChanged2: _doSomething,
          label: "CM T. Der.:",
          descripcion: "Observación",
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
          controller: capTanqueLTDer,
          onChanged2: _doSomething,
          label: "Cap. Tanque LT. Der.:",
          descripcion: "Observación",
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
          controller: trampaDer,
          onChanged2: _doSomething,
          label: "Trampa Der.:",
          descripcion: "Observación",
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
          controller: aluminio,
          onChanged2: _doSomething,
          label: "Aluminio:",
          descripcion: "Observación",
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
          controller: taponDieselDer,
          onChanged2: _doSomething,
          label: "Tapon de Diesel Der.:",
          descripcion: "Observación",
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
          controller: llanta2s,
          onChanged2: _doSomething,
          label: "2-LlantaT " + llanta2 + ":",
          descripcion: "Observación",
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
          controller: llanta4s,
          onChanged2: _doSomething,
          label: "4-LlantaT " + llanta4 + ":",
          descripcion: "Observación",
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
          controller: llanta6s,
          onChanged2: _doSomething,
          label: "6-LlantaT  " + llanta6 + ":",
          descripcion: "Observación",
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
          controller: llanta8s,
          onChanged2: _doSomething,
          label: "8-LlantaT  " + llanta8 + ":",
          descripcion: "Observación",
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
          controller: llanta10s,
          onChanged2: _doSomething,
          label: "10-LlantaT " + llanta10 + ":",
          descripcion: "Observación",
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
      ],
    );
  }

  void _doSomething(String text) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    print(motivoingreso.text);
    guardar();
  }

  void guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("llantarevt2", llanta2s.text);
    prefs.setString("llantarevt4", llanta4s.text);
    prefs.setString("llantarevt6", llanta6s.text);
    prefs.setString("llantarevt8", llanta8s.text);
    prefs.setString("llantarevt10", llanta10s.text);
    prefs.setString("defensadelantera", defensadelantera.text);
    prefs.setString("motor", motor.text);
    prefs.setString("pisodecabiba", pisodecabiba.text);
    prefs.setString("tanquedeDiesel", tanquedeDiesel.text);
    prefs.setString("cMTDer", cMTDer.text);
    prefs.setString("capTanqueLTDer", capTanqueLTDer.text);
    prefs.setString("trampaDer", trampaDer.text);
    prefs.setString("aluminio", aluminio.text);
    prefs.setString("taponDieselDer", taponDieselDer.text);
    prefs.setString("motivoingreso", motivoingreso.text);
    setState(() {});
  }
}

class MyStateful2Widget extends StatefulWidget {
  final String unidad;
  const MyStateful2Widget({key, this.unidad}) : super(key: key);

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

  final cabina = TextEditingController();
  final tanqueAire = TextEditingController();
  final ejeImpulsor = TextEditingController();
  final quintaRueda = TextEditingController();
  final escape = TextEditingController();
  final cMTIzq = TextEditingController();
  final capTanqueLTIzq = TextEditingController();
  final trampaIzq = TextEditingController();
  final fierro = TextEditingController();
  final tapondeDieselIzq = TextEditingController();
  String llanta1 = '';
  String llanta3 = '';
  String llanta5 = '';
  String llanta7 = '';
  String llanta9 = '';
  final llanta1s = TextEditingController();
  final llanta3s = TextEditingController();
  final llanta5s = TextEditingController();
  final llanta7s = TextEditingController();
  final llanta9s = TextEditingController();

  void llenar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    llanta1 = prefs.getString("llantaTractoeco0").trim();
    llanta3 = prefs.getString("llantaTractoeco2").trim();
    llanta5 = prefs.getString("llantaTractoeco4").trim();
    llanta7 = prefs.getString("llantaTractoeco6").trim();
    llanta9 = prefs.getString("llantaTractoeco8").trim();
  }

  @override
  void initState() {
    super.initState();
    llenar();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Unidad: ",
          values: widget.unidad,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: 120,
        ),
        LabeledCheckbox(
          controller: cabina,
          onChanged2: _doSomething,
          label: "Cabina:",
          descripcion: "Observación",
          value: _isSelected,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (
            bool values,
          ) {
            setState(() {
              this._isSelected = values;
            });
          },
        ),
        LabeledCheckbox(
          onChanged2: _doSomething,
          controller: tanqueAire,
          label: "Tanque de Aire:",
          descripcion: "Observación",
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
          controller: ejeImpulsor,
          onChanged2: _doSomething,
          label: "Eje impulsor:",
          descripcion: "Observación",
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
          controller: quintaRueda,
          onChanged2: _doSomething,
          label: "Quinta rueda :",
          descripcion: "Observación",
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
          controller: escape,
          onChanged2: _doSomething,
          label: "Escape :",
          descripcion: "Observación",
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
          controller: cMTIzq,
          onChanged2: _doSomething,
          label: "CM T. Izq.:",
          descripcion: "Observación",
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
          controller: capTanqueLTIzq,
          onChanged2: _doSomething,
          label: "Cap. Tanque LT. Izq.:",
          descripcion: "Observación",
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
          controller: trampaIzq,
          onChanged2: _doSomething,
          label: "Trampa Izq.:",
          descripcion: "Observación",
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
          controller: fierro,
          onChanged2: _doSomething,
          label: "Fierro:",
          descripcion: "Observación",
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
          controller: tapondeDieselIzq,
          onChanged2: _doSomething,
          label: "Tapon de Diesel Izq:",
          descripcion: "Observación",
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
          controller: llanta1s,
          onChanged2: _doSomething,
          label: "1-LlantaT  " + llanta1 + ":",
          descripcion: "Observación",
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
          controller: llanta3s,
          onChanged2: _doSomething,
          label: "3-LlantaT  " + llanta3 + ":",
          descripcion: "Observación",
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
          controller: llanta5s,
          onChanged2: _doSomething,
          label: "5-LlantaT " + llanta5 + ":",
          descripcion: "Observación",
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
          controller: llanta7s,
          onChanged2: _doSomething,
          label: "7-LlantaT " + llanta7 + ":",
          descripcion: "Observación",
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
          controller: llanta9s,
          onChanged2: _doSomething,
          label: "9-LlantaT " + llanta9 + ":",
          descripcion: "Observación",
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
      ],
    );
  }

  void _doSomething(String text) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    print(cabina.text);
    guardar();
  }

  void guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("cabina", cabina.text);
    prefs.setString("tanqueAire", tanqueAire.text);
    prefs.setString("ejeImpulsor", ejeImpulsor.text);
    prefs.setString("quintaRueda", quintaRueda.text);
    prefs.setString("escape", escape.text);
    prefs.setString("cMTIzq", cMTIzq.text);
    prefs.setString("capTanqueLTIzq", capTanqueLTIzq.text);
    prefs.setString("trampaIzq", trampaIzq.text);
    prefs.setString("fierro", fierro.text);
    prefs.setString("tapondeDieselIzq", tapondeDieselIzq.text);
    prefs.setString("llantarevt1", llanta1s.text);
    prefs.setString("llantarevt3", llanta3s.text);
    prefs.setString("llantarevt5", llanta5s.text);
    prefs.setString("llantarevt7", llanta7s.text);
    prefs.setString("llantarevt9", llanta9s.text);
    setState(() {});
  }
}
