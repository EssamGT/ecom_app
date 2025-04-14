import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/Internet_checker.dart';
import 'package:ecom/core/resources/strings_manger.dart';
import 'package:ecom/features/auth/Signin/data/dataSource/signin_dao.dart';
import 'package:ecom/features/auth/Signin/domain/repository/signin_repo.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SigninRepo)
class SigninRepoImpl extends SigninRepo {
  SigninDao signinDao;
  @factoryMethod
  SigninRepoImpl(this.signinDao);
  @override
  Future<Either<SignupResponse, String>> signin({
    required String email,
    required String password,
  }) async {
    bool internet = await InternetChecker.internetConnection();
    if (internet) {
      return signinDao.signin(email: email, password: password);
    } else {
      return Right(StringsManger.noInternetConnection);
    }
  }
}
