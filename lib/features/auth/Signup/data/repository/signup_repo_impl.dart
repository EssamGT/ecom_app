import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/Internet_checker.dart';
import 'package:ecom/core/resources/strings_manger.dart';
import 'package:ecom/features/auth/Signup/data/dataSource/signup_dao.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:ecom/features/auth/Signup/domain/repository/signup_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl extends SignupRepo {
  SignupDao signupDao;
  @factoryMethod
  SignupRepoImpl(this.signupDao);
  @override
  Future<Either<SignupResponse, String>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    bool Internet = await InternetChecker.internetConnection();
    if (Internet) {
      return signupDao.signUp(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
    } else {
      return Right(StringsManger.noInternetConnection);
    }
  }
}
