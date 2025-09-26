import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/features/pokemon/model/pokemon_model.dart';

/// pokemon_api.dart
///
/// PokemonApi
///
/// Pokemon API에서 포켓몬 리스트와 정보를 불러오는 메소드를 정의하는 부분입니다!
/// 네트워킹은 다음 세션에서 알아봐요.
class PokemonApi {
  static Future<List<Pokemon>> fetchPokemonList({int limit = 20}) async {
    final url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=$limit");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("failed to fetchPokemonList");
    }

    final data = json.decode(response.body);
    final results = data['results'] as List;

    List<Pokemon> pokemons = [];

    for (var i = 0; i < results.length; i++) {
      final enName = results[i]['name'];
      final id = i + 1;
      final imageUrl =
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
      final speciesUrl = "https://pokeapi.co/api/v2/pokemon-species/${i + 1}";
      final speciesRes = await http.get(Uri.parse(speciesUrl));

      String koName = enName;
      if (speciesRes.statusCode == 200) {
        final speciesData = json.decode(speciesRes.body);
        final names = speciesData['names'] as List;
        final koEntry = names.firstWhere(
          (n) => n['language']['name'] == 'ko',
          orElse: () => {"name": enName},
        );
        koName = koEntry['name'];
      }

      pokemons.add(
        Pokemon(id: id, nameEn: enName, nameKo: koName, imageUrl: imageUrl),
      );
    }

    return pokemons;
  }
}
