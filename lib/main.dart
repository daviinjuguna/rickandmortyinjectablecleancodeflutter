import 'package:flutter/material.dart';
import 'package:rickandmorty/features/presentation/pages/character_page.dart';
import 'package:rickandmorty/injection.dart';
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Env.dev);
  _setUpLogging();
  runApp(MyApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}:${event.time}:${event.message}');
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple[500],
        accentColor: Colors.purple[700],
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).primaryColor

        )
      ),
      home: CharacterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

