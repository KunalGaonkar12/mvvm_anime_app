import 'dart:convert';

AnimeListModel animeListModelFromJson(String str) => AnimeListModel.fromJson(json.decode(str));

String animeListModelToJson(AnimeListModel data) => json.encode(data.toJson());

class AnimeListModel {
  List<Anime> data;
  Meta meta;

  AnimeListModel({
    required this.data,
    required this.meta,
  });

  AnimeListModel copyWith({
    List<Anime>? data,
    Meta? meta,
  }) =>
      AnimeListModel(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory AnimeListModel.fromJson(Map<String, dynamic> json) => AnimeListModel(
    data: List<Anime>.from(json["data"].map((x) => Anime.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Anime {
  String id;
  String title;
  List<String> alternativeTitles;
  int ranking;
  List<String> genres;
  int episodes;
  bool hasEpisode;
  bool hasRanking;
  String image;
  String link;
  String status;
  String synopsis;
  String thumb;
  String type;

  Anime({
    required this.id,
    required this.title,
    required this.alternativeTitles,
    required this.ranking,
    required this.genres,
    required this.episodes,
    required this.hasEpisode,
    required this.hasRanking,
    required this.image,
    required this.link,
    required this.status,
    required this.synopsis,
    required this.thumb,
    required this.type,
  });

  Anime copyWith({
    String? id,
    String? title,
    List<String>? alternativeTitles,
    int? ranking,
    List<String>? genres,
    int? episodes,
    bool? hasEpisode,
    bool? hasRanking,
    String? image,
    String? link,
    String? status,
    String? synopsis,
    String? thumb,
    String? type,
  }) =>
      Anime(
        id: id ?? this.id,
        title: title ?? this.title,
        alternativeTitles: alternativeTitles ?? this.alternativeTitles,
        ranking: ranking ?? this.ranking,
        genres: genres ?? this.genres,
        episodes: episodes ?? this.episodes,
        hasEpisode: hasEpisode ?? this.hasEpisode,
        hasRanking: hasRanking ?? this.hasRanking,
        image: image ?? this.image,
        link: link ?? this.link,
        status: status ?? this.status,
        synopsis: synopsis ?? this.synopsis,
        thumb: thumb ?? this.thumb,
        type: type ?? this.type,
      );

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    id: json["_id"],
    title: json["title"],
    alternativeTitles: List<String>.from(json["alternativeTitles"].map((x) => x)),
    ranking: json["ranking"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    episodes: json["episodes"],
    hasEpisode: json["hasEpisode"],
    hasRanking: json["hasRanking"],
    image: json["image"],
    link: json["link"],
    status: json["status"],
    synopsis: json["synopsis"],
    thumb: json["thumb"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "alternativeTitles": List<dynamic>.from(alternativeTitles.map((x) => x)),
    "ranking": ranking,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "episodes": episodes,
    "hasEpisode": hasEpisode,
    "hasRanking": hasRanking,
    "image": image,
    "link": link,
    "status": status,
    "synopsis": synopsis,
    "thumb": thumb,
    "type": type,
  };
}

class Meta {
  int page;
  int size;
  int totalData;
  int totalPage;

  Meta({
    required this.page,
    required this.size,
    required this.totalData,
    required this.totalPage,
  });

  Meta copyWith({
    int? page,
    int? size,
    int? totalData,
    int? totalPage,
  }) =>
      Meta(
        page: page ?? this.page,
        size: size ?? this.size,
        totalData: totalData ?? this.totalData,
        totalPage: totalPage ?? this.totalPage,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    size: json["size"],
    totalData: json["totalData"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "size": size,
    "totalData": totalData,
    "totalPage": totalPage,
  };
}
