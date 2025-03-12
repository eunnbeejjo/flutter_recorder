// API 호출 로직?
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  // 로그인 버튼 클릭 시 실행되는 메서드
  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading()); // 로딩 상태로 변경

    try {
      // 로그인 API 요청 (여기서는 가짜 딜레이)
      await Future.delayed(Duration(seconds: 1));

      // 로그인 성공
      emit(LoginSuccess());
    } catch (error) {
      // 로그인 실패
      emit(LoginFailure(error: "로그인 실패!"));
    }
  }
}
