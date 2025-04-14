import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/api_manger.dart';
import 'package:ecom/core/remote/endpoints.dart';
import 'package:ecom/features/auth/Signin/data/dataSource/signin_dao.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SigninDao)
class SigninDaoImpl extends SigninDao {
  ApiManger apiManger;
  @factoryMethod
  SigninDaoImpl(this.apiManger);
  @override
  Future<Either<SignupResponse, String>> signin({
    required String email,
    required String password,
  }) async {
    try {
      var json = await apiManger.postRequest(
        path: Endpoints.singIn,
        body: {"email": email, "password": password},
      );
      SignupResponse response = await SignupResponse.FromJson(json.data);
      if (response.statusMsg == null) {
        return Left(response);
      } else {
        return Right(response.message!);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
