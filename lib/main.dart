import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'constants/app_colors.dart';
import 'constants/app_fonts.dart';
import 'constants/app_strings.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return Sizer(builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.whiteColor,
              fontFamily: AppFonts.appFontRegular,
              primaryColor: AppColors.primaryColor,
              useMaterial3: true,
            ),
            initialRoute: Routes.splashScreen,
            defaultTransition: Transition.downToUp,
            onGenerateRoute: AppPages().generateRoute,
            home: Container(),
          );
        });
      });
    });
    // return MaterialApp(
    //   title: 'My Profile',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    //     useMaterial3: true,
    //     scaffoldBackgroundColor: AppColors.whiteColor,
    //     fontFamily: AppFonts.appFontRegular,
    //     primaryColor: AppColors.primaryColor,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   home: const LoginPage(),
    // );
  }
}
