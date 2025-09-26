import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonApi {
  static Future<List<Map<String, String>>> fetchPokemonList({
    int limit = 20,
  }) async {
    final url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=$limit");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("failed to fetchPokemonList");
    }

    final data = json.decode(response.body);
    final results = data['results'] as List;

    List<Map<String, String>> pokemons = [];

    for (var i = 0; i < results.length; i++) {
      final enName = results[i]['name'];
      final speciesUrl = "https://pokeapi.co/api/v2/pokemon-species/${i + 1}";
      final speciesRes = await http.get(Uri.parse(speciesUrl));

      String koName = enName; // fallback
      if (speciesRes.statusCode == 200) {
        final speciesData = json.decode(speciesRes.body);
        final names = speciesData['names'] as List;
        final koEntry = names.firstWhere(
          (n) => n['language']['name'] == 'ko',
          orElse: () => {"name": enName},
        );
        koName = koEntry['name'];
      }

      pokemons.add({"en": enName, "ko": koName});
    }

    return pokemons;
  }

  static Future<String?> fetchImage(String name) async {
    final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$name");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['sprites']['front_default'];
    }
    throw Exception("Failed to fetchImage");
  }
}
