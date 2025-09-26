import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/api/pokemon_api.dart';
import 'package:pokemon/features/pokemon/components/pokemon_list_item.dart';
import 'package:pokemon/features/pokemon/model/pokemon_model.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  bool isLoading = true;
  String? errorMessage;
  List<Pokemon> pokemons = [];

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
                  return PokemonListItem(pokemon: p);
                },
              ),
      ),
    );
  }
}
