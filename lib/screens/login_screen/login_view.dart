import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_profile/screens/login_screen/login_controller.dart';
import 'package:my_profile/widgets/button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_strings.dart';
import '../../constants/app_style.dart';
import '../../widgets/labeled_checkbox.dart';
import '../../widgets/text_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20.h,
              ),
              FlutterLogo(size: 20.h),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.only(left: 7.w, right: 7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: AppStrings.signInTo,
                        style: AppStyles.headingTitleTextStyle,
                        children: [
                          TextSpan(
                            text: AppStrings.appName,
                            style: AppStyles.headingTitle2ndTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      AppStrings.enterYourUsernamePasswordToLogin,
                      style: AppStyles.headingSubTitleTextStyle.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Form(
                      key: controller.signInFormKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            controller: controller.userNameController,
                            hintText: AppStrings.userName,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return controller.validateUsername(value ?? '');
                            },
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          TextFieldWidget(
                            controller: controller.passwordController,
                            hintText: AppStrings.password,
                            textInputAction: TextInputAction.done,
                            obscureText: !controller.passwordVisible.value,
                            enableSuffixIcon: true,
                            suffixIconOnTap: () {
                              if (controller.passwordVisible.value) {
                                controller.passwordVisible(false);
                              } else {
                                controller.passwordVisible(true);
                              }
                            },
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.w),
                            child: LabeledCheckbox(
                              label: AppStrings.rememberMe,
                              padding: EdgeInsets.zero,
                              value: controller.isRememberMe.value,
                              onChanged: (bool? value) {
                                controller.isRememberMe(value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          ButtonWidget(
                            onPressed: () {
                              // HomeView
                              controller.loginNextButton();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
