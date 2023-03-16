import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plantdisease/utils/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  File? _image;
  
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);


      setState(() {
        this._image = imagePermanent;
      });
    }on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
  
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
            style: plantAppStyleBig,
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
            //_image != null ? Image.file(_image!) :
            SpeedDialChild(
              child: IconButton(
                icon: Icon(Icons.image_outlined),
                color: Colors.white,
                onPressed: () => getImage(ImageSource.gallery ),
              ),
              label: "Gallery",
              labelStyle: plantAppStylemMed,
              backgroundColor: Colors.lightGreen,
              labelBackgroundColor: Colors.transparent,

            ),
            SpeedDialChild(
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                color: Colors.white,
                onPressed: () => getImage(ImageSource.camera),
              ),
              label: "Camera",
              labelStyle: plantAppStylemMed,
              backgroundColor: Colors.lightGreen,
              labelBackgroundColor: Colors.transparent,

            ),
          ],
        ),
      ),
    );
  }}

