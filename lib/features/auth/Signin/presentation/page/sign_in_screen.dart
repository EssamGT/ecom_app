import 'package:ecom/core/cache/prefs_helper.dart';
import 'package:ecom/core/di/di.dart';
import 'package:ecom/core/resources/assets_manager.dart';
import 'package:ecom/core/resources/color_manager.dart';
import 'package:ecom/core/resources/constants_manager.dart';
import 'package:ecom/core/resources/values_manager.dart';
import 'package:ecom/core/routes_manager/routes.dart';
import 'package:ecom/core/widget/custom_elevated_button.dart';
import 'package:ecom/core/widget/main_text_field.dart';
import 'package:ecom/core/widget/validators.dart';
import 'package:ecom/features/auth/Signin/presentation/manager/cubit/signin_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SigninViewModelCubit>(),
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
                    Text(
                      'Welcome Back To Route',
                      style: getBoldStyle(
                        color: ColorManager.white,
                      ).copyWith(fontSize: FontSize.s24.sp),
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: getLightStyle(
                        color: ColorManager.white,
                      ).copyWith(fontSize: FontSize.s16.sp),
                    ),
                    SizedBox(height: AppSize.s50.h),
                    BuildTextField(
                      controller: email,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your email',
                      label: 'email',
                      textInputType: TextInputType.emailAddress,
                      validation: AppValidators.validateEmail,
                    ),
                    SizedBox(height: AppSize.s28.h),
                    BuildTextField(
                      controller: password,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'Password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: AppSize.s8.h),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password?',
                            style: getMediumStyle(
                              color: ColorManager.white,
                            ).copyWith(fontSize: FontSize.s18.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s60.h),
                    Center(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * .8,
                        child: BlocConsumer<
                          SigninViewModelCubit,
                          SigninViewModelState
                        >(
                          listener: (context, state) {
                            if (state is Success) {
                              PrefsHelper.setToken(state.response.token!);
                              AppConstants.showTost(state.response.message!);
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(Routes.mainRoute);
                            }
                            if (state is Error) {
                              AppConstants.showTost(state.erroeMessage);
                            }
                          },
                          builder: (context, state) {
                            var cubit = SigninViewModelCubit.get(context);
                            return CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isLoading: state is Loading,
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18,
                              ),
                              
                              onTap: () {
                                if(state != Loading){

                                if (formKey.currentState!.validate()) {
                                  cubit.signin(
                                    email: email.text,
                                    password: password.text,
                                  );
                                }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(width: AppSize.s8.w),
                        GestureDetector(
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                Routes.signUpRoute,
                              ),
                          child: Text(
                            'Create Account',
                            style: getSemiBoldStyle(
                              color: ColorManager.white,
                            ).copyWith(fontSize: FontSize.s16.sp),
                          ),
                        ),
                      ],
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
