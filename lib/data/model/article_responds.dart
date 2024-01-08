
import 'dart:convert';

ArticleResponds articleRespondsFromJson(String str) => ArticleResponds.fromJson(json.decode(str));

String articleRespondsToJson(ArticleResponds data) => json.encode(data.toJson());

class ArticleResponds {
  String? status;
  String? copyright;
  int? numResults;
  List<Result>? results;

  ArticleResponds({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  factory ArticleResponds.fromJson(Map<String, dynamic> json) => ArticleResponds(
    status: json["status"],
    copyright: json["copyright"],
    numResults: json["num_results"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "num_results": numResults,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  Source? source;
  DateTime? publishedDate;
  DateTime? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  dynamic column;
  String? byline;
  ResultType? type;
  String? title;
  String? resultAbstract;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Media>? media;
  int? etaId;

  Result({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.resultAbstract,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    uri: json["uri"],
    url: json["url"],
    id: json["id"],
    assetId: json["asset_id"],
    source: sourceValues.map[json["source"]]!,
    publishedDate: json["published_date"] == null ? null : DateTime.parse(json["published_date"]),
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    section: json["section"],
    subsection: json["subsection"],
    nytdsection: json["nytdsection"],
    adxKeywords: json["adx_keywords"],
    column: json["column"],
    byline: json["byline"],
    type: resultTypeValues.map[json["type"]]!,
    title: json["title"],
    resultAbstract: json["abstract"],
    desFacet: json["des_facet"] == null ? [] : List<String>.from(json["des_facet"]!.map((x) => x)),
    orgFacet: json["org_facet"] == null ? [] : List<String>.from(json["org_facet"]!.map((x) => x)),
    perFacet: json["per_facet"] == null ? [] : List<String>.from(json["per_facet"]!.map((x) => x)),
    geoFacet: json["geo_facet"] == null ? [] : List<String>.from(json["geo_facet"]!.map((x) => x)),
    media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    etaId: json["eta_id"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "url": url,
    "id": id,
    "asset_id": assetId,
    "source": sourceValues.reverse[source],
    "published_date": "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
    "updated": updated?.toIso8601String(),
    "section": section,
    "subsection": subsection,
    "nytdsection": nytdsection,
    "adx_keywords": adxKeywords,
    "column": column,
    "byline": byline,
    "type": resultTypeValues.reverse[type],
    "title": title,
    "abstract": resultAbstract,
    "des_facet": desFacet == null ? [] : List<dynamic>.from(desFacet!.map((x) => x)),
    "org_facet": orgFacet == null ? [] : List<dynamic>.from(orgFacet!.map((x) => x)),
    "per_facet": perFacet == null ? [] : List<dynamic>.from(perFacet!.map((x) => x)),
    "geo_facet": geoFacet == null ? [] : List<dynamic>.from(geoFacet!.map((x) => x)),
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
    "eta_id": etaId,
  };
}

class Media {
  MediaType? type;
  Subtype? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadatum>? mediaMetadata;

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    type: mediaTypeValues.map[json["type"]]!,
    subtype: subtypeValues.map[json["subtype"]]!,
    caption: json["caption"],
    copyright: json["copyright"],
    approvedForSyndication: json["approved_for_syndication"],
    mediaMetadata: json["media-metadata"] == null ? [] : List<MediaMetadatum>.from(json["media-metadata"]!.map((x) => MediaMetadatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": mediaTypeValues.reverse[type],
    "subtype": subtypeValues.reverse[subtype],
    "caption": caption,
    "copyright": copyright,
    "approved_for_syndication": approvedForSyndication,
    "media-metadata": mediaMetadata == null ? [] : List<dynamic>.from(mediaMetadata!.map((x) => x.toJson())),
  };
}

class MediaMetadatum {
  String? url;
  Format? format;
  int? height;
  int? width;

  MediaMetadatum({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
    url: json["url"],
    format: formatValues.map[json["format"]]!,
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "format": formatValues.reverse[format],
    "height": height,
    "width": width,
  };
}

enum Format {
  MEDIUM_THREE_BY_TWO210,
  MEDIUM_THREE_BY_TWO440,
  STANDARD_THUMBNAIL
}

final formatValues = EnumValues({
  "mediumThreeByTwo210": Format.MEDIUM_THREE_BY_TWO210,
  "mediumThreeByTwo440": Format.MEDIUM_THREE_BY_TWO440,
  "Standard Thumbnail": Format.STANDARD_THUMBNAIL
});

enum Subtype {
  EMPTY,
  PHOTO
}

final subtypeValues = EnumValues({
  "": Subtype.EMPTY,
  "photo": Subtype.PHOTO
});

enum MediaType {
  IMAGE
}

final mediaTypeValues = EnumValues({
  "image": MediaType.IMAGE
});

enum Source {
  NEW_YORK_TIMES
}

final sourceValues = EnumValues({
  "New York Times": Source.NEW_YORK_TIMES
});

enum ResultType {
  ARTICLE,
  INTERACTIVE
}

final resultTypeValues = EnumValues({
  "Article": ResultType.ARTICLE,
  "Interactive": ResultType.INTERACTIVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
