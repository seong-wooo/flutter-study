void main() {
  Operation operation = add;
  operation(1,2);

}

typedef Operation = void Function(int a, int b);

void add(int a, int b) {
  print(a + b);
}

void subtract(int a, int b) {
  print(a - b);
}