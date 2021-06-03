// To parse this JSON data, do
//
//     final secciones = seccionesFromJson(jsonString);

import 'dart:convert';

Secciones seccionesFromJson(String str) => Secciones.fromJson(json.decode(str));

String seccionesToJson(Secciones data) => json.encode(data.toJson());

class Secciones {
  Secciones({
    this.kind,
    this.etag,
    this.items,
  });

  String kind;
  String etag;
  List<Item> items;

  factory Secciones.fromJson(Map<String, dynamic> json) => Secciones(
        kind: json["kind"],
        etag: json["etag"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
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
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
      };
}

class Snippet {
  Snippet({
    this.type,
    this.style,
    this.channelId,
    this.position,
  });

  String type;
  String style;
  String channelId;
  int position;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        type: json["type"],
        style: json["style"],
        channelId: json["channelId"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "style": style,
        "channelId": channelId,
        "position": position,
      };
}
