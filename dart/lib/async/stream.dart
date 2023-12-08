import 'dart:async';

void main() {
  final streamController = StreamController();
  final stream = streamController.stream;
  final streamListener1 = stream.listen((val) => print(val + '111111111111'));

  streamController.sink.add('박성우');
  streamController.sink.add('박성우2');
  streamController.sink.add('박성우3');
  streamController.sink.add('박성우4');


  final broadStreamController = StreamController();
  final broadCastStream = broadStreamController.stream.asBroadcastStream();
  final broadStreamListener1 = broadCastStream.listen((val) => print(val + '111111111111'));
  final broadStreamListener2 = broadCastStream.listen((val) => print(val + '222222222222'));

  broadStreamController.sink.add('park1');
  broadStreamController.sink.add('park2');
  broadStreamController.sink.add('park3');
  broadStreamController.sink.add('park4');

  // ----------------------------------------------------------------------------------------
  calculate().listen((event) {
    print('나온 숫자!! = $event');
  });
}

Stream<String> calculate() async* {
  for (int i = 0; i < 5; i++) {
    yield 'i = $i';
    await Future.delayed(Duration(seconds: 1));
  }
}