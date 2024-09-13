


import '../entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying ({int page = 1});
  Future<List<Movie>> getNowPopular ({int page = 1});
}