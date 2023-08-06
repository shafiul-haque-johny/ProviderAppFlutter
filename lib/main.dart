import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/movie_provider.dart';
import 'package:provider_app/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MovieProvider>(
      child: const MyApp(),
      create: (_) => MovieProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
