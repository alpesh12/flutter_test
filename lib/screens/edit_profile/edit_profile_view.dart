import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_profile/constants/app_onstant.dart';
import 'package:my_profile/constants/app_strings.dart';
import 'package:my_profile/constants/app_style.dart';
import 'package:my_profile/screens/edit_profile/edit_profile_controller.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_dialogbox.dart';
import '../../widgets/text_field_widget.dart';
import '../home_page/home_view.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late EditProfileKey arguments;
  EditProfileController controller = Get.put(EditProfileController());

  GetStorage storage = GetStorage();

  List<String> skillList = [];
  final _textControllers = <TextEditingController>[];
  bool _unsavedChanges = false;
  Map workExp = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //get key data
    arguments = (ModalRoute.of(context)?.settings.arguments as EditProfileKey);
    if (arguments.isFrom == AppConstants.name) {
      controller.nameController.text = arguments.value;
    } else if (arguments.isFrom == AppConstants.email) {
      controller.emailController.text = arguments.value;
    } else if (arguments.isFrom == AppConstants.skill) {
      skillList = (arguments.value as List).map((e) => e as String).toList();
      for (var i = 0; i < skillList.length; i++) {
        _textControllers.add(TextEditingController(text: skillList[i]));
      }
    } else if (arguments.isFrom == AppConstants.workExp) {
      workExp = arguments.value;
      controller.positionController.text = workExp['position'];
      controller.companyNameController.text = workExp['company'];
    }
  }

  void goBack() {
    Get.back(
      result: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(
          color: AppColors.whiteColor,
        ),
        elevation: 3,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (_unsavedChanges) {
                // print('Please save');
                Get.dialog(CommonDialogBox(
                  onCancelTap: () {
                    Get.back();
                  },
                  onOkTap: () {
                    Get.back();
                    Get.back(
                      result: true,
                    );
                  },
                  title: AppStrings.unsavedChanges,
                  message: AppStrings.unsavedChangesMsg,
                ));
              } else {
                Get.back(
                  result: true,
                );
              }
            }),
        title: Text(
          AppStrings.editProfile,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.whiteColor,
            fontFamily: AppFonts.appFontSemiBold,
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final isValid =
              controller.editFormKey.currentState?.validate() ?? false;
          if (isValid) {
            if (arguments.isFrom == AppConstants.name) {
              storage.write(AppConstants.name, controller.nameController.text);
              goBack();
            } else if (arguments.isFrom == AppConstants.email) {
              storage.write(
                  AppConstants.email, controller.emailController.text);
              goBack();
            } else if (arguments.isFrom == AppConstants.workExp) {
              saveWorkExp();
            }
          } else if (arguments.isFrom == AppConstants.skill) {
            _saveChanges();
            goBack();
          }
        },
        child: Container(
          height: 6.h,
          margin: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            bottom: 4.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(2.w),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            AppStrings.save,
            style: AppStyles.headingTitleTextStyle.copyWith(
              color: AppColors.whiteColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: onWillPopScope,
        child: SafeArea(
          child: arguments.isFrom == AppConstants.name
              ? EditNameWidget(controller: controller)
              : arguments.isFrom == AppConstants.email
                  ? EditEmailWidget(controller: controller)
                  : arguments.isFrom == AppConstants.skill
                      ? ListView.builder(
                          itemCount: skillList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                              ),
                              title: Text(skillList[index]),
                              trailing: IntrinsicWidth(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        _showEditItemDialog(index);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        if (skillList.length != 1) {
                                          Get.dialog(
                                            CommonDialogBox(
                                              onOkTap: () {
                                                setState(() {
                                                  skillList.removeAt(index);
                                                  storage.write(
                                                    AppConstants.skill,
                                                    skillList,
                                                  );
                                                });
                                                Get.back();
                                              },
                                              onCancelTap: () {
                                                Get.back();
                                              },
                                              title: AppStrings.delete,
                                              message: AppStrings.deleteMessage,
                                            ),
                                          );
                                        } else {
                                          Utils.validationCheck(
                                            isError: true,
                                            message: AppStrings.skillMessage,
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : arguments.isFrom == AppConstants.workExp
                          ? EditWorkExperience(controller: controller)
                          : const SizedBox(),
        ),
      ),
    );
  }

  Future<void> _showEditItemDialog(int index) async {
    GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
    String originalItem = skillList[index];
    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteColor,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: editFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.w, bottom: 1.h),
                      child: const Text(AppStrings.editSkill),
                    ),
                    TextFieldWidget(
                      controller: _textControllers[index],
                      titleText: AppStrings.skillName,
                      hintText: AppStrings.enterSkill,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return AppStrings.pleaseEnterSkill;
                        }
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ButtonWidget(
                      buttonText: AppStrings.edit,
                      onPressed: () {
                        if (editFormKey.currentState?.validate() ?? false) {
                          Navigator.of(context)
                              .pop(_textControllers[index].text);
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          if (value.isEmpty) {
            skillList[index] = originalItem;
          } else {
            skillList[index] = value;
          }
          _unsavedChanges = true;
        });
      } else {
        _textControllers[index].text = originalItem;
      }
    });
  }

  Future<void> _saveChanges() async {
    _unsavedChanges = false;
    await storage.write(AppConstants.skill, skillList);
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void saveWorkExp() {
    workExp = {
      'position': controller.positionController.text,
      'company': controller.companyNameController.text,
    };
    storage.write(AppConstants.workExp, workExp);
    goBack();
  }

  Future<bool> onWillPopScope() async {
    if (_unsavedChanges) {
      // print('Please save');
      Get.dialog(CommonDialogBox(
        onOkTap: () {
          Get.back();
          Get.back(
            result: true,
          );
        },
        onCancelTap: () {
          Get.back();
        },
        title: AppStrings.unsavedChanges,
        message: AppStrings.unsavedChangesMsg,
      ));
      return false;
    } else {
      Get.back(
        result: true,
      );
      return true;
    }
  }
}

class EditWorkExperience extends StatelessWidget {
  const EditWorkExperience({
    super.key,
    required this.controller,
  });

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.h),
      padding: const EdgeInsets.all(10),
      child: Form(
        key: controller.editFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.workExperience,
              style: TextStyle(
                color: AppColors.black54Color,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppStrings.position,
              style: TextStyle(
                color: AppColors.black54Color,
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFieldWidget(
              controller: controller.positionController,
              hintText: AppStrings.position,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: (value) {
                return controller.validatePosition(value ?? '');
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppStrings.companyName,
              style: TextStyle(
                color: AppColors.black54Color,
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFieldWidget(
              controller: controller.companyNameController,
              hintText: AppStrings.position,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              validator: (value) {
                return controller.validateCompanyName(value ?? '');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditEmailWidget extends StatelessWidget {
  const EditEmailWidget({
    super.key,
    required this.controller,
  });

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(3.h),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.editFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.email,
                  style: TextStyle(
                    color: AppColors.black54Color,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFieldWidget(
                  controller: controller.emailController,
                  hintText: AppStrings.email,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return Utils.validateEmail(value!);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditNameWidget extends StatelessWidget {
  const EditNameWidget({
    super.key,
    required this.controller,
  });

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(3.h),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.editFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.name,
                  style: TextStyle(
                    color: AppColors.black54Color,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFieldWidget(
                  controller: controller.nameController,
                  hintText: AppStrings.name,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return controller.validateUsername(value ?? '');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
