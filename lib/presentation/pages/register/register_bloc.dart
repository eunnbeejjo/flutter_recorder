import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_recorder/core/network/dio_client.dart';
import 'package:flutter_recorder/presentation/pages/register/register_event.dart';
import 'package:flutter_recorder/presentation/pages/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Dio _dio = DioClient().dio;

  RegisterBloc() : super(const RegisterState()) {
    on<UpdateStepPressed>(_onUpdateStep);
    on<RegisterButtonPressed>(_onSubmitRegister);
  }

  void _onUpdateStep(UpdateStepPressed event, Emitter<RegisterState> emit) {
    emit(state.copyWith(step: event.step));
  }

  void _onSubmitRegister(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    final reqData = {
      'email': event.email,
      'password': event.password,
      'name': event.name,
      'affiliation': event.affiliation,
    };

    try {
      await _dio.post('/accounts/signup', data: reqData);

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false));
    }
  }
}
