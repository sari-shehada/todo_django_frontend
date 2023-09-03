import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.editingController,
    this.hintText,
    this.action,
    this.textAlign,
    this.maxLength,
    this.expands = false,
  });

  final String? hintText;
  final TextInputAction? action;
  final TextAlign? textAlign;
  final TextEditingController editingController;
  final int? maxLength;
  final bool expands;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(fontSize: 18.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14.r),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14.r),
        ),
        filled: true,
        fillColor: const Color(0xFFD7F5EE),
        hintText: hintText,
      ),
      expands: expands,
      maxLines: expands ? null : 1,
      maxLength: maxLength,
      textInputAction: action,
    );
  }
}
