import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';


class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _HomeView(),
        
      ),
      bottomNavigationBar:CustomBottomNavegation() ,
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final SlidesShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
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
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subTitle: 'Este mes',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
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
            movies: nowPlayingMovies,
            title: 'Mejor calificadas',
            subTitle: 'Desde siempre',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            } ,
            ),
            SizedBox(height: 15,)
        
        
                  ],
        );
          },
          childCount: 1
          
        ))
        
      ],
    );
  }
}