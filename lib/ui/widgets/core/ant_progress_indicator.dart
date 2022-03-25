import 'package:flutter/material.dart';

class AntProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
      backgroundColor: Colors.green,
    );
  }
}
