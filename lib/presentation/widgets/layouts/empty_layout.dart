import 'package:flutter/material.dart';

class EmptyLayout extends StatelessWidget {
  final Widget child;

  const EmptyLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
    );
  }
}
