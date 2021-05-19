import 'package:control_unidades/components/LabeledCheckbox.dart';
import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:control_unidades/homepage/Listadeinspeccion.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dolly extends StatelessWidget {
  final String unidad;
  final String placasunida;
  final String dolly;
  final String rem1;
  final String placasrem1;
  final String rem2;
  final String placasrem2;

  final Color colorRemolque;
  final Color colorDolly;
  final Color colorRemolque2;
  final Color colorTracto;
  final bool rem2bool;
  const Dolly({
    Key key,
    this.dolly,
    this.colorRemolque,
    this.colorDolly,
    this.colorRemolque2,
    this.rem2,
    this.colorTracto,
    this.unidad,
    this.placasunida,
    this.rem1,
    this.placasrem1,
    this.placasrem2,
    this.rem2bool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dolly"),
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
                          colorDolly: Colors.green,
                          colorRemolque: colorRemolque,
                          colorRemolque2: colorRemolque2,
                          colorTracto: colorTracto,
                          bolrem2: rem2bool,
                          unidad: unidad,
                          placasunida: placasunida,
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
            height: size.height * 1.2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: size.height * .8,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      LabeledCheckbox2(
                        label: "Dolly:  ",
                        value: true,
                        values: dolly,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        ancho: 130,
                      ),
                      MyStateful2Widget(
                        dolly: dolly,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.height * .8,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Text(
                        " ",
                        style: TextStyle(fontSize: 42),
                      ),
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  final llanta2 = TextEditingController();
  final llanta4 = TextEditingController();
  final llanta6 = TextEditingController();
  final llanta8 = TextEditingController();
  String llanta2s = "";
  String llanta4s = "";
  String llanta6s = "";
  String llanta8s = "";

  void llenar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    llanta2s = prefs.getString("llantaDE1").trim();
    llanta4s = prefs.getString("llantaDE3").trim();
    llanta6s = prefs.getString("llantaDE5").trim();
    llanta8s = prefs.getString("llantaDE7").trim();
  }

  @override
  void initState() {
    super.initState();
    llenar();
  }

  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          onChanged2: _doSomething,
          controller: llanta2,
          label: "2-LlantaD " + llanta2s + ":",
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
          label: "4-LlantaD " + llanta4s + ":",
          descripcion: "Observación",
          controller: llanta4,
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
          label: "6-LlantaD " + llanta6s + ":",
          descripcion: "Observación",
          controller: llanta6,
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
          label: "8-LlantaD " + llanta8s + ":",
          descripcion: "Observación",
          controller: llanta8,
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

  void _doSomething(String text) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    print(llanta2.text);
    guardar();
  }

  void guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("llanta2d", llanta2.text);
    prefs.setString("llanta4d", llanta4.text);
    prefs.setString("llanta6d", llanta6.text);
    prefs.setString("llanta8d", llanta8.text);
    setState(() {});
  }
}

class MyStateful2Widget extends StatefulWidget {
  final String dolly;
  const MyStateful2Widget({key, this.dolly}) : super(key: key);

  @override
  _MyStateful2WidgetState createState() => _MyStateful2WidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateful2WidgetState extends State<MyStateful2Widget> {
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  final llanta1s = TextEditingController();
  final llanta3s = TextEditingController();
  final llanta5s = TextEditingController();
  final llanta7s = TextEditingController();
  String llanta1 = "";
  String llanta3 = "";
  String llanta5 = "";
  String llanta7 = "";

  void llenar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    llanta1 = prefs.getString("llantaDE0").trim();
    llanta3 = prefs.getString("llantaDE2").trim();
    llanta5 = prefs.getString("llantaDE4").trim();
    llanta7 = prefs.getString("llantaDE6").trim();
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
        LabeledCheckbox(
          onChanged2: _doSomething,
          label: "1-LlantaD " + llanta1 + ":",
          descripcion: "Observación",
          controller: llanta1s,
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
          label: "3-LlantaD " + llanta3 + ":",
          descripcion: "Observación",
          value: _isSelected12,
          controller: llanta3s,
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
          label: "5-LlantaD " + llanta5 + ":",
          descripcion: "Observación",
          value: _isSelected13,
          controller: llanta5s,
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
          label: "7-LlantaD " + llanta7 + ":",
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
      ],
    );
  }

  void _doSomething(String text) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    print(widget.dolly);
    guardar();
  }

  void guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("dolly", widget.dolly);
    prefs.setString("llanta1d", llanta1s.text);
    prefs.setString("llanta3d", llanta3s.text);
    prefs.setString("llanta5d", llanta5s.text);
    prefs.setString("llanta7d", llanta7s.text);
    setState(() {});
  }
}
