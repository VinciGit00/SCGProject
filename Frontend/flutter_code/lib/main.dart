import 'package:flutter/material.dart';
import 'package:frontendscg/screens/homepage/homepage.dart';
import 'package:frontendscg/screens/pagina%20secondaria/pagina_secondaria.dart';
import 'package:frontendscg/utils/data_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      home: PaginaSecondaria(
        titoloPagina: "Ricavi",
        dataPath: "ricavi",
      ),
    );
  }
}
