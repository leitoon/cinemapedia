

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import '../../domain/datasources/movies_datasources.dart';

class MovieRepositoryImpl extends MoviesRepository
{
  late final MoviesDatasource datasource; 
  MovieRepositoryImpl(this.datasource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return this.datasource.getNowPlaying(page: page);
  }
  
  
}