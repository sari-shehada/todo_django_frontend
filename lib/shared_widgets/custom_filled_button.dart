import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'loading_indicator.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.labelColor,
    required this.onTap,
    this.backgroundColor,
    this.height,
    this.width = double.infinity,
    this.buttonStatus,
    this.loadingColor = Colors.white,
    this.useShadow = true,
    this.borderRadiusValue = 15,
    required this.child,
  });

  final Color? labelColor;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double? height;
  final double width;
  final Rx<CustomButtonStatus>? buttonStatus;
  final Color loadingColor;
  final dynamic child;
  final bool useShadow;
  final double borderRadiusValue;

  //Getters
  BorderRadius get borderRadius => BorderRadius.circular(borderRadiusValue.r);
  double get _kDefaultHeight => 58.h;
  @override
  Widget build(BuildContext context) {
    if (buttonStatus == null) {
      return _buildContainer(
        context,
        child: Center(
          child: _buildChild(),
        ),
      );
    }
    return _buildContainer(
      context,
      child: Obx(
        () {
          switch (buttonStatus!.value) {
            case CustomButtonStatus.enabled || CustomButtonStatus.disabled:
              {
                return AbsorbPointer(
                  absorbing: buttonStatus!.value == CustomButtonStatus.disabled,
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: borderRadius,
                    child: Center(
                      child: _buildChild(),
                    ),
                  ),
                );
              }
            case CustomButtonStatus.processing:
              {
                return Center(
                  child: SizedBox.square(
                    dimension: 30.sp,
                    child: const LoadingIndicator(
                        // color: loadingColor,
                        // size: 30.responsiveFromTextSize,
                        ),
                  ),
                );
              }
          }
        },
      ),
    );
  }

  Widget _buildContainer(BuildContext context, {required Widget child}) {
    return Container(
      height: height ?? _kDefaultHeight,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: useShadow == true
            ? [
                BoxShadow(
                  offset: Offset(0, 4.h),
                  blurRadius: 12,
                  color: Theme.of(context).colorScheme.shadow.withOpacity(.08),
                ),
              ]
            : null,
      ),
      child: Material(
        color: backgroundColor ?? Theme.of(context).colorScheme.background,
        elevation: 0,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: child,
        ),
      ),
    );
  }

  Widget _buildChild() {
    assert(child is String || child is Widget,
        'Expected a widget or string for the child of the CustomFilledButton');
    if (child is String) {
      return Text(
        child,
        style: TextStyle(
          fontSize: 17.sp,
          color: labelColor ?? Get.theme.colorScheme.onPrimary,
        ),
      );
    }
    return child;
  }
}

enum CustomButtonStatus { enabled, disabled, processing }
