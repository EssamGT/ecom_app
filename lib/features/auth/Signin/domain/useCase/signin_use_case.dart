import 'package:dartz/dartz.dart';
import 'package:ecom/features/auth/Signin/domain/repository/signin_repo.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUseCase {
  SigninRepo signinRepo;
  @factoryMethod
  SigninUseCase(this.signinRepo);
Future<Either<SignupResponse, String>> call({required String email, required String password}) =>
      signinRepo.signin(email: email, password: password);
}
