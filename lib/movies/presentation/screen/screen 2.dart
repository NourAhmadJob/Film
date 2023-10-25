import 'package:flutter/material.dart';
import 'package:movies/movies/presentation/screen/6.2%20movies_screen.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviesScreen()));
          },
          child: const Text("Get Now"),
        ),
      ),
    );
  }
}
