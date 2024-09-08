class User {
  final String? displayName;
  final ExternalUrls? externalUrls;
  final String? id;
  final List<Images>? images;
  final String? type;
  final Followers? followers;
  final String? country;
  final String? email;

  User({
    this.displayName,
    this.externalUrls,
    this.id,
    this.images,
    this.type,
    this.followers,
    this.country,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        displayName: json["display_name"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        id: json["id"],
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        type: json["type"],
        followers: Followers.fromJson(json["followers"]),
        country: json["country"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls?.toJson(),
        "id": id,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "type": type,
        "followers": followers?.toJson(),
        "country": country,
        "email": email,
      };
}

class ExternalUrls {
  final String spotify;

  ExternalUrls({
    required this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class Followers {
  final dynamic href;
  final int total;

  Followers({
    required this.href,
    required this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

class Images {
  final String url;
  final int height;
  final int width;

  Images({
    required this.url,
    required this.height,
    required this.width,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        url: json["url"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "height": height,
        "width": width,
      };
}
