import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantdisease/utils/styles.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/7c/45/49/7c4549e31938a952184a4a9b8420cfb6.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Text(
            'Plant Disease Identifier',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.brown, fontFamily: 'Raleway'),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SpeedDial(
          icon: Icons.search,
          activeIcon: Icons.close,
          spacing: 50,
          foregroundColor:Colors.white,
          backgroundColor: Colors.lightGreen[800],
          buttonSize: const Size.fromRadius(60),
          childrenButtonSize: const Size.fromRadius(40),
          spaceBetweenChildren: 20,
          children: [
            SpeedDialChild(
              child: const FaIcon(
                FontAwesomeIcons.image,
                color: Colors.white,
              ),
              label: "Gallery",
              labelStyle: TextStyle(
                color: Colors.brown,
                fontWeight:FontWeight.bold,
                fontSize: 20,
              ),
              backgroundColor: Colors.lightGreen,
              labelBackgroundColor: Colors.transparent,

            ),
            SpeedDialChild(
              child: const FaIcon(
                FontAwesomeIcons.camera,
                color: Colors.white,
              ),
              label: "Camera",
              labelStyle: TextStyle(
                color: Colors.brown,
                fontWeight:FontWeight.bold,
                fontSize: 20,
              ),
              backgroundColor: Colors.lightGreen,
              labelBackgroundColor: Colors.transparent,

            ),
          ],
        ),
      ),
    );
  }}