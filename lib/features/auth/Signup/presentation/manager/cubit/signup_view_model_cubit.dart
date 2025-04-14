import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:ecom/features/auth/Signup/domain/useCase/signup_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'signup_view_model_state.dart';

@injectable
class SignupViewModelCubit extends Cubit<SignupViewModelState> {
  @factoryMethod
  SignupViewModelCubit(this.signupUseCase) : super(SignupViewModelInitial());
  SignupUseCase signupUseCase;
static  SignupViewModelCubit get(BuildContext context) => BlocProvider.of(context);
   signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(Loading());
    var resault = await signupUseCase.call(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
     resault.fold(
      (resposne) {
        emit(Succsess(resposne));
      },
      (error) {
         emit(Error(error));
      },
    );
  }
}
