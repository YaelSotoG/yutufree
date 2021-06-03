//AIzaSyDpRRdKmP51wwTUloTN7yauWkmJvsDoVg4
//https://youtube.googleapis.com/youtube/v3/activities?part=snippet&key=[YOUR_API_KEY] //para actividades (sus me gusta, sus subs y su historial)
//https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&key=[YOUR_API_KEY]
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.kind,
    this.etag,
    this.items,
    this.pageInfo,
  });

  String kind;
  String etag;
  List<dynamic> items;
  PageInfo pageInfo;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        kind: json["kind"],
        etag: json["etag"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items.map((x) => x)),
        "pageInfo": pageInfo.toJson(),
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}
