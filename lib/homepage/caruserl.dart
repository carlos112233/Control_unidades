import 'package:control_unidades/components/selectedPhotos.dart';
import 'package:control_unidades/components/visibles.dart';
import 'package:control_unidades/homepage/galery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int photosIndex = 0;
  int select;
  List<String> photos = [
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
  bool isVisible = true;

  void _anteriorImage() {
    setState(() {
      photosIndex = photosIndex > 0 ? photosIndex - 1 : 0;
      _ocultar();
    });
  }

  void _siguieteImage() {
    setState(() {
      photosIndex =
          photosIndex < photos.length - 1 ? photosIndex + 1 : photosIndex;
      _ocultar();
    });
  }

  void _ocultar() {
    if (photosIndex == 0) {
      isVisible = true;
    } else {
      isVisible = false;
    }
  }

  void _cargar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    photosIndex = prefs.getInt('number');
    prefs.setInt("number", null);
    _ocultar();
    setState(() {
      select = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    if (select != 1) {
      _cargar();
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    image: DecorationImage(
                      image: AssetImage(
                        photos[photosIndex],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment(
                          0.99,
                          0.0,
                        ),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.1), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Text(
                                  "▶",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onTap: _siguieteImage,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment(-0.99, 0.0),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.1), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Text(
                                  "◀",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onTap: _anteriorImage,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment(0.99, -0.80),
                        child: Text(
                          "ST210",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment(-0.99, 0.99),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.1), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Galery();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment(-0.99, -0.80),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.1), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return Galery();
                                //     },
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ),
                      ),
                      Visibles(
                        isVisible: isVisible,
                        numero: " 1",
                        x: 0.0,
                        y: 0.15,
                        altura: 19,
                        ancho: 19,
                        tamanio: 19.5,
                        sColor: Colors.blue,
                      ),
                      Visibles(
                        isVisible: isVisible,
                        numero: " 2",
                        x: -0.3,
                        y: 0.3,
                        altura: 19,
                        ancho: 19,
                        tamanio: 19.5,
                        sColor: Colors.blue,
                      ),
                      Visibles(
                        isVisible: isVisible,
                        numero: " 3",
                        x: 0.3,
                        y: 0.3,
                        altura: 19,
                        ancho: 19,
                        tamanio: 19.5,
                        sColor: Colors.blue,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 25.0,
                        left: 25.0,
                        child: SelectedPhoto(
                          numeroOfDots: photos.length,
                          photoIndex: photosIndex,
                        ),
                      )
                    ],
                  ),
                  height: 319.6,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
