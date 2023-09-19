import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_strings.dart';

class CommonDialogBox extends StatefulWidget {
  const CommonDialogBox({
    super.key,
    required this.onOkTap,
    required this.onCancelTap,
    required this.title,
    required this.message,
  });

  final Callback onOkTap;
  final Callback onCancelTap;
  final String title;
  final String message;

  @override
  State<CommonDialogBox> createState() => _CommonDialogBoxState();
}

class _CommonDialogBoxState extends State<CommonDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.message,
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: widget.onCancelTap,
                child: const Text(AppStrings.cancel),
              ),
              TextButton(
                onPressed: widget.onOkTap,
                child: const Text(AppStrings.ok),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
