import 'dart:convert';



List<DetailsMov> detailsMovFromJson(String str) => List<DetailsMov>.from(json.decode(str).map((x) => DetailsMov.fromJson(x)));

String detailsMovToJson(List<DetailsMov> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailsMov {
    int? id;
    String? url;
    String? name;
    Type? type;
    Language? language;
    List<Genre>? genres;
    Status? status;
    int? runtime;
    int? averageRuntime;
    DateTime? premiered;
    DateTime? ended;
    String? officialSite;
    Schedule? schedule;
    Rating? rating;
    int? weight;
    Network? network;
    Network? webChannel;
    Country? dvdCountry;
    Externals? externals;
    Image? image;
    String? summary;
    int? updated;
    Links? links;

    DetailsMov({
        this.id,
        this.url,
        this.name,
        this.type,
        this.language,
        this.genres,
        this.status,
        this.runtime,
        this.averageRuntime,
        this.premiered,
        this.ended,
        this.officialSite,
        this.schedule,
        this.rating,
        this.weight,
        this.network,
        this.webChannel,
        this.dvdCountry,
        this.externals,
        this.image,
        this.summary,
        this.updated,
        this.links,
    });

    factory DetailsMov.fromJson(Map<String, dynamic> json) => DetailsMov(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        language: languageValues.map[json["language"]]!,
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => genreValues.map[x]!)),
        status: statusValues.map[json["status"]]!,
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"] == null ? null : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"],
        schedule: json["schedule"] == null ? null : Schedule.fromJson(json["schedule"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        weight: json["weight"],
        network: json["network"] == null ? null : Network.fromJson(json["network"]),
        webChannel: json["webChannel"] == null ? null : Network.fromJson(json["webChannel"]),
        dvdCountry: json["dvdCountry"] == null ? null : Country.fromJson(json["dvdCountry"]),
        externals: json["externals"] == null ? null : Externals.fromJson(json["externals"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        summary: json["summary"],
        updated: json["updated"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": typeValues.reverse[type],
        "language": languageValues.reverse[language],
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => genreValues.reverse[x])),
        "status": statusValues.reverse[status],
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered": "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        "ended": "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "schedule": schedule?.toJson(),
        "rating": rating?.toJson(),
        "weight": weight,
        "network": network?.toJson(),
        "webChannel": webChannel?.toJson(),
        "dvdCountry": dvdCountry?.toJson(),
        "externals": externals?.toJson(),
        "image": image?.toJson(),
        "summary": summary,
        "updated": updated,
        "_links": links?.toJson(),
    };
}

class Country {
    Name? name;
    Code? code;
    Timezone? timezone;

    Country({
        this.name,
        this.code,
        this.timezone,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: nameValues.map[json["name"]]!,
        code: codeValues.map[json["code"]]!,
        timezone: timezoneValues.map[json["timezone"]]!,
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "code": codeValues.reverse[code],
        "timezone": timezoneValues.reverse[timezone],
    };
}

enum Code {
    CA,
    DE,
    FR,
    GB,
    JP,
    US
}

final codeValues = EnumValues({
    "CA": Code.CA,
    "DE": Code.DE,
    "FR": Code.FR,
    "GB": Code.GB,
    "JP": Code.JP,
    "US": Code.US
});

enum Name {
    CANADA,
    FRANCE,
    GERMANY,
    JAPAN,
    UNITED_KINGDOM,
    UNITED_STATES
}

final nameValues = EnumValues({
    "Canada": Name.CANADA,
    "France": Name.FRANCE,
    "Germany": Name.GERMANY,
    "Japan": Name.JAPAN,
    "United Kingdom": Name.UNITED_KINGDOM,
    "United States": Name.UNITED_STATES
});

enum Timezone {
    AMERICA_HALIFAX,
    AMERICA_NEW_YORK,
    ASIA_TOKYO,
    EUROPE_BUSINGEN,
    EUROPE_LONDON,
    EUROPE_PARIS
}

final timezoneValues = EnumValues({
    "America/Halifax": Timezone.AMERICA_HALIFAX,
    "America/New_York": Timezone.AMERICA_NEW_YORK,
    "Asia/Tokyo": Timezone.ASIA_TOKYO,
    "Europe/Busingen": Timezone.EUROPE_BUSINGEN,
    "Europe/London": Timezone.EUROPE_LONDON,
    "Europe/Paris": Timezone.EUROPE_PARIS
});

class Externals {
    int? tvrage;
    int? thetvdb;
    String? imdb;

    Externals({
        this.tvrage,
        this.thetvdb,
        this.imdb,
    });

    factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
    );

    Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
    };
}

enum Genre {
    ACTION,
    ADVENTURE,
    ANIME,
    COMEDY,
    CRIME,
    DRAMA,
    ESPIONAGE,
    FAMILY,
    FANTASY,
    HISTORY,
    HORROR,
    LEGAL,
    MEDICAL,
    MUSIC,
    MYSTERY,
    ROMANCE,
    SCIENCE_FICTION,
    SPORTS,
    SUPERNATURAL,
    THRILLER,
    WAR,
    WESTERN
}

final genreValues = EnumValues({
    "Action": Genre.ACTION,
    "Adventure": Genre.ADVENTURE,
    "Anime": Genre.ANIME,
    "Comedy": Genre.COMEDY,
    "Crime": Genre.CRIME,
    "Drama": Genre.DRAMA,
    "Espionage": Genre.ESPIONAGE,
    "Family": Genre.FAMILY,
    "Fantasy": Genre.FANTASY,
    "History": Genre.HISTORY,
    "Horror": Genre.HORROR,
    "Legal": Genre.LEGAL,
    "Medical": Genre.MEDICAL,
    "Music": Genre.MUSIC,
    "Mystery": Genre.MYSTERY,
    "Romance": Genre.ROMANCE,
    "Science-Fiction": Genre.SCIENCE_FICTION,
    "Sports": Genre.SPORTS,
    "Supernatural": Genre.SUPERNATURAL,
    "Thriller": Genre.THRILLER,
    "War": Genre.WAR,
    "Western": Genre.WESTERN
});

class Image {
    String? medium;
    String? original;

    Image({
        this.medium,
        this.original,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

enum Language {
    ENGLISH,
    JAPANESE
}

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "Japanese": Language.JAPANESE
});

class Links {
    Self? self;
    Episode? previousepisode;
    Episode? nextepisode;

    Links({
        this.self,
        this.previousepisode,
        this.nextepisode,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : Self.fromJson(json["self"]),
        previousepisode: json["previousepisode"] == null ? null : Episode.fromJson(json["previousepisode"]),
        nextepisode: json["nextepisode"] == null ? null : Episode.fromJson(json["nextepisode"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
        "previousepisode": previousepisode?.toJson(),
        "nextepisode": nextepisode?.toJson(),
    };
}

class Episode {
    String? href;
    String? name;

    Episode({
        this.href,
        this.name,
    });

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        href: json["href"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "name": name,
    };
}

class Self {
    String? href;

    Self({
        this.href,
    });

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Network {
    int? id;
    String? name;
    Country? country;
    String? officialSite;

    Network({
        this.id,
        this.name,
        this.country,
        this.officialSite,
    });

    factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        officialSite: json["officialSite"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "officialSite": officialSite,
    };
}

class Rating {
    double? average;

    Rating({
        this.average,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "average": average,
    };
}

class Schedule {
    Time? time;
    List<Day>? days;

    Schedule({
        this.time,
        this.days,
    });

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: timeValues.map[json["time"]]!,
        days: json["days"] == null ? [] : List<Day>.from(json["days"]!.map((x) => dayValues.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "time": timeValues.reverse[time],
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => dayValues.reverse[x])),
    };
}

enum Day {
    FRIDAY,
    MONDAY,
    SATURDAY,
    SUNDAY,
    THURSDAY,
    TUESDAY,
    WEDNESDAY
}

final dayValues = EnumValues({
    "Friday": Day.FRIDAY,
    "Monday": Day.MONDAY,
    "Saturday": Day.SATURDAY,
    "Sunday": Day.SUNDAY,
    "Thursday": Day.THURSDAY,
    "Tuesday": Day.TUESDAY,
    "Wednesday": Day.WEDNESDAY
});

enum Time {
    EMPTY,
    THE_0900,
    THE_1200,
    THE_1300,
    THE_2000,
    THE_2030,
    THE_2100,
    THE_2130,
    THE_2200,
    THE_2230,
    THE_2300,
    THE_2330
}

final timeValues = EnumValues({
    "": Time.EMPTY,
    "09:00": Time.THE_0900,
    "12:00": Time.THE_1200,
    "13:00": Time.THE_1300,
    "20:00": Time.THE_2000,
    "20:30": Time.THE_2030,
    "21:00": Time.THE_2100,
    "21:30": Time.THE_2130,
    "22:00": Time.THE_2200,
    "22:30": Time.THE_2230,
    "23:00": Time.THE_2300,
    "23:30": Time.THE_2330
});

enum Status {
    ENDED,
    RUNNING,
    TO_BE_DETERMINED
}

final statusValues = EnumValues({
    "Ended": Status.ENDED,
    "Running": Status.RUNNING,
    "To Be Determined": Status.TO_BE_DETERMINED
});

enum Type {
    ANIMATION,
    DOCUMENTARY,
    REALITY,
    SCRIPTED,
    TALK_SHOW
}

final typeValues = EnumValues({
    "Animation": Type.ANIMATION,
    "Documentary": Type.DOCUMENTARY,
    "Reality": Type.REALITY,
    "Scripted": Type.SCRIPTED,
    "Talk Show": Type.TALK_SHOW
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




