void main() {
  // var는 코드가 컴파일될 때 추론된 타입으로 치환된다.
  // 타입을 한 번 유추하면 추론된 타입이 고정된다.
  var name = '박성우';
  name = '박성우2';
  print(name);


  // dynamic은 변수의 타입이 고정되지 않는다.
  dynamic age = 26;
  age = '27';
  print(age);

  // final은 변수에 재할당 불가능
  final address = '서울';
  // address = '양주';  -> 불가능

  const job = '대학생';
  // job = '직장인';  -> 불가능

// final과 const의 차이점
// final은 런타임에 초기화되고 const는 컴파일 타임에 초기화된다.

  final DateTime now = DateTime.now();
  // const DateTime now = DateTime.now(); -> 컴파일 타임에 알 수 없으므로 할당 불가능
}