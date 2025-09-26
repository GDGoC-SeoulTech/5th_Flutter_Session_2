/// Pokemon
///
/// 이 부분은 코드에서 포켓몬 이름과 이미지 주소를 쉽게 사용하기 위해 따로 모델을 정의한 부분입니다!
/// Pokemon 데이터가 자주 재사용되므로, 아래와 같이 새로운 타입으로 사용하는 것이 바람직합니다~
class Pokemon {
  final int id;
  final String nameEn;
  final String nameKo;
  final String imageUrl;

  const Pokemon({
    required this.id,
    required this.nameEn,
    required this.nameKo,
    required this.imageUrl,
  });
}
