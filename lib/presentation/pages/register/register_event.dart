import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateStepPressed extends RegisterEvent {
  final int step;

  UpdateStepPressed(this.step);

  @override
  List<Object?> get props => [step];
}

class UpdateRegisterFieldEvent extends RegisterEvent {
  final String? email, password, passwordCheck, name, affiliation;

  UpdateRegisterFieldEvent({
    this.email,
    this.password,
    this.passwordCheck,
    this.name,
    this.affiliation,
  });

  @override
  List<Object?> get props => [
    email,
    password,
    passwordCheck,
    name,
    affiliation,
  ];
}

class RegisterButtonPressed extends RegisterEvent {
  final String email, password, name, affiliation;

  RegisterButtonPressed({
    required this.email,
    required this.password,
    required this.name,
    required this.affiliation,
  });

  @override
  List<Object?> get props => [email, password, name, affiliation];
}
