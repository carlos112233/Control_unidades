import 'package:control_unidades/class/historico_rev.dart';
import 'package:control_unidades/class/select_llantas_rev.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Tracto2Form.dart';

void _cargar(BuildContext context, id, unidad) async {
  String url =
      "http://supertrack-net.ddns.net:50371/controldeunidades/php/historico_rev.php";
  var respuesta = await http.post(url, body: {
    'id': "$id",
    'trac': unidad,
  }, headers: {
    'Content-Type': 'application/x-www-form-urlencoded'
  });
  final data = historicoRevFromJson(respuesta.body);

  String url2 =
      "http://supertrack-net.ddns.net:50371/controldeunidades/php/select_llantas.php";
  var respuesta2 = await http.post(url2, body: {
    'unidad': unidad,
    'rev': "$id",
  }, headers: {
    'Content-Type': 'application/x-www-form-urlencoded'
  });
  final llantas = selectLlantasRevFromJson(respuesta2.body);
  var llanta = [];
  llantas.forEach((key, value) {
    llanta.add(value.llantaNumEco);
  });
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return Tracto2Form(
          unidad: unidad,
          index: id,
          datos: [
            data.motivoIngreso,
            //izq
            data.cabina,
            data.tanqueAire,
            data.ejeImpulsor,
            data.quintaRueda,
            data.cmTIzq,
            data.escape,
            data.capTanqueLtIzq,
            data.trampaIzq,
            data.fierro,
            data.taponDieselIzq,
            //der
            data.defensaDelantera,
            data.motor,
            data.pisoCabiba,
            data.tanqueDiesel,
            data.cmTDer,
            data.capTanqueLtDer,
            data.trampaDer,
            data.aluminio,
            data.taponDieselDer,
          ],
          llantas: [
            llanta[0],
            llanta[1],
            llanta[2],
            llanta[3],
            llanta[4],
            llanta[5],
            llanta[6],
            llanta[7],
            llanta[8],
            llanta[9],
          ],
        );
      },
    ),
  );
}

class HistoricoTracto extends StatelessWidget {
  final int historico;
  final String unidad;

  const HistoricoTracto({
    Key key,
    this.historico,
    this.unidad,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(unidad);
    return Scaffold(
      appBar: new AppBar(
        title: Text('Historico'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: List.generate(
          historico,
          (index) => ListTile(
            title: Text('Unidad: $unidad '),
            subtitle: Text('Revision'),
            onTap: () {
              _cargar(context, index + 1, unidad);
            },
          ),
        ),
      ),
    );
  }
}
