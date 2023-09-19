import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class SkillListWidget extends StatelessWidget {
  const SkillListWidget({
    super.key,
    required this.skillList,
  });

  final List<String> skillList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(skillList.length, (int index) {
        return Chip(
          label: Text(
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 10.sp,
              fontFamily: AppFonts.appFontRegular,
            ),
            skillList[index],
          ),
        );
      }),
    );
  }
}
