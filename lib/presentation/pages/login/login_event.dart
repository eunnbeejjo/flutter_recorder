import 'package:equatable/equatable.dart';

// Equatable 사용 이유 => 같은 상태인데 불필요하게 렌더링되는것을 방지하기 위함
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// 로그인 버튼 클릭 이벤트
class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
