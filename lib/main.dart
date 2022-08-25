import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/pages.dart';
// import 'package:newsapp/src/providers/providers.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/share_preferences/preferences.dart';
import 'package:newsapp/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() async { 
  // para poder usar el await evita error de flutter
  WidgetsFlutterBinding.ensureInitialized();
  // leyendo las preferencias de ususaario en todo el proyecto entero
  await Preferences.init(); 

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()), 
      ],
      child: const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: const TabsPage(),
      initialRoute: 'main',
      routes: {
        'main'    : (_) => const TabsPage(),
      },
      theme: miTema,
    );
  }
}