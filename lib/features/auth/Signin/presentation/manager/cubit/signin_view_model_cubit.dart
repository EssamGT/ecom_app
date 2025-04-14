import 'package:bloc/bloc.dart';
import 'package:ecom/features/auth/Signin/domain/useCase/signin_use_case.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'signin_view_model_state.dart';

@injectable
class SigninViewModelCubit extends Cubit<SigninViewModelState> {
  @factoryMethod
  SigninViewModelCubit(this.useCase) : super(SigninViewModelInitial());
  SigninUseCase useCase;
  static SigninViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);
  signin({required String email, required String password}) async {
    emit(Loading());
    var result = await useCase.call(email: email, password: password);
    result.fold(
      (response) {
        emit(Success(response));
      },
      (error) {
        emit(Error(error));
      },
    );
  }
}
