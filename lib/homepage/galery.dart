import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'caruserl.dart';

class Galery extends StatefulWidget {
  @override
  _GaleryState createState() => _GaleryState();
}

void _indexPhotos(number) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt("number", number);
  print(number);
}

class _GaleryState extends State<Galery> {
  bool loading;
  List<String> ids = [
    'assets/images/frente.JPG',
    'assets/images/LD.JPG',
    'assets/images/LDT.JPG',
    'assets/images/Atras.JPG',
    'assets/images/LDremolque.JPG',
    'assets/images/LIremolque.JPG',
    'assets/images/LIT.JPG',
    'assets/images/LI.JPG',
    'assets/images/LDpuerta.JPG',
    'assets/images/Interior.JPG',
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('este es un mensaje ')));
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            _indexPhotos(index);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Carousel();
                },
              ),
            );
          },
          child: Image.asset(
            ids[index],
            height: 800,
            width: 500,
          ),
        ),
        itemCount: ids.length,
      ),
    );
  }
}
