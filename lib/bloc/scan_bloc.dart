import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nestle_app/bloc/bloc_provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

enum Flash { FLASH_ON, FLASH_OFF }

class ScanBloc extends BlocBase {
  StreamController _streamController = StreamController<Widget>.broadcast();

  Sink get scanSink => _streamController.sink;

  Stream<Widget> get scanStream => _streamController.stream;

  changeCurrentFlashState(
      Flash state, BuildContext context, QRViewController controller) {
    Widget button;
    switch (state) {
      case Flash.FLASH_ON:
        button = RaisedButton.icon(
          onPressed: () {
            controller?.flipFlash();
            this.changeCurrentFlashState(Flash.FLASH_OFF, context, controller);
          },
          color: Theme.of(context).primaryColor,
          shape: StadiumBorder(),
          icon: Icon(
            Icons.flash_on,
            color: Theme.of(context).primaryIconTheme.color,
          ),
          label: Text(
            'Flash On',
            style: Theme.of(context).primaryTextTheme.button,
          ),
        );
        break;
      case Flash.FLASH_OFF:
        button = RaisedButton.icon(
          onPressed: () {
            controller?.flipFlash();
            this.changeCurrentFlashState(Flash.FLASH_ON, context, controller);
          },
          shape: StadiumBorder(),
          icon: Icon(
            Icons.flash_off,
          ),
          label: Text(
            'Flash OFF',
          ),
        );
        break;
      default:
        button = RaisedButton.icon(
          onPressed: () {
            controller?.flipFlash();
            this.changeCurrentFlashState(Flash.FLASH_ON, context, controller);
          },
          shape: StadiumBorder(),
          icon: Icon(
            Icons.flash_off,
          ),
          label: Text(
            'Flash OFF',
          ),
        );
        break;
    }

    scanSink.add(button);
  }

  @override
  void dispose() {
    _streamController?.close();
  }
}
