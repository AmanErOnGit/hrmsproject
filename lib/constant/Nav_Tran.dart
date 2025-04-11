import 'package:flutter/material.dart';

class RightToLeftRoute extends PageRouteBuilder {
  final Widget page;

  RightToLeftRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.easeInOut));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

// Usage:
