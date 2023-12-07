import 'package:flutter/material.dart';
import 'package:movies_provider/presentation/pages/fav_page.dart';
import 'package:movies_provider/presentation/pages/home_page.dart';
import 'package:movies_provider/presentation/widgets/movie_provider.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  final MovieProvider _movieProvider = MovieProvider();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                    value: _movieProvider,
                    child: const HomePage(),
                  ));
        }
      case '/fav':
        {
          return MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                    value: _movieProvider,
                    child: const FavPage(),
                  ));
        }
      default:
        return null;
    }
  }

  void dispose() {
    _movieProvider.dispose();
  }
}
