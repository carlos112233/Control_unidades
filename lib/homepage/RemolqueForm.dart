import 'package:control_unidades/components/LabeledCheckbox.dart';
import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Listadeinspeccion.dart';

class RemolqueForm extends StatelessWidget {
  final String tipoRemolque;
  final String rem;
  final String placasrem1;
  final String rem2;
  final String placasrem2;
  final String unidad;
  final String placasunida;
  final String dolly;
  final bool remolquebol;
  final Color colorTracto;
  final Color colorRemolque;
  final Color colorDolly;
  final Color colorRemolque2;

  const RemolqueForm({
    Key key,
    this.tipoRemolque,
    this.rem,
    this.placasrem1,
    this.remolquebol,
    this.colorTracto,
    this.colorRemolque,
    this.colorDolly,
    this.colorRemolque2,
    this.rem2,
    this.placasrem2,
    this.unidad,
    this.placasunida,
    this.dolly,
  }) : super(key: key);
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(tipoRemolque);
    if (tipoRemolque == "1") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Remolque-$tipoRemolque"),
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
                            colorRemolque: Colors.green,
                            colorDolly: colorDolly,
                            colorRemolque2: colorRemolque2,
                            colorTracto: colorTracto,
                            bolrem2: remolquebol,
                            unidad: unidad,
                            placasunida: placasunida,
                            rem1: rem,
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
              height: size.height * 1.62,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: size.width * .4999,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        LabeledCheckbox2(
                          label: "Rem-$tipoRemolque:",
                          value: true,
                          values: rem,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          ancho: 130,
                        ),
                        MyStatefulWidget(
                          tipoRem: tipoRemolque,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * .49,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        LabeledCheckbox2(
                          label: "placas:",
                          value: true,
                          values: placasrem1,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          ancho: 130,
                        ),
                        MyStateful2Widget(
                          tipoRem: tipoRemolque,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (tipoRemolque == "2") {
      print(tipoRemolque);
      return Scaffold(
        appBar: AppBar(
          title: Text("Remolque-$tipoRemolque"),
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
                            colorRemolque2: Colors.green,
                            colorDolly: colorDolly,
                            colorRemolque: colorRemolque,
                            colorTracto: colorTracto,
                            bolrem2: remolquebol,
                            unidad: unidad,
                            placasunida: placasunida,
                            rem1: rem,
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
              height: size.height * 1.59,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: size.width * .513,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        LabeledCheckbox2(
                          label: "Rem-$tipoRemolque:",
                          value: true,
                          values: rem2,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          ancho: 130,
                        ),
                        MyStatefulWidget(
                          tipoRem: tipoRemolque,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * .513,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        LabeledCheckbox2(
                          label: "placas:",
                          value: true,
                          values: placasrem2,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          ancho: 130,
                        ),
                        MyStateful2Widget(
                          tipoRem: tipoRemolque,
                        )
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
}

class MyStatefulWidget extends StatefulWidget {
  final String tipoRem;
  const MyStatefulWidget({
    key,
    this.tipoRem,
  }) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected6 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  String llanta1s = '';
  String llanta3s = '';
  String llanta5s = '';
  String llanta7s = '';
  final llanta1 = TextEditingController();
  final llanta3 = TextEditingController();
  final llanta5 = TextEditingController();
  final llanta7 = TextEditingController();
  final fm = TextEditingController();
  final se = TextEditingController();
  final fdrem = TextEditingController();
  final partintder = TextEditingController();
  final pisopartint = TextEditingController();

  void llenar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (widget.tipoRem == "1") {
      llanta1s = prefs.getString("llantarem1Eco0");
      llanta3s = prefs.getString("llantarem1Eco2");
      llanta5s = prefs.getString("llantarem1Eco4");
      llanta7s = prefs.getString("llantarem1Eco6");
    } else {
      llanta1s = prefs.getString("llantarem2Eco0");
      llanta3s = prefs.getString("llantarem2Eco2");
      llanta5s = prefs.getString("llantarem2Eco4");
      llanta7s = prefs.getString("llantarem2Eco6");
    }
  }

  @override
  void initState() {
    super.initState();
    llenar();
  }

  @override
  Widget build(BuildContext context) {
    String tipoRem = widget.tipoRem;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          onChanged2: _doSomething,
          controller: fm,
          label: "Fisicomecanica:",
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
          onChanged2: _doSomething,
          controller: se,
          label: "Sello de entrada:",
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
          onChanged2: _doSomething,
          controller: fdrem,
          label: "Afuera/Debajo del remolque:",
          descripcion: "Observación",
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
          onChanged2: _doSomething,
          controller: partintder,
          label: "Parte int. lado derecho :",
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
          onChanged2: _doSomething,
          controller: pisopartint,
          label: "Piso Parte Int.:",
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
          onChanged2: _doSomething,
          controller: llanta1,
          label: "1-LlantaR$tipoRem -$llanta1s:",
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
          onChanged2: _doSomething,
          controller: llanta3,
          label: "3-LlantaR$tipoRem $llanta3s:",
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
          onChanged2: _doSomething,
          controller: llanta5,
          label: "5-LlantaR$tipoRem -$llanta5s:",
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
          onChanged2: _doSomething,
          controller: llanta7,
          label: "7-LlantaR$tipoRem $llanta7s:",
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
    // print(llanta2s.text);
    guardar();
  }

  void guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.tipoRem == "1") {
      print(fm.text);
      prefs.setString("fmrem1", fm.text);
      prefs.setString("serem1", se.text);
      prefs.setString("fdremrem1", fdrem.text);
      prefs.setString("partintderrem1", partintder.text);
      prefs.setString("pisopartintrem1", pisopartint.text);
      prefs.setString("llantaremrev1Eco0", llanta1.text);
      prefs.setString("llantaremrev1Eco2", llanta3.text);
      prefs.setString("llantaremrev1Eco4", llanta5.text);
      prefs.setString("llantaremrev1Eco6", llanta7.text);
    } else {
      print(fm.text);
      prefs.setString("fmrem2", fm.text);
      prefs.setString("serem2", se.text);
      prefs.setString("fdremrem2", fdrem.text);
      prefs.setString("partintderrem2", partintder.text);
      prefs.setString("pisopartintrem2", pisopartint.text);
      prefs.setString("llantaremrev2Eco0", llanta1.text);
      prefs.setString("llantaremrev2Eco2", llanta3.text);
      prefs.setString("llantaremrev2Eco4", llanta5.text);
      prefs.setString("llantaremrev2Eco6", llanta7.text);
    }
    setState(() {});
  }
}

class MyStateful2Widget extends StatefulWidget {
  final String tipoRem;
  const MyStateful2Widget({key, this.tipoRem}) : super(key: key);

  @override
  _MyStateful2WidgetState createState() => _MyStateful2WidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateful2WidgetState extends State<MyStateful2Widget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected5 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  String llanta2s = '';
  String llanta4s = '';
  String llanta6s = '';
  String llanta8s = '';
  final llanta2 = TextEditingController();
  final llanta4 = TextEditingController();
  final llanta6 = TextEditingController();
  final llanta8 = TextEditingController();
  final puliz = TextEditingController();
  final parinizq = TextEditingController();
  final techoint = TextEditingController();
  final paredfrontal = TextEditingController();

  void llenar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (widget.tipoRem == "1") {
      llanta2s = prefs.getString("llantarem1Eco1");
      llanta4s = prefs.getString("llantarem1Eco3");
      llanta6s = prefs.getString("llantarem1Eco4");
      llanta8s = prefs.getString("llantarem1Eco7");
    } else {
      llanta2s = prefs.getString("llantarem2Eco1");
      llanta4s = prefs.getString("llantarem2Eco3");
      llanta6s = prefs.getString("llantarem2Eco4");
      llanta8s = prefs.getString("llantarem2Eco7");
    }
  }

  @override
  void initState() {
    super.initState();
    llenar();
  }

  @override
  Widget build(BuildContext context) {
    String tipoRem = widget.tipoRem;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          onChanged2: _doSomething,
          controller: puliz,
          label: "Puertas por Fuera/Dentro:",
          descripcion: "Observación",
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
          onChanged2: _doSomething,
          controller: parinizq,
          label: "Parte int. lado Izq.:",
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
          onChanged2: _doSomething,
          controller: techoint,
          label: "Techo parte Int.:",
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
          onChanged2: _doSomething,
          controller: paredfrontal,
          label: "Pared Frontal:",
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
        SizedBox(
          height: 50,
        ),
        LabeledCheckbox(
          onChanged2: _doSomething,
          controller: llanta2,
          label: "2-LlantaR$tipoRem $llanta2s:",
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
          onChanged2: _doSomething,
          controller: llanta4,
          label: "4-LlantaR$tipoRem $llanta4s:",
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
          onChanged2: _doSomething,
          controller: llanta6,
          label: "6-LlantaR$tipoRem $llanta6s:",
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
          onChanged2: _doSomething,
          controller: llanta8,
          label: "8-LlantaR$tipoRem $llanta8s:",
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
    // print(llanta2s.text);
    guardar();
  }

  void guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.tipoRem == "1") {
      prefs.setString("pulizrem1", puliz.text);
      prefs.setString("parinizqrem1", parinizq.text);
      prefs.setString("techointrem1", techoint.text);
      prefs.setString("paredfrontalrem1", paredfrontal.text);
      prefs.setString("llantaremrev1Eco1", llanta2.text);
      prefs.setString("llantaremrev1Eco3", llanta4.text);
      prefs.setString("llantaremrev1Eco5", llanta6.text);
      prefs.setString("llantaremrev1Eco7", llanta8.text);
    } else {
      prefs.setString("pulizrem2", puliz.text);
      prefs.setString("parinizqrem2", parinizq.text);
      prefs.setString("techointrem2", techoint.text);
      prefs.setString("paredfrontalrem2", paredfrontal.text);
      prefs.setString("llantaremrev2Eco1", llanta2.text);
      prefs.setString("llantaremrev2Eco3", llanta4.text);
      prefs.setString("llantaremrev2Eco5", llanta6.text);
      prefs.setString("llantaremrev2Eco7", llanta8.text);
    }
    setState(() {});
  }
}
