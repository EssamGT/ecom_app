import 'package:dartz/dartz.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:ecom/features/auth/Signup/domain/repository/signup_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  SignupRepo signupRepo;
  @factoryMethod
  SignupUseCase(this.signupRepo);
  Future<Either<SignupResponse, String>> call({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) => signupRepo.signUp(
    name: name,
    email: email,
    phone: phone,
    password: password,
  );
}
