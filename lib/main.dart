import 'package:flutter/material.dart';
import 'package:plantdisease/routes/previewpage.dart';
import 'package:plantdisease/routes/homepage.dart';

void main() {

  runApp(MaterialApp(
    initialRoute: '/homepage',
    routes: {
      '/previewpage': (context) => Previewpage(),
      '/homepage': (context) => Homepage(),
    },

  ));
}