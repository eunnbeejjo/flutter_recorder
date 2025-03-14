import 'package:flutter/material.dart';
import 'package:flutter_recorder/presentation/widgets/layouts/back_layout.dart';
import 'package:flutter_recorder/theme/color_palette.dart';
import 'package:go_router/go_router.dart';
import 'presentation/pages/login/login_page.dart';
import 'presentation/pages/register/register_page.dart';
import 'presentation/pages/record_list/record_list_page.dart';
// import 'presentation/pages/record_page.dart';
import 'presentation/widgets/layouts/default_layout.dart';
import 'presentation/widgets/layouts/empty_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorPalette.background,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    // 빈 레이아웃 적용
    GoRoute(
      path: '/',
      builder: (context, state) => EmptyLayout(child: LoginPage()),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => BackLayout(child: RegisterPage()),
    ),
    // GoRoute(
    //   path: '/record',
    //   builder: (context, state) => EmptyLayout(child: RecordPage()),
    // ),

    // 헤더 포함 레이아웃 적용
    GoRoute(
      path: '/record-list',
      builder:
          (context, state) =>
              DefaultLayout(title: "MediSound", child: RecordListPage()),
    ),
  ],
);
