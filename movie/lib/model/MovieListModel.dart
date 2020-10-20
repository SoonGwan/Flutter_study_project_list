import 'package:equatable/equatable.dart';

class MovieListModel {
  // final List<MovieListSubModel> movies;
  final List<MovieListSubModel> movies;

  static MovieListModel empty = MovieListModel(movies: List.empty());
}

class MovieListSubModel {}
