import 'package:easy_localization/easy_localization.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/responsive/dimension.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/routes/route_path.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent2Color,
      appBar: CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'notes'.tr(),
      ),
      body: const Column(
        children: [

        ],
      ),
      bottomSheet: Container(
        alignment: Alignment.topLeft,
        padding:  const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border(
            top: BorderSide(color: AppColors.accentColor),
          ),
        ),
        height: 95.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              bgColor: AppColors.backgroundColor,
              actionBtn: () {
               Navigator.pushNamed(context, RoutePath.createNotice,);
              },
              child:  Icon(
                Icons.add_card,
                color: AppColors.warning2Color,
                size: 40.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
