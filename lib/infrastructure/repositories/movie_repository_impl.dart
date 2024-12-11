

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import '../../domain/datasources/movies_datasources.dart';
import '../../domain/entities/video.dart';

class MovieRepositoryImpl extends MoviesRepository
{
  late final MoviesDatasource datasource; 
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getNowPopular({int page = 1}) {
    return datasource.getNowPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcomming({int page = 1}) {
    return datasource.getUpcomming(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) {
    // TODO: implement searchMovies
    return datasource.searchMovies(query);
  }

   @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return datasource.getSimilarMovies(movieId);
  }
  
  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return datasource.getYoutubeVideosById(movieId);
  }
  
  
}