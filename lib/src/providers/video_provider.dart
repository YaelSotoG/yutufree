import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:yutufree/src/models/populars_model.dart';
import 'package:yutufree/src/models/search_mode.dart';
// 'https://youtube.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=2&key=[YOUR_API_KEY]' \

class PopularesProvider {
  String _apikey = 'AIzaSyDpRRdKmP51wwTUloTN7yauWkmJvsDoVg4';
  String _url = 'youtube.googleapis.com';

  Future<Populares> getpopulares() async {
    final url = Uri.https(_url, '/youtube/v3/videos',
        {'part': 'snippet', 'chart': 'mostPopular', 'key': _apikey});
    final resp = await http.get(url);
    final decodeddata = json.decode(resp.body);
    final videospopu = new Populares.fromJson(decodeddata);
    // for (var x in videospopu.items) {
    //   print(x.snippet.thumbnails.medium.url);
    // }
    print(videospopu);
    return videospopu;
  }

  Future<Search> getbusqueda(String busqueda) async {
    final url = Uri.https(_url, '/youtube/v3/search', {
      'part': 'snippet',
      'q': busqueda,
      'key': _apikey,
    });
    final resp = await http.get(url);
    final decodeddata = json.decode(resp.body);
    final videosbusq = new Search.fromJson(decodeddata);
    return videosbusq;
  }
}
