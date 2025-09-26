import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/api/pokemon_api.dart';

class PokemonDetailPage extends StatefulWidget {
  final String nameEn;
  final String nameKo;

  const PokemonDetailPage({
    super.key,
    required this.nameEn,
    required this.nameKo,
  });

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  String? imageUrl;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadPokemon();
  }

  Future<void> loadPokemon() async {
    try {
      final sprite = await PokemonApi.fetchImage(widget.nameEn);
      setState(() {
        imageUrl = sprite;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "상세 정보를 불러오지 못했습니다.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.nameKo),
        previousPageTitle: "뒤로",
      ),
      child: SafeArea(
        child: Center(
          child: isLoading
              ? const CupertinoActivityIndicator()
              : errorMessage != null
              ? Text(errorMessage!)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Text(
                      widget.nameKo,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (imageUrl != null) Image.network(imageUrl!),
                  ],
                ),
        ),
      ),
    );
  }
}
