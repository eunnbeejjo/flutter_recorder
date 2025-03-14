import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recorder/presentation/pages/register/register_bloc.dart';
import 'package:flutter_recorder/presentation/pages/register/register_event.dart';
import 'package:flutter_recorder/presentation/pages/register/register_state.dart';
import 'package:flutter_recorder/presentation/pages/register/widgets/register_form.dart';
import 'package:flutter_recorder/presentation/widgets/custom_progress_bar.dart';
import 'package:flutter_recorder/presentation/widgets/custom_text_field.dart';
import 'package:flutter_recorder/theme/color_palette.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordCheckController =
        TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController affiliationController = TextEditingController();

    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(), // LoginBloc 생성
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.go('/');
          }
        },
        builder: (context, state) {
          String title =
              state.step == 1
                  ? '로그인할 때 사용할\n이메일을 알려주세요.'
                  : state.step == 2
                  ? '안전한 서비스 이용을 위한\n비밀번호를 입력해 주세요.'
                  : '회원님이 누구인지\n알려주세요.';

          List<Map<String, dynamic>> childData = [
            {
              'step': 1,
              'fieldName': 'email',
              'hintText': '이메일',
              'controller': emailController,
            },
            {
              'step': 2,
              'fieldName': 'password',
              'hintText': '비밀번호',
              'isPassword': true,
              'controller': passwordController,
            },
            {
              'step': 2,
              'fieldName': 'password',
              'hintText': '비밀번호 확인',
              'isPassword': true,
              'controller': passwordCheckController,
            },
            {
              'step': 3,
              'fieldName': 'name',
              'hintText': '이름',
              'controller': nameController,
            },
            {
              'step': 3,
              'fieldName': 'affiliation',
              'hintText': '소속',
              'controller': affiliationController,
            },
          ];

          final child = ListView.separated(
            shrinkWrap: true, // 부모 위젯의 크기를 초과하지 않도록 설정
            itemCount:
                childData.where((data) => data['step'] == state.step).length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) {
              final filteredData =
                  childData
                      .where((data) => data['step'] == state.step)
                      .toList();
              final data = filteredData[index];

              return CustomTextField(
                controller: data['controller'],
                hintText: data['hintText'],
                obscureText: data['isPassword'] ?? false,
              );
            },
          );

          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CustomProgressBar(percentage: state.step / 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      RegisterForm(title: title, child: child),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed:
                                  state.step > 1
                                      ? () {
                                        context.read<RegisterBloc>().add(
                                          UpdateStepPressed(state.step - 1),
                                        );
                                      }
                                      : null,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(1 / 2, 54),
                                backgroundColor: ColorPalette.primaryBase,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                '이전',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      state.step > 1
                                          ? Colors.white
                                          : ColorPalette.gray200,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed:
                                  state.step < 3
                                      ? () {
                                        context.read<RegisterBloc>().add(
                                          UpdateStepPressed(state.step + 1),
                                        );
                                      }
                                      : () {
                                        context.read<RegisterBloc>().add(
                                          RegisterButtonPressed(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text,
                                            affiliation:
                                                affiliationController.text,
                                          ),
                                        );
                                      },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(1 / 2, 54),
                                backgroundColor: ColorPalette.primaryBase,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                state.step < 3 ? '다음' : '완료',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
