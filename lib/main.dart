import 'package:api/UI/spinnerwidget.dart';
import 'package:api/api/themoviedbservice.dart';
import 'package:api/UI/cajapelicula.dart';
import 'package:flutter/material.dart';

void main() {
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
        primarySwatch: Colors.green,
      ),
      home: const MovieDBPage(),
    );
  }
}

class MovieDBPage extends StatelessWidget {
  const MovieDBPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Peliculas Jose valoradas')),
        body: FutureBuilder(
//podría poner
//initialData: [],
          future: TheMovieDBService.getTopRatedMovies(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var pelicula = snapshot.data![index];
                  return CajaPelicula(peli: pelicula);
                },
              );
            } else {
              return const SpinnerWidget();
            }
          },
        ));
  }
}
