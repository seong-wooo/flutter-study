void main() {
  const status = Status.none;
  print(Status.values);
}

enum Status {
  none,
  running,
  stopped,
  paused
}