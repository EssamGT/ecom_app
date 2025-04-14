import 'package:dartz/dartz.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';

abstract class SignupDao {
  Future<Either<SignupResponse,String>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
}
