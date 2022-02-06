import 'package:flutter/material.dart';
import 'package:sociocredz/presentation/themes/theme.dart';

class SocioCredz extends StatelessWidget {
  final double size;

  SocioCredz(this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      "socio\ncredz",
      style: TextStyle(
        color: darkBlue,
        fontSize: size,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
    );
  }
}
