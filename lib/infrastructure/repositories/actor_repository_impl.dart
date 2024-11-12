

import 'package:cinemapedia/domain/entities/actor.dart';
import '../../domain/datasources/actors_datasourse.dart';
import '../../domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasourse datasource;
  ActorRepositoryImpl(this.datasource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId); 
  }


}