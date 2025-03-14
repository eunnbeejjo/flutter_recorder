import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final int step; // 진행단계 (1~3)
  final bool isSubmitting;
  final bool isSuccess;

  const RegisterState({
    this.step = 1,
    this.isSubmitting = false,
    this.isSuccess = false,
  });

  RegisterState copyWith({int? step, bool? isSubmitting, bool? isSuccess}) {
    return RegisterState(
      step: step ?? this.step,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object> get props => [step, isSubmitting, isSuccess];
}
