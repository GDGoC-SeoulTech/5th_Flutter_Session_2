import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/api/pokemon_api.dart';
import 'pokemon_detail_page.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  bool isLoading = true;
  String? errorMessage;
  List<Map<String, String>> pokemons = [];

  @override
  void initState() {
    super.initState();
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    try {
      final list = await PokemonApi.fetchPokemonList(limit: 20);
      setState(() {
        pokemons = list;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "포켓몬 목록을 불러오지 못했습니다.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Pokémon")),
      child: SafeArea(
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : errorMessage != null
            ? Center(child: Text(errorMessage!))
            : ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final p = pokemons[index];
                  return CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PokemonDetailPage(
                            nameEn: p["en"]!,
                            nameKo: p["ko"]!,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          p["ko"] ?? p["en"]!,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Icon(CupertinoIcons.forward, size: 18),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
