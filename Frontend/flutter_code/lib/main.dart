import 'package:flutter/material.dart';
import 'package:frontendscg/screens/homepage.dart';

// TODO: mettere schermatra di caricamento finchè tutti i grafici presenti nella pagina da visualizzare sono pronti

void main() async {
  runApp(const MyApp());
}

// Use this command to run the app on chrome
// flutter run -d chrome --web-renderer html
// flutter run --profile

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCGProject',
      home: HomePage(),
    );
  }
}
