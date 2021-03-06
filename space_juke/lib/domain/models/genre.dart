import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  Genre({
    required this.id,
    this.parent,
    required this.name,
    required this.icon,
    this.extra,
    this.created_at,
    this.updated_at,
  });
  final int id;
  final int? parent;
  final String name, icon;
  final String? extra;
  final DateTime? created_at, updated_at;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
