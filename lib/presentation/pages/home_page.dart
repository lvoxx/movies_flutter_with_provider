import 'package:flutter/material.dart';
import 'package:movies_provider/presentation/widgets/movie_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var movieList = context.watch<MovieProvider>().movies;
    var favList = context.watch<MovieProvider>().fav;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fav');
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red[600],
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0)),
              child: Text(
                (favList.isEmpty)
                    ? 'No movie in Favorite'
                    : 'You have fav ${favList.length} movies',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (_, index) {
                  final currentMovie = movieList[index];
                  return Card(
                    key: ValueKey(currentMovie.title),
                    color: Colors.blue,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        currentMovie.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        currentMovie.duration ?? 'No information',
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: favList.contains(currentMovie)
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () {
                          if (favList.contains(currentMovie)) {
                            context
                                .read<MovieProvider>()
                                .removeMovieFromFav(currentMovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .addMovieToFav(currentMovie);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
