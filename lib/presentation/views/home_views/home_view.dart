

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movies/initial_loading_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return FullScreenLoader();
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final SlidesShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topratingMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
         
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
           // centerTitle: true,
            
            title:  CustomAppbar(),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate
        (
          (context, index){
              return Column(
          children: [
           
            MoviesSlideshow(movies: SlidesShowMovies),
            MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subTitle: 'Lunes',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            } ,
            ),MovieHorizontalListview(
            movies: upcomingMovies,
            title: 'Próximamente',
            subTitle: 'Este mes',
            loadNextPage: () {
              ref.read(upcomingMoviesProvider.notifier).loadNextPage();
            } ,
            ),
            MovieHorizontalListview(
            movies: popularMovies,
            title: 'Populares',
            //subTitle: 'Lunes',
            loadNextPage: () {
              ref.read(popularMoviesProvider.notifier).loadNextPage();
            } ,
            ),
            MovieHorizontalListview(
            movies: topratingMovies,
            title: 'Mejor calificadas',
            subTitle: 'Desde siempre',
            loadNextPage: () {
              ref.read(topRatedMoviesProvider.notifier).loadNextPage();
            } ,
            ),
            const SizedBox(height: 15,)
        
        
                  ],
        );
          },
          childCount: 1
          
        ))
        
      ],
    );
  }
}