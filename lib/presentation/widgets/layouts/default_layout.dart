import 'package:flutter/material.dart';
import 'package:flutter_recorder/theme/color_palette.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const DefaultLayout({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: SizedBox(
            width: double.infinity,
            child: Text(title, textAlign: TextAlign.left),
          ),
        ),
        titleTextStyle: TextStyle(
          color: ColorPalette.primaryBase,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: -1.0,
        ),
        backgroundColor: ColorPalette.background,
        actions: [
          //actions 위젯 리스트 지정
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: ColorPalette.gray300, size: 30),
            ),
          ),
        ],
      ),
      body: Container(
        color: ColorPalette.background, // 배경색 적용
        child: SafeArea(child: child),
      ),
    );
  }
}
