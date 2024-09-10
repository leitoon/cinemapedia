

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  const MovieHorizontalListview({super.key, required this.movies, this.title, this.subTitle, this.loadNextPage});
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if(title != null || subTitle!= null)
          _Title(tittle: title,subTitle: subTitle,),
          Expanded(child: 
          ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics( ),
            itemBuilder: (context, index){
              return _Slide(movie:movies[index] ,); 
            })
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;


  const _Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                fit: BoxFit.cover,
                movie.posterPath,
                height: 220,
                width:150 ,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress!=null){
                    return const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(strokeAlign: 2,),
                      ),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style:textStyles.titleSmall ,
            ),
          ),
          Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
              SizedBox(width: 3,),
              Text('${movie.voteAverage}',style: textStyles.bodyMedium?.copyWith(color:Colors.yellow.shade800 ),),
              SizedBox(width:10,),
             Text('${movie.popularity}',style: textStyles.bodySmall,),

            ],
          )
        ],
      ),
    );
  }
}


class _Title extends StatelessWidget {
  final String? tittle;
  final String? subTitle;
  const _Title({this.tittle, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (tittle!=null)
          Text(tittle!,style: titleStyle,),
          Spacer(),
          if (subTitle!=null)
          FilledButton.tonal(
          style: ButtonStyle(visualDensity: VisualDensity.compact),
          onPressed: (){}, 
          child: Text(subTitle!))

        ],
      ),
    );
  }
}