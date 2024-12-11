


import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
 FavoriteViewState createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoriteView> {
  bool isLastPage = false;
  bool isLoading= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNextPage();
  }
  void loadNextPage() async {
    if(isLoading || isLastPage) return;
    isLoading=true;
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading= false;
    if(movies.isEmpty){
      isLastPage=true;
    }
  }


  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref. watch(favoriteMoviesProvider).values.toList();
    if(favoriteMovies.isEmpty){
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60,color: colors.primary,),
            Text('Ohhhh no!!!',style: TextStyle(fontSize: 30, color: colors.primary),),
            Text('No tienes peliculas favoritas',style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            FilledButton.tonal(onPressed: ()=> context.go('/home/0'), child: 
            Text('Empieza a buscar')
            )

        ],),
      );
    }
    return Scaffold(
      
      body:MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favoriteMovies),
    );
  }
}