import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_recorder/core/network/dio_client.dart';
import 'package:flutter_recorder/presentation/pages/login/login_event.dart';
import 'package:flutter_recorder/presentation/pages/login/login_state.dart';
import 'package:dio/dio.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio = DioClient().dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final data = {'email': event.email, 'password': event.password};

      final response = await _dio.post('/accounts/login', data: data);

      final accessToken = response.data['access_token'];
      final refreshToken = response.data['refresh_token'];

      await _storage.write(key: 'access_token', value: accessToken);
      await _storage.write(key: 'refresh_token', value: refreshToken);

      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error: '로그인 실패'));
    }
  }
}
