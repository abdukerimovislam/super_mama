// --- fade_page_route.dart ---

import 'package:flutter/material.dart';

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  FadePageRoute({required this.child})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, page) {
      // Use FadeTransition for a simple fade effect
      return FadeTransition(
        opacity: animation,
        child: page,
      );
    },
    // Adjust transition duration as needed
    transitionDuration: const Duration(milliseconds: 300),
  );
}