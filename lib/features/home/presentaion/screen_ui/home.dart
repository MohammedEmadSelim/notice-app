import 'package:easy_localization/easy_localization.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/responsive/dimension.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/routes/route_path.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_btn_widget.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_text.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/components/display_notices_section.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/controller/get_notices_cuibt/get_notices_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // CacheHelper.clearData();
    return Scaffold(
      backgroundColor: AppColors.accent2Color,
      appBar: CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'notes'.tr(),
      ),
      body: BlocConsumer<GetNoticesCubit, GetNoticesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetNoticesLoading) {
            return const CupertinoActivityIndicator();
          }
          if (state is GetNoticesSuccess) {
            print(state.notices.length);
            print((state.notices.length) * 60);
            return ListView.builder(
              itemCount: state.uniqueDates.length,
              itemBuilder: (context, index) {
                var notices  = state.notices
                    .where(
                      (element) =>
                  element.createDate.month == state.uniqueDates[index].month,
                )
                    .toList();
                return DisplayNoticesByPeriod(
                    notices: notices,
                    title: state.uniqueDates[index].month.toString().tr());
              },
            );
          }
          if (state is GetNoticesFailure) {
            return Center(child: CustomText(text: state.message));
          }
          return const Center(
              child: CustomText(
                  text:
                      'unexpected issue .\n please contact with 01000927095 whats app'));
        },
      ),
      bottomSheet: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
            Semantics(
              label: 'create note',
              hint: 'press to create note',
              child: CustomButtonWidget(
                bgColor: AppColors.backgroundColor,
                actionBtn: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.createNotice,
                  );
                },
                child: Icon(
                  Icons.add_card,
                  color: AppColors.warning2Color,
                  size: 40.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
