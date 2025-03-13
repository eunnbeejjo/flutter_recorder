import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recorder/theme/color_palette.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_recorder/presentation/widgets/custom_text_field.dart';
import 'package:flutter_recorder/presentation/pages/login/login_bloc.dart';
import 'package:flutter_recorder/presentation/pages/login/login_event.dart';
import 'package:flutter_recorder/presentation/pages/login/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(), // LoginBloc 제공
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MediSound',
                style: TextStyle(
                  color: ColorPalette.pink,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 40),

              // 아이디 입력 필드
              CustomTextField(hintText: "아이디", controller: emailController),
              const SizedBox(height: 20),

              // 비밀번호 입력 필드
              CustomTextField(
                hintText: "비밀번호",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 20),

              // 로그인 버튼
              BlocConsumer<LoginBloc, LoginState>(
                // listener: state 변화 감지하여 함수/API 요청 등 실행
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    context.go('/record-list'); // 로그인 성공 시 이동
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                // 현재 state 에 따라 위젯 만들고 싶을 때
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed:
                        state is LoginLoading
                            ? null
                            : () {
                              context.read<LoginBloc>().add(
                                LoginButtonPressed(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 54),
                      backgroundColor: ColorPalette.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:
                        state is LoginLoading
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : const Text(
                              "로그인",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // 회원가입 페이지로 이동하는 링크 텍스트
              GestureDetector(
                onTap: () {
                  context.go('/register');
                },
                child: const Text(
                  "회원가입 하기",
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
