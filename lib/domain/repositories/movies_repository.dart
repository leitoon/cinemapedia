import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying ({int page = 1});
  Future<List<Movie>> getNowPopular ({int page = 1});
  Future<List<Movie>> getUpcomming ({int page = 1});
  Future<List<Movie>> getTopRated ({int page = 1});
}