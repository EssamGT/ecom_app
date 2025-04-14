import 'package:ecom/core/cache/prefs_helper.dart';
import 'package:ecom/core/di/di.dart';
import 'package:ecom/core/resources/constants_manager.dart';
import 'package:ecom/core/routes_manager/routes.dart';
import 'package:ecom/core/widget/custom_elevated_button.dart';
import 'package:ecom/features/auth/Signup/presentation/manager/cubit/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignupViewModelCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.s40.h),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(height: AppSize.s40.h),
                    BuildTextField(
                      controller: name,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                    ),
                    SizedBox(height: AppSize.s18.h),
                    BuildTextField(
                      controller: phone,
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: AppSize.s18.h),
                    BuildTextField(
                      controller: email,
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: AppSize.s18.h),
                    BuildTextField(
                      controller: password,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: AppSize.s50.h),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: BlocConsumer<
                          SignupViewModelCubit,
                          SignupViewModelState
                        >(
                          listener: (context, state) {
                            if (state is Succsess) {
                              PrefsHelper.setToken(state.signupResponse.token!);
                              AppConstants.showTost(state.signupResponse.message!);
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(Routes.mainRoute);
                            }
                            if (state is Error) {
                              AppConstants.showTost(state.message);
                            }
                          },
                          builder: (context, state) {
                            var cubit = SignupViewModelCubit.get(context);
                            return CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isLoading: state is Loading,
                              label: 'Sign Up',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s20,
                              ),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.signup(
                                    name: name.text,
                                    email: email.text,
                                    phone: phone.text,
                                    password: password.text,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
