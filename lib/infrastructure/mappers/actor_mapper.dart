


import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast)=> 
  Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}':'https://www.chem.indiana.edu/wp-content/uploads/2023/09/defaultpic.jpg', 
    character:cast.character);
}