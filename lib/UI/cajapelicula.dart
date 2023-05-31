import 'package:api/api/movie.dart';
import 'package:api/UI/pelicula.dart';
import 'package:flutter/material.dart';

class CajaPelicula extends StatelessWidget {
  Movie peli;

  CajaPelicula({super.key, required this.peli});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(peli.title),
      subtitle: Text("${peli.voteAverage} (${peli.voteCount})"),
      trailing: Image.network(peli.getImage()),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Pelicula(movie: peli)));
      },
    );
  }
}
