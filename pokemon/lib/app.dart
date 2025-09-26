import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/screens/pokemon_list_page.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Pokémon",
      theme: CupertinoThemeData(primaryColor: Color(0xFF222222)),
      home: PokemonListPage(),
    );
  }
}
