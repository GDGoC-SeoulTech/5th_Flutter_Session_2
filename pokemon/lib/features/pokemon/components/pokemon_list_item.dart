import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/model/pokemon_model.dart';
import 'package:pokemon/features/pokemon/screens/pokemon_detail_page.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => PokemonDetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pokemon.nameKo, style: const TextStyle(fontSize: 18)),
          const Icon(CupertinoIcons.forward, size: 18),
        ],
      ),
    );
  }
}
