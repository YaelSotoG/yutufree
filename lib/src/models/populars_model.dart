// To parse this JSON data, do
//
//     final populares = popularesFromJson(jsonString);

import 'dart:convert';

Populares popularesFromJson(String str) => Populares.fromJson(json.decode(str));

String popularesToJson(Populares data) => json.encode(data.toJson());

class Populares {
  Populares({
    this.kind,
    this.etag,
    this.items,
    this.nextPageToken,
    this.prevPageToken,
    this.pageInfo,
  });

  String kind;
  String etag;
  List<Item> items;
  String nextPageToken;
  String prevPageToken;
  PageInfo pageInfo;

  factory Populares.fromJson(Map<String, dynamic> json) => Populares(
        kind: json["kind"] == null ? null : json["kind"],
        etag: json["etag"] == null ? null : json["etag"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        nextPageToken:
            json["nextPageToken"] == null ? null : json["nextPageToken"],
        prevPageToken:
            json["prevPageToken"] == null ? null : json["prevPageToken"],
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "etag": etag == null ? null : etag,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "nextPageToken": nextPageToken == null ? null : nextPageToken,
        "prevPageToken": prevPageToken == null ? null : prevPageToken,
        "pageInfo": pageInfo == null ? null : pageInfo.toJson(),
      };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"] == null ? null : json["kind"],
        etag: json["etag"] == null ? null : json["etag"],
        id: json["id"] == null ? null : json["id"],
        snippet:
            json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "etag": etag == null ? null : etag,
        "id": id == null ? null : id,
        "snippet": snippet == null ? null : snippet.toJson(),
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.defaultLanguage,
    this.localized,
    this.defaultAudioLanguage,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  List<String> tags;
  String categoryId;
  String liveBroadcastContent;
  String defaultLanguage;
  Localized localized;
  String defaultAudioLanguage;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"] == null ? null : json["channelId"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromJson(json["thumbnails"]),
        channelTitle:
            json["channelTitle"] == null ? null : json["channelTitle"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        liveBroadcastContent: json["liveBroadcastContent"] == null
            ? null
            : json["liveBroadcastContent"],
        defaultLanguage:
            json["defaultLanguage"] == null ? null : json["defaultLanguage"],
        localized: json["localized"] == null
            ? null
            : Localized.fromJson(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"] == null
            ? null
            : json["defaultAudioLanguage"],
      );

  Map<String, dynamic> toJson() => {
        "publishedAt":
            publishedAt == null ? null : publishedAt.toIso8601String(),
        "channelId": channelId == null ? null : channelId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "thumbnails": thumbnails == null ? null : thumbnails.toJson(),
        "channelTitle": channelTitle == null ? null : channelTitle,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "categoryId": categoryId == null ? null : categoryId,
        "liveBroadcastContent":
            liveBroadcastContent == null ? null : liveBroadcastContent,
        "defaultLanguage": defaultLanguage == null ? null : defaultLanguage,
        "localized": localized == null ? null : localized.toJson(),
        "defaultAudioLanguage":
            defaultAudioLanguage == null ? null : defaultAudioLanguage,
      };
}

class Localized {
  Localized({
    this.title,
    this.description,
  });

  String title;
  String description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault:
            json["default"] == null ? null : Default.fromJson(json["default"]),
        medium:
            json["medium"] == null ? null : Default.fromJson(json["medium"]),
        high: json["high"] == null ? null : Default.fromJson(json["high"]),
        standard: json["standard"] == null
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default":
            thumbnailsDefault == null ? null : thumbnailsDefault.toJson(),
        "medium": medium == null ? null : medium.toJson(),
        "high": high == null ? null : high.toJson(),
        "standard": standard == null ? null : standard.toJson(),
        "maxres": maxres == null ? null : maxres.toJson(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
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
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
        resultsPerPage:
            json["resultsPerPage"] == null ? null : json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults == null ? null : totalResults,
        "resultsPerPage": resultsPerPage == null ? null : resultsPerPage,
      };
}
