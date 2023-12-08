void main() {
  Set<String> blackPink = {'지수', '제니', '로제', '리사'};
  print(blackPink);
  print(blackPink.length);
  print(blackPink.contains('지수'));
  print(blackPink.toList());

  print(Set.from(blackPink..add('박성우')));
}