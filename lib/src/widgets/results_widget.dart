import 'package:flutter/material.dart';
// import 'package:yutufree/src/models/populars_model.dart';
import 'package:yutufree/src/pages/view_page.dart';
// import 'package:yutufree/src/providers/video_provider.dart';

Widget items(Future<dynamic> datos) {
  int val = 0;
  String url, title, id;
  return FutureBuilder(
      future: datos,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: snapshot.data.pageInfo.resultsPerPage,
            separatorBuilder: (BuildContext context, int entero) => Divider(),
            itemBuilder: (BuildContext context, int entero) {
              for (var x in snapshot.data.items) {
                if (val == entero) {
                  // print(x.id.isMap);
                  id = x.id;
                  print(x.snippet.thumbnails.medium.url);
                  url = x.snippet.thumbnails.medium.url;
                  title = x.snippet.title;
                  val = 0;
                  break;
                }
                val++;
              }
              return _videos(url, title, id, context);
            },
          );
        } else {
          return Container(child: CircularProgressIndicator());
        }
      });
}

Widget _videos(String url, title, id, BuildContext context) {
  return TextButton(
    onPressed: () {
      final route = MaterialPageRoute(builder: (context) {
        return ViewVideo(id, title);
      });
      Navigator.push(context, route);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromRGBO(18, 25, 55, 1),
      ),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/cargando_gif.gif'),
            fadeInDuration: Duration(milliseconds: 20),
            // image: NetworkImage('https://i.stack.imgur.com/y9DpT.jpg'),
            image: url == null
                ? NetworkImage('https://i.stack.imgur.com/y9DpT.jpg')
                : NetworkImage(
                    url,
                    scale: 0.7,
                  ),
          ),
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                // margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(100.0),
                //     color: Colors.black),
                // width: 100.0,
                // height: 100.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0f84d179-347c-449f-807c-b67d6b84f5bb/d9ra9cm-8ebaef34-7af1-4f20-b458-080646caa4b8.png/v1/fill/w_900,h_726,q_80,strp/omega_zero_o_megaman_demonio_by_megaman_x_ultimate_d9ra9cm-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzI2IiwicGF0aCI6IlwvZlwvMGY4NGQxNzktMzQ3Yy00NDlmLTgwN2MtYjY3ZDZiODRmNWJiXC9kOXJhOWNtLThlYmFlZjM0LTdhZjEtNGYyMC1iNDU4LTA4MDY0NmNhYTRiOC5wbmciLCJ3aWR0aCI6Ijw9OTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.uOyCbwcOb1lm3K3pJXG-M_nsXm7_YuhZeDTUdqEoVjE'),
                  radius: 25.0,
                ),
                // child: Image(
                //   image: AssetImage('assets/imagen_prueba2.png'),
                //   // width: 100.0,
                //   // height: 100.0,
                // ),
              ),
              Expanded(
                //para responsivo, agarra todo el ancho que le sobra
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Expanded(
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Text('Subtitulo')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
