
import 'package:cinemapedia/infrastructure/datasource/actor_movidb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// este repositorio es inmutable
final actorRepositoryProvider = Provider((ref)
{

return ActorRepositoryImpl(ActorMovidbDatasource());
}
);