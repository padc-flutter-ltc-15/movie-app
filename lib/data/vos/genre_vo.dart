
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

part 'genre_vo.g.dart';

/*
{
            "id": 28,
            "name": "Action"
        }
 */
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GENRE_VO, adapterName: "GenreVOAdapter")
class GenreVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int id;
  @JsonKey(name: "name")
  @HiveField(1)
  String name;

  GenreVO(this.id, this.name);

  factory GenreVO.fromJson(Map<String, dynamic> json) => _$GenreVOFromJson(json);

  Map<String, dynamic> toJson() => _$GenreVOToJson(this);
}