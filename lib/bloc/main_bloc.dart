import 'dart:async';

import 'package:nestle_app/bloc/bloc_provider.dart';

class MainBloc extends BlocBase {

  StreamController _streamController = StreamController.broadcast();

  Sink get mainSink => _streamController.sink;
  Stream get mainStream => _streamController.stream;

  @override
  void dispose() {
    _streamController?.close();
  }
}