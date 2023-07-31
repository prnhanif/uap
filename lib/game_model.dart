// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
  List<Game> data;
  Meta meta;

  GameModel({
    required this.data,
    required this.meta,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        data: List<Game>.from(json["data"].map((x) => Game.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Game {
  int id;
  Attributes attributes;

  Game({
    required this.id,
    required this.attributes,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  String namaGame;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String harga;

  Attributes({
    required this.namaGame,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.harga,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        namaGame: json["nama_game"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "nama_game": namaGame,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "harga": harga,
      };
}

class Meta {
  Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  int page;
  int pageSize;
  int pageCount;
  int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
