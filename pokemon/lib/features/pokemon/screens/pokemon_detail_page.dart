import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/model/pokemon_model.dart';

/// pokemon_detail_page.dart
///
/// PokemonDetailpage
///
/// 이 화면은 리스트 항목을 눌렀을 때 보여지는 새로운 화면입니다!
/// 여기서는 아까 리스트 화면과 다르게 StatelessWidget을 따르는 것을 알 수 있습니다.
/// 처음에 리스트 화면에서 불러온 데이터를 그대로 전달받아 사용함을 예상할 수 있겠죠??
class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  // 여기서 이 화면으로 넘어올 때 pokemon 값을 받고있습니다!
  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(pokemon.nameKo),
        previousPageTitle: "뒤로",
      ), // 상단 네비게이션 바에 포켓몬 이름, 그리고 뒤로가기 버튼에 라벨을 추가한 부분입니다!
      child: Center(
        /// 이제 포켓몬 이미지와 이름을 크게 보여주는 화면을 만들어봐요.
        /// hint: 포켓몬 이미지는 Image.network(pokemon.imageUrl)로 보여줄 수 있습니다!
        child: Text(
          "구현해주세요!",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
