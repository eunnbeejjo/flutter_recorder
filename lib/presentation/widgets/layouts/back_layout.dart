import 'package:flutter/material.dart';
import 'package:flutter_recorder/presentation/pages/login/login_page.dart';
import 'package:flutter_recorder/presentation/widgets/layouts/empty_layout.dart';
import 'package:flutter_recorder/theme/color_palette.dart';
import 'package:go_router/go_router.dart';

class BackLayout extends StatelessWidget {
  final Widget child;

  const BackLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorPalette.gray300,
              size: 24,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(child: SafeArea(child: child)),
    );
  }
}
