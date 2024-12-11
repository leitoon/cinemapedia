

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../domain/entities/movie.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  const MovieMasonry({super.key, required this.movies, this.loadNextPage});

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  final sccrollController= ScrollController();
  @override
  void initState() {
    sccrollController.addListener((){
      if(widget.loadNextPage==null) return;
      if((sccrollController.position.pixels + 100)>= sccrollController.position.maxScrollExtent){
        widget.loadNextPage!();
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: sccrollController,
      crossAxisCount: 3, 
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: widget.movies.length,
      itemBuilder: (context, index){
        if(index==1){
          return Column(
            children: [
              SizedBox(height: 40,),
              MoviePosterLink(movie: widget.movies[index])
            ],
          );
        }
        return MoviePosterLink(movie: widget.movies[index]);
      });
  }
}