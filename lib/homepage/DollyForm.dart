import 'package:control_unidades/components/LabeledCheckbox.dart';
import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:control_unidades/homepage/Listadeinspeccion.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dolly extends StatelessWidget {
  final String dolly;
  final String llanta1;
  final String llanta2;

  final Color colorRemolque;
  final Color colorDolly;
  final Color colorRemolque2;
  final Color colorTracto;
  final bool rem2;
  const Dolly({
    Key key,
    this.llanta1,
    this.llanta2,
    this.dolly,
    this.colorRemolque,
    this.colorDolly,
    this.colorRemolque2,
    this.rem2,
    this.colorTracto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        builder: (context) => InspecTractoList(
                          colorDolly: Colors.green,
                          colorRemolque: colorRemolque,
                          colorRemolque2: colorRemolque2,
                          colorTracto: colorTracto,
                          bolrem2: rem2,
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
          Container(
            height: size.height * .6,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: size.height * .8,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      LabeledCheckbox2(
                        label: "Economico Rem:  ",
                        value: true,
                        values: dolly,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        ancho: 130,
                      ),
                      MyStateful2Widget(),
                    ],
                  ),
                ),
                Container(
                  width: size.height * .6,
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
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          onChanged2: _doSomething,
          controller: controller,
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
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          onChanged2: _doSomething,
          label: "Llanta 1:",
          descripcion: "Motivo del daño",
          controller: controller,
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

  Future<void> _doSomething(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString("valor", text);
    });
  }
}
