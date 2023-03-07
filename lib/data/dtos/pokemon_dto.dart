import 'dart:convert';

class PokemonsDto {
  PokemonsDto({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final List<PokemonDto> results;

  factory PokemonsDto.fromJson(String str) =>
      PokemonsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonsDto.fromMap(Map<String, dynamic> json) => PokemonsDto(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonDto>.from(
            json["results"].map((x) => PokemonDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class PokemonDto {
  PokemonDto({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory PokemonDto.fromJson(String str) =>
      PokemonDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonDto.fromMap(Map<String, dynamic> json) => PokemonDto(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
