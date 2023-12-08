void main() async {
  // addNumbers(1, 2);
  final result = await addNumbers2(1, 1);
  final result2 = await addNumbers2(2, 2);

  print('결과1 = $result');
  print('결과2 = $result2');
}

void addNumbers(int a, int b) {
  print('$a + $b 시작!');
  Future.delayed(Duration(seconds: 1), () {
    print('$a + $b = ${a + b}');
  });
  print('$a + $b 끝!');
}

Future<int> addNumbers2(int a, int b) async {
  print('$a + $b 시작!');

  // 함수에 async를 사용하고, 대기하고 싶은 비동기 함수 앞에 await를 사용하면 코드가 순차적으로 실행된다.
  await Future.delayed(Duration(seconds: 1), () {
    print('$a + $b = ${a + b}');
  });

  print('$a + $b 끝!');
  return a + b;
}
