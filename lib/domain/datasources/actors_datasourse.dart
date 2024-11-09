

import '../entities/actor.dart';

abstract class ActorsDatasourse {
  Future<List<Actor>> getActorsByMovie(String movieId);
}