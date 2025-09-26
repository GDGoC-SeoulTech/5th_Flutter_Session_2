import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/screens/pokemon_detail_page.dart';

class PokemonListItem extends StatelessWidget {
  final String nameEn;
  final String nameKo;

  const PokemonListItem({
    super.key,
    required this.nameEn,
    required this.nameKo,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) =>
                PokemonDetailPage(nameEn: nameEn, nameKo: nameKo),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nameKo, style: const TextStyle(fontSize: 18)),
          const Icon(CupertinoIcons.forward, size: 18),
        ],
      ),
    );
  }
}
