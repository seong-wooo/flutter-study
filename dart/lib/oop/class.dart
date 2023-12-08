void main() {
  Person person = Person(name: '박성우', age: 26);
  person.sayHello();

  Person person2 = Person.fromMap({'name': '박성우 2024', 'age': 27});
  person2.sayHello();
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

  String get name => _name;
}
