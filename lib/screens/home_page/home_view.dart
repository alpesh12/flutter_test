import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_profile/constants/app_fonts.dart';
import 'package:my_profile/constants/app_strings.dart';
import 'package:my_profile/screens/home_page/home_controller.dart';
import 'package:my_profile/widgets/common_dialogbox.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_onstant.dart';
import '../../routes/app_routes.dart';
import '../../widgets/avatar_widget.dart';
import '../../widgets/common_edit_icon_widget.dart';
import '../../widgets/skill_list_widget.dart';
import '../edit_profile/edit_profile_view.dart';

class EditProfileKey {
  String isFrom;
  dynamic value;

  EditProfileKey({
    this.isFrom = '',
    this.value = '',
  });
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  String defaultName = 'Milan';
  String defaultEmail = 'milan.joshi@logisticinfotech.co.in';
  Map defaultWorkExp = {};

  GetStorage storage = GetStorage();

  List<String> skillList = [];

  @override
  void initState() {
    super.initState();
    prepareDefaultData();
  }

  @override
  Widget build(BuildContext context) {
    // hide full screen
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 3,
          title: Text(
            AppStrings.profile,
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.whiteColor,
              fontFamily: AppFonts.appFontSemiBold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout_rounded,
                color: AppColors.whiteColor,
              ),
              onPressed: () {
                showLogoutConfirmationDialog();
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: SafeArea(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Stack(
                        children: [
                          AvatarWidget(
                            controller: controller,
                            storage: storage,
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: EditIconWidget(
                              onTap: () {
                                openGalleryCamera();
                              },
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 4.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.w),
                              topRight: Radius.circular(8.w),
                            ),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            AppStrings.name,
                                            style: TextStyle(
                                              color: AppColors.black54Color,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            storage.hasData(AppConstants.name)
                                                ? storage
                                                    .read(AppConstants.name)
                                                : defaultName,
                                            style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontSize: 10.sp,
                                              fontFamily:
                                                  AppFonts.appFontRegular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: EditIconWidget(
                                        onTap: () {
                                          editNameOnTap();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            AppStrings.email,
                                            style: TextStyle(
                                              color: AppColors.black54Color,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            storage.hasData(AppConstants.email)
                                                ? storage
                                                    .read(AppConstants.email)
                                                : defaultEmail,
                                            style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontSize: 10.sp,
                                              fontFamily:
                                                  AppFonts.appFontRegular,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: EditIconWidget(
                                        onTap: () {
                                          editEmailOnTap();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            AppStrings.skill,
                                            style: TextStyle(
                                              color: AppColors.black54Color,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SkillListWidget(skillList: skillList),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: EditIconWidget(
                                        onTap: () {
                                          editSkillsOnTap();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            AppStrings.workExperience,
                                            style: TextStyle(
                                              color: AppColors.black54Color,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 1.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  // 'Flutter Team Lead',
                                                  defaultWorkExp['position'],
                                                  style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontSize: 10.sp,
                                                    fontFamily:
                                                        AppFonts.appFontMedium,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  defaultWorkExp['company'],
                                                  style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontSize: 8.sp,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: EditIconWidget(
                                        onTap: () {
                                          editWorkExperienceOnTap();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              ),
            );
          },
        ));
  }

  // Open Gallery Or Camera to set Avatar
  openGalleryCamera() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Select Avatar From'),
                  ListTile(
                    title: const Text('Camera'),
                    onTap: () {
                      Get.back();
                      controller.getFromCamera();
                    },
                  ),
                  ListTile(
                    title: const Text('Gallery'),
                    onTap: () {
                      controller.getFromGallery();
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Add Initial Data
  void prepareDefaultData() {
    if (storage.hasData(AppConstants.skill)) {
      skillList = storage.read(AppConstants.skill).cast<String>();
    } else {
      skillList = [
        'Flutter Development',
        'iOS Development',
        'Android Development',
        'Node JS',
        'React Native Development',
        'Python Development',
      ];
    }
    if (storage.hasData(AppConstants.workExp)) {
      defaultWorkExp = storage.read(
        AppConstants.workExp,
      ) as Map;
    } else {
      defaultWorkExp = {
        'position': 'Flutter Team Lead',
        'company': 'XYZ Inc.',
      };
    }
  }

  // Edit Name
  void editNameOnTap() {
    Get.to(
      const EditProfileView(),
      transition: Transition.rightToLeft,
      arguments: EditProfileKey(
        isFrom: AppConstants.name,
        value: storage.hasData(AppConstants.name)
            ? storage.read(AppConstants.name)
            : defaultName,
      ),
    )?.then((value) {
      if (value != null) {
        setState(() {
          if (storage.hasData(AppConstants.name)) {
            defaultName = storage.read(
              AppConstants.name,
            );
          }
        });
      }
    });
  }

// Edit Email
  void editEmailOnTap() {
    Get.to(
      const EditProfileView(),
      transition: Transition.rightToLeft,
      arguments: EditProfileKey(
        isFrom: AppConstants.email,
        value: storage.hasData(AppConstants.email)
            ? storage.read(AppConstants.email)
            : defaultEmail,
      ),
    )?.then((value) {
      if (value != null) {
        setState(() {
          if (storage.hasData(AppConstants.email)) {
            defaultEmail = storage.read(
              AppConstants.email,
            );
          }
        });
      }
    });
  }

  // Edit Skill
  void editSkillsOnTap() {
    Get.to(
      const EditProfileView(),
      transition: Transition.rightToLeft,
      arguments: EditProfileKey(
        isFrom: AppConstants.skill,
        value: storage.hasData(AppConstants.skill)
            ? storage.read(AppConstants.skill)
            : skillList,
      ),
    )?.then((value) {
      if (value != null) {
        if (storage.hasData(AppConstants.skill)) {
          setState(() {
            skillList = List<String>.from(
              storage.read(
                AppConstants.skill,
              ),
            );
          });
        }
      }
    });
  }

  // Edit Work Experience
  void editWorkExperienceOnTap() {
    Get.to(
      const EditProfileView(),
      transition: Transition.rightToLeft,
      arguments: EditProfileKey(
        isFrom: AppConstants.workExp,
        value: storage.hasData(AppConstants.workExp)
            ? storage.read(AppConstants.workExp)
            : defaultWorkExp,
      ),
    )?.then((value) {
      if (value != null) {
        setState(() {
          defaultWorkExp = storage.read(
            AppConstants.workExp,
          ) as Map;
        });
      }
    });
  }

  // show logout confirmation dialog box
  void showLogoutConfirmationDialog() {
    Get.dialog(CommonDialogBox(
      onOkTap: () {
        storage.remove(AppConstants.isRememberMe);
        Get.offAllNamed(Routes.loginScreen);
      },
      onCancelTap: () {
        Get.back();
      },
      title: AppStrings.logout,
      message: AppStrings.logoutMessage,
    ));
  }
}
