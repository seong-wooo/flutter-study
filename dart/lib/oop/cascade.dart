void main() {
  Person(name: '박성우', age: 26)
      ..sayHello()
      ..sayHi();
}

class Person {
  // 변수명 앞에 _를 붙이면 private 변수가 된다.
  final String _name;
  final int _age;

  Person({
    required String name,
    required int age,
  })  : _name = name,
        _age = age;

  Person.fromMap(Map<String, dynamic> map)
      : _name = map['name'],
        _age = map['age'];

  void sayHello() {
    print('안녕하세요, 저는 $_name입니다. 저는 $_age살 입니다.');
  }

  void sayHi() {
    print('안녕, 나는 $_name, $_age살');
  }

  String get name => _name;
}
