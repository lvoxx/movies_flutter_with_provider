import 'package:flutter/material.dart';
import 'package:movies_provider/routes/app_routes.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final AppRoutes _appRoutes = AppRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRoutes.onGenerateRoute,
      title: 'Movie Now',
    );
  }

  @override
  void dispose() {
    //_appRoutes.dispose();
    super.dispose();
  }
}
