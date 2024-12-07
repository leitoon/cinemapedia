


import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_respository.dart';

import '../../domain/datasources/local_storage_datasource.dart';

class LocalStorageRepositoryImpl extends LocalStorageRespository {


  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);
  @override
  Future<bool> isMovieFavorite(int movieId) {
    // TODO: implement isMovieFavorite
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit,offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}