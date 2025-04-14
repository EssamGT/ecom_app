part of 'signup_view_model_cubit.dart';

@immutable
sealed class SignupViewModelState {}

final class SignupViewModelInitial extends SignupViewModelState {}

class Loading extends SignupViewModelState {}

class Succsess extends SignupViewModelState {
  SignupResponse signupResponse;
  Succsess(this.signupResponse);
}

class Error extends SignupViewModelState {
  String message;
  Error(this.message);
}
