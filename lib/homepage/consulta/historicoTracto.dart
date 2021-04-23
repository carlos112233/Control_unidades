import 'package:flutter/material.dart';

import '../Tracto2Form.dart';

class HistoricoTracto extends StatelessWidget {
  final int historico;

  const HistoricoTracto({
    Key key,
    this.historico,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Historico'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: new List.generate(
          historico,
          (index) => new ListTile(
            title: Text('Unidad: ST288 '),
            subtitle: Text('Fecha de revisión:12-04-2021 11:3$index '),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Tracto2Form(
                      unidad: "ST288",
                      fecha: "12-04-2021 11:3$index",
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
