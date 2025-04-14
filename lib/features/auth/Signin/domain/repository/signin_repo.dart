import 'package:dartz/dartz.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';

abstract class SigninRepo {
  Future<Either<SignupResponse, String>> signin({
    required String email,
    required String password,
  });
}
