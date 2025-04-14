import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/api_manger.dart';
import 'package:ecom/core/remote/endpoints.dart';
import 'package:ecom/features/auth/Signup/data/dataSource/signup_dao.dart';
import 'package:ecom/features/auth/Signup/data/models/signupResponse/signup_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupDao)
class SignupDaoImpl extends SignupDao {
  ApiManger apiManger;
  @factoryMethod
  SignupDaoImpl(this.apiManger);
  @override
  Future<Either<SignupResponse, String>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      var json = await apiManger.postRequest(
        path: Endpoints.singUp,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": password,
          "phone": phone,
        },
      );
      SignupResponse response = SignupResponse.FromJson(json.data);
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
