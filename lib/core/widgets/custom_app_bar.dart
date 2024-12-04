import 'package:factory_method_pattern_with_clean_architecture/core/responsive/dimension.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final Color? iconThemeColor;
  final TextStyle? titleStyle;
  final Color backgroundColor;
  final List<Widget> ?actions;
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.backgroundColor,
      this.titleStyle,
      this.iconThemeColor, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: iconThemeColor),
      elevation: 0.1,
      shadowColor: AppColors.accentColor,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: titleStyle ?? AppTextStyles.headLine2,
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1000.w, 66.h);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
