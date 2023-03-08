
import 'package:json_annotation/json_annotation.dart';

part 'actor_vo.g.dart';

/*
{
            "adult": false,
            "gender": 2,
            "id": 1253360,
            "known_for": [
                {
                    "backdrop_path": "/6Lw54zxm6BAEKJeGlabyzzR5Juu.jpg",
                    "first_air_date": "2019-11-12",
                    "genre_ids": [
                        10765,
                        10759,
                        18
                    ],
                    "id": 82856,
                    "media_type": "tv",
                    "name": "The Mandalorian",
                    "origin_country": [
                        "US"
                    ],
                    "original_language": "en",
                    "original_name": "The Mandalorian",
                    "overview": "After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.",
                    "poster_path": "/eU1i6eHXlzMOlEq0ku1Rzq7Y4wA.jpg",
                    "vote_average": 8.5,
                    "vote_count": 8435
                },
                {
                    "backdrop_path": "/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg",
                    "first_air_date": "2023-01-15",
                    "genre_ids": [
                        18,
                        10759
                    ],
                    "id": 100088,
                    "media_type": "tv",
                    "name": "The Last of Us",
                    "origin_country": [
                        "US"
                    ],
                    "original_language": "en",
                    "original_name": "The Last of Us",
                    "overview": "Twenty years after modern civilization has been destroyed, Joel, a hardened survivor, is hired to smuggle Ellie, a 14-year-old girl, out of an oppressive quarantine zone. What starts as a small job soon becomes a brutal, heartbreaking journey, as they both must traverse the United States and depend on each other for survival.",
                    "poster_path": "/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
                    "vote_average": 8.8,
                    "vote_count": 2221
                },
                {
                    "adult": false,
                    "backdrop_path": "/z7noaCJ4KtmhwHw7QcNtnMMo4Qy.jpg",
                    "genre_ids": [
                        28,
                        53,
                        80
                    ],
                    "id": 345887,
                    "media_type": "movie",
                    "original_language": "en",
                    "original_title": "The Equalizer 2",
                    "overview": "Robert McCall, who serves an unflinching justice for the exploited and oppressed, embarks on a relentless, globe-trotting quest for vengeance when a long-time girl friend is murdered.",
                    "poster_path": "/cQvc9N6JiMVKqol3wcYrGshsIdZ.jpg",
                    "release_date": "2018-07-19",
                    "title": "The Equalizer 2",
                    "video": false,
                    "vote_average": 6.7,
                    "vote_count": 4294
                }
            ],
            "known_for_department": "Acting",
            "name": "Pedro Pascal",
            "popularity": 239.859,
            "profile_path": "/dBOrm29cr7NUrjiDQMTtrTyDpfy.jpg"
        }
 */
@JsonSerializable()
class ActorVO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "profile_path")
  String? profilePath;

  ActorVO(this.id, this.name, this.profilePath);

  factory ActorVO.fromJson(Map<String, dynamic> json) => _$ActorVOFromJson(json);

  Map<String, dynamic> toJson() => _$ActorVOToJson(this);
}