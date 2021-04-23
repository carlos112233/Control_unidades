import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            /*CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/frente.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment(0.0, 0.15),
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.red, // inkwell color
                          child: SizedBox(
                              width: 15,
                              height: 15,
                              child: Text(
                                "1",
                                style:
                                    TextStyle(fontSize: 8, color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/LD.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/LDT.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/Atras.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/LDremolque.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/LIremolque.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/LIT.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/LI.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/LDpuerta.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/Interior.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 280,
                enlargeCenterPage: true,
                aspectRatio: 10 / 9,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.save),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
              onPressed: () => {},
            ),*/
          ],
        ),
      ),

      //Your Widgets,
      //Your Widgets
    );
  }
}

/* images: [
              ,
              ExactAssetImage(''),
              ExactAssetImage(''),
              ExactAssetImage(''),
              ExactAssetImage(''),
              ExactAssetImage(''),
              ExactAssetImage(''),
              ExactAssetImage(''),
              ExactAssetImage(''),
              ExactAssetImage(''),
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.lightGreenAccent,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.white.withOpacity(0.0),
            borderRadius: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,*/
