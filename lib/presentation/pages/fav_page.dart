import 'package:flutter/material.dart';
import 'package:movies_provider/presentation/widgets/movie_provider.dart';
import 'package:provider/provider.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    var favList = context.watch<MovieProvider>().fav;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav Movie'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: favList.length,
                itemBuilder: (_, index) {
                  final currentMovie = favList[index];
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
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context
                              .read<MovieProvider>()
                              .removeMovieFromFav(currentMovie);
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
