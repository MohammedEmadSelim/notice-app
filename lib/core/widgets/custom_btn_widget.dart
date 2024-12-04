import 'package:factory_method_pattern_with_clean_architecture/core/responsive/dimension.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/fontSizer.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    this.title,
    this.child,
    required this.actionBtn,
    this.bgColor,
    this.width,
    this.borderRadius,
    this.height,
    this.textColor,
    this.verticalConstraint,
    super.key,
    this.border,
  });

  final Widget? child;
  final String? title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Function actionBtn;
  final Color? bgColor;
  final Color? textColor;
  final double? verticalConstraint;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalConstraint ?? 26.h),
      child: TapEffect(
        onClick: () => actionBtn(),
        child: Container(
          width: width ?? 30.w,
          height: height ?? 30.h,
          decoration: BoxDecoration(
            border: border,
            color: bgColor ?? AppColors.warningColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          ),
          child: Center(
              child: child ??
                  Text(title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: textColor ?? AppColors.backgroundColor,
                        fontSize: FontSizer.s20,
                      ))),
        ),
      ),
    );
  }
}
