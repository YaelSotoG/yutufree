import 'package:flutter/material.dart';

// import 'package:yutufree/src/models/populars_model.dart';
// import 'package:yutufree/src/pages/view_page.dart';
import 'package:yutufree/src/providers/video_provider.dart';
import 'package:yutufree/src/search/search_delegate.dart';
// import 'package:yutufree/src/widgets/home_widget.dart';
import 'package:yutufree/src/widgets/results_widget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

final populares = PopularesProvider();
Future videos = populares.getpopulares();

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    //   return home(context, populares, populares.getpopulares());
    // }
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text('Youtube'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  videos = showSearch(
                      context: context, delegate: DataSearch(populares));
                });
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: items(videos),
      bottomNavigationBar: navigation(),
    );
  }

  Widget navigation() {
    return BottomNavigationBar(backgroundColor: Colors.black, items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        label: 'Principal',
        backgroundColor: Colors.black,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined),
        label: 'Explorar',
        backgroundColor: Colors.black,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions_outlined),
        label: 'Suscripciones',
        backgroundColor: Colors.black,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.my_library_books_outlined),
        label: 'Biblioteca',
        backgroundColor: Colors.black,
      ),
    ]);
  }
}
