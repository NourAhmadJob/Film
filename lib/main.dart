import 'package:flutter/material.dart';
import 'package:movies/core/services/service_locator.dart';
import 'package:movies/movies/presentation/screen/6.2%20movies_screen.dart';
import 'package:shimmer/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen()
    );
  }
}
