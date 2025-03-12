import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

// 초기 상태
class LoginInitial extends LoginState {}

// 로그인 진행 중 (로딩 상태)
class LoginLoading extends LoginState {}

// 로그인 성공
class LoginSuccess extends LoginState {}

// 로그인 실패
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
