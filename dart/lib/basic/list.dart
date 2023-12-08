void main() {
  List<String> blackPink = ['지수', '제니', '로제', '리사'];
  print(blackPink[3]);
  blackPink[3] = '박성우';
  blackPink.add('리사');
  print(blackPink.length);
  print(blackPink);

  final blackUnit = blackPink
      .where((name) => name == '제니' || name == '박성우')
      .map((name) => '블랙 $name')
      .toList();

  print(blackUnit);

  final allMembers = blackPink.reduce((value, element) =>
  value + ", " + element);
  print(allMembers);

  // ----------------------------------------------------
  // fold는 reduce와 비슷하지만 초기값을 지정할 수 있다.
  var allMembersLength = blackPink.fold<int>(0, (previousValue, element) => previousValue + element.length);
  print(allMembersLength);


}
