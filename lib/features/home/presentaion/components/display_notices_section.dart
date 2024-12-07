import 'package:factory_method_pattern_with_clean_architecture/core/responsive/dimension.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/routes/route.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/routes/route_path.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_text.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/tap_effect.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';
import 'package:flutter/material.dart';

class DisplayNoticesByPeriod extends StatelessWidget {
  const DisplayNoticesByPeriod({
    super.key,
    required this.notices,
    required this.title,
  });
  final List<NoticeEntity> notices;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSizes: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: notices.length * 80,
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notices.length,
              itemBuilder: (context, index) {
                return TapEffect(
                  onClick: () {
                    print(notices[index].id);
                    Navigator.pushNamed(
                      context,
                      RoutePath.editNoticeScreen,
                      arguments: UpdateNotice(
                        notices[index].id,
                        notices[index].title,
                        notices[index].description,
                        notices[index].createDate,
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        text: notices[index].title ,
                        fontSizes: 21.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        maxLines: 1,
                        text: notices[index].description,
                        fontSizes: 16.sp,
                        textColor: AppColors.textColor.withOpacity(0.5),
                        overFlowText: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
