import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:control_unidades/homepage/consulta/consulta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VistaPreliminar extends StatelessWidget {
  final bool visible;

  const VistaPreliminar({
    Key key,
    this.visible,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    final Size size = MediaQuery.of(context).size;
    final List<Widget> colorCodes = <Widget>[
      Container(
        height: size.height * .45,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: size.width * .49,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Text(
                    "Tracto\n",
                    style: TextStyle(fontSize: 20),
                  ),
                  LabeledCheckbox2(
                    label: "Unidad: ",
                    values: "ST271",
                    active: false,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    ancho: size.height * .28,
                  )
                ],
              ),
            ),
            Container(
              width: size.width * .49,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Text(
                    "Remolque 1\n",
                    style: TextStyle(fontSize: 20),
                  ),
                  LabeledCheckbox2(
                    label: "Unidad: ",
                    values: "697929",
                    active: false,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    ancho: size.height * .28,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        height: size.height * .4,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Visibility(
              visible: visible,
              child: Container(
                width: size.width * .49,
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Dolly\n",
                      style: TextStyle(fontSize: 20),
                    ),
                    LabeledCheckbox2(
                      label: "Unidad: ",
                      values: "SD-011",
                      active: false,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      ancho: size.height * .28,
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: Container(
                width: size.width * .49,
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Remolque 2\n",
                      style: TextStyle(fontSize: 20),
                    ),
                    LabeledCheckbox2(
                      label: "Unidad: ",
                      values: "697927",
                      active: false,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      ancho: size.height * .28,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ];
//
//
//
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        _onBackPressed(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vista preliminar de Observaciones o Daños"),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: GestureDetector(
                onTap: () {
                  _limpiar(context);
                },
                child: Icon(
                  Icons.save,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: ListView(
            children: colorCodes,
          ),
        ),
      ),
    );
  }

  void _limpiar(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Consulta(),
        ),
        (Route<dynamic> route) => false);
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Esta seguro de Salír?'),
            content: new Text(
                'Si sales de la aplicación la inspección se eliminará'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("Si"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
