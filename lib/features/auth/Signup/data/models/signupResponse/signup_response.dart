import 'package:ecom/features/auth/Signup/data/models/signupResponse/user/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  String? statusMsg;
  User? user;
  String? token;
  SignupResponse({this.message, this.statusMsg, this.user, this.token});
  factory SignupResponse.FromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
