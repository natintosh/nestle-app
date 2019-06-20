import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _ScanPageContent(),)
    );
  }
}

class _ScanPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanPageContentState();

}

class _ScanPageContentState extends State<_ScanPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.filter_center_focus),
    );
  }
}
