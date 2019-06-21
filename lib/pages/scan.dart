import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nestle_app/bloc/bloc_provider.dart';
import 'package:nestle_app/bloc/scan_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

import 'machine.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: Scaffold(
            body: SafeArea(
          child: _ScanPageContent(),
        )),
        bloc: ScanBloc());
  }
}

class _ScanPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanPageContentState();
}

class _ScanPageContentState extends State<_ScanPageContent> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  void _onQRViewCreated(QRViewController controller) {
    final channel = controller.channel;
    controller.init(qrKey);
    this.controller = controller;
    channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case "onRecognizeQR":
          dynamic arguments = call.arguments;
            qrText = arguments.toString();

          if (qrText.isNotEmpty) {
            vibrate();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MachinePage(
                      data: qrText,
                    )));
          }

          return;
      }
    });
  }

  void vibrate() async {
    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(duration: 40);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
            Container(
              child: _buildFlashButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }

  _buildFlashButtonWidget() {
    final ScanBloc bloc = BlocProvider.of<ScanBloc>(context);
    return StreamBuilder(
      initialData: RaisedButton.icon(
        onPressed: () {
          controller?.flipFlash();
          bloc.changeCurrentFlashState(Flash.FLASH_ON, context, controller);
        },
        shape: StadiumBorder(),
        icon: Icon(
          Icons.flash_off,
        ),
        label: Text(
          'Flash Off',
        ),
      ),
      stream: bloc.scanStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.data;
      },
    );
  }
}
