import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/app/core/extensions/context_extension.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    this.onTap,
    this.margin = 25,
    this.padding = 25,
  });
  final String text;
  final double margin;
  final double padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: context.secondary,
        ),
        padding: EdgeInsets.all(padding.w),
        margin: EdgeInsets.symmetric(horizontal: margin.w),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
