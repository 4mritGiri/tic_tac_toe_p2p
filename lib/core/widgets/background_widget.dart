import 'package:flutter/material.dart';
import 'package:tic_tac_toe_p2p/core/colors.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: MyColors.bgGradient,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
