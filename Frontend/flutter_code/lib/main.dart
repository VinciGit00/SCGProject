import 'package:flutter/material.dart';
import 'package:frontendscg/screens/homepage/homepage.dart';
import 'package:frontendscg/screens/pagina%20secondaria/pagina_secondaria.dart';
import 'package:frontendscg/utils/data_notifier.dart';
import 'package:frontendscg/utils/data_notifier_home.dart';
import 'package:frontendscg/utils/data_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataNotifierHome(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataProvider(),
        )
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCGProject',
      home: FutureBuilder(
        // eseguo lo script quando il sito viene aperto ed aspetto che finisca
        future: Provider.of<DataProvider>(context, listen: false).init(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return Center(
              child: Container(
                child: const CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
