part of 'signin_view_model_cubit.dart';

@immutable
sealed class SigninViewModelState {}

final class SigninViewModelInitial extends SigninViewModelState {}

class Loading extends SigninViewModelState {}

class Success extends SigninViewModelState {
  SignupResponse response;
  Success(this.response);
}

class Error extends SigninViewModelState {
  String erroeMessage;
  Error(this.erroeMessage);
}
