import 'package:flutter/material.dart';
import 'package:yutufree/src/providers/video_provider.dart';
// import 'package:yutufree/src/widgets/home_widget.dart';
// import 'package:yutufree/src/widgets/results_widget.dart';

class DataSearch extends SearchDelegate {
  final PopularesProvider videos;
  String q;
  DataSearch(this.videos);
  @override
  List<Widget> buildActions(BuildContext context) {
    // acciones de nuestro appbar
    return [
      IconButton(
          onPressed: () {
            q = query;
            // items(videos.getbusqueda(q));
            close(context, videos.getbusqueda(q));

            // showResults(context);
          },
          icon: Icon(Icons.search)),
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // la instruccion que crea los resultados
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerencias cuando la persona escribe
    return Container();
  }
}
