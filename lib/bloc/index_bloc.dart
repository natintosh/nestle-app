import 'dart:async';

import 'package:nestle_app/bloc/bloc_provider.dart';

class IndexBloc extends BlocBase {

  StreamController _streamController = StreamController<int>.broadcast();

  Sink get indexSink => _streamController.sink;
  Stream<int> get indexStream => _streamController.stream;

  changeCurrentIndex(int index) {
    indexSink.add(index);
  }

  @override
  void dispose() {
    _streamController?.close();
  }
}