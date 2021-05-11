import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'consulta/consulta.dart';

class Tracto2Form extends StatelessWidget {
  final String unidad;
  final int index;
  final List<String> datos;
  final List<String> llantas;
  const Tracto2Form({
    Key key,
    this.unidad,
    this.index,
    this.datos,
    this.llantas,
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
                  Icons.check,
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
                "Historico de la unidad $unidad ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            height: size.height * 1.85,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: size.width * .51,
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
                      MyStateful2Widget(
                        data: [
                          datos[1],
                          datos[2],
                          datos[3],
                          datos[4],
                          datos[5],
                          datos[6],
                          datos[7],
                          datos[8],
                          datos[9],
                          datos[10],
                        ],
                        llantas: [
                          llantas[0],
                          llantas[2],
                          llantas[4],
                          llantas[6],
                          llantas[8],
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * .51,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      MyStatefulWidget(
                        llantas: [
                          llantas[0],
                          llantas[3],
                          llantas[5],
                          llantas[7],
                          llantas[9],
                        ],
                        datos: [
                          datos[0],
                          datos[9],
                          datos[10],
                          datos[11],
                          datos[12],
                          datos[13],
                          datos[14],
                          datos[15],
                          datos[16],
                          datos[17],
                        ],
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

/// This is the private State class that goes with MyStatefulWidget.
class MyStatefulWidget extends StatefulWidget {
  final List<String> llantas;
  final List<String> datos;
  const MyStatefulWidget({
    key,
    this.llantas,
    this.datos,
  }) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String llanta2s;
  String llanta4s;
  String llanta6s;
  String llanta8s;
  String llanta10s;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Motivo de  ingreso: ",
          descripcion: "Observación",
          values: widget.datos[0],
          value: true,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Defensa delantera:  ",
          descripcion: "Observación",
          values: widget.datos[1],
          value: true,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Motor:  ",
          descripcion: "Observación",
          values: widget.datos[2],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Piso de cabiba :  ",
          descripcion: "Observación",
          values: widget.datos[3],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Tanque de Diesel:  ",
          descripcion: "Observación",
          values: widget.datos[4],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "CM T. Der.:  ",
          descripcion: "Observación",
          values: widget.datos[5],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Cap. Tanque LT. Der.:  ",
          descripcion: "Observación",
          values: widget.datos[6],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Trampa Der.:  ",
          descripcion: "Observación",
          values: widget.datos[7],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Aluminio:  ",
          descripcion: "Observación",
          values: widget.datos[8],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Tapon de Diesel Der.:  ",
          descripcion: "Observación",
          values: widget.datos[9],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        SizedBox(
          height: 50,
        ),
        LabeledCheckbox2(
          label: "2-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[0],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "4-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[1],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "6-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[2],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "8-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[3],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "10-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[4],
          value: true,
          active: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
      ],
    );
  }
}

class MyStateful2Widget extends StatefulWidget {
  final List<String> llantas;
  final List<String> data;
  const MyStateful2Widget({
    key,
    this.llantas,
    this.data,
  }) : super(key: key);

  @override
  _MyStateful2WidgetState createState() => _MyStateful2WidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateful2WidgetState extends State<MyStateful2Widget> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Cabina:  ",
          descripcion: "Observación",
          values: widget.data[0],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Tanque de Aire:  ",
          descripcion: "Observación",
          values: widget.data[1],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Eje impulsor:  ",
          descripcion: "Observación",
          values: widget.data[2],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Quinta rueda :  ",
          descripcion: "Observación",
          values: widget.data[3],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Escape :  ",
          descripcion: "Observación",
          values: widget.data[4],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "CM T. Izq.:  ",
          descripcion: "Observación",
          values: widget.data[5],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Cap. Tanque LT. Izq.:  ",
          descripcion: "Observación",
          values: widget.data[6],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Trampa Izq.:  ",
          descripcion: "Observación",
          values: widget.data[7],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Fierro:  ",
          descripcion: "Observación",
          values: widget.data[8],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "Tapon de Diesel Izq:  ",
          descripcion: "Observación",
          values: widget.data[9],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "1-Llanta :  ",
          descripcion: "Observación",
          values: widget.llantas[0],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "3-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[1],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "5-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[2],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "7-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[3],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
        LabeledCheckbox2(
          label: "9-Llanta : ",
          descripcion: "Observación",
          values: widget.llantas[4],
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
        ),
      ],
    );
  }
}
