import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/responsive/dimension.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/text_styles.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/tap_effect.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/presentation/controller/create_notice_cubit/create_notice_cubit.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/presentation/controller/edit_notice_cubit/edit_notice_screen_cubit.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/controller/get_notices_cuibt/get_notices_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoticeScreen extends StatefulWidget {
  EditNoticeScreen({super.key, required this.notice});
  final UpdateNotice notice;
  @override
  State<EditNoticeScreen> createState() => _EditNoticeScreenState();
}

class _EditNoticeScreenState extends State<EditNoticeScreen> {
  // Create FocusNodes for each TextFormField
  final FocusNode _noticeTitle = FocusNode();
  final FocusNode _noticeBody = FocusNode();
  final TextEditingController _noticeTitleController = TextEditingController();
  final TextEditingController _noticeBodyController = TextEditingController();

  @override
  void initState() {
    _noticeTitleController.text = widget.notice.title;
    _noticeBodyController.text = widget.notice.description;
    super.initState();
  }

  @override
  void dispose() {
    // Dispose FocusNodes when the widget is disposed
    _noticeTitle.dispose();
    _noticeBody.dispose();
    _noticeTitleController.dispose();
    _noticeBodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoticeScreenCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          backButton: TapEffect(
              onClick: () {
                Navigator.pop(context);
                BlocProvider.of<GetNoticesCubit>(context).getNotices();
              },
              child: Icon(Icons.arrow_back_ios_new)),
          title: 'note'.tr(),
          titleStyle: AppTextStyles.headLine2Yellow,
          backgroundColor: AppColors.backgroundColor,
          iconThemeColor: AppColors.warning2Color,
          actions: [
            BlocConsumer<EditNoticeScreenCubit, EditNoticeScreenState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TapEffect(
                      onClick: () async {
                        print('object');
                        context.read<EditNoticeScreenCubit>().updateNotice(
                              UpdateNotice(
                                widget.notice.id,
                                _noticeTitleController.text,
                                _noticeBodyController.text,
                                DateTime.now(),
                              ),
                            );
                      },
                      child: Text('done'.tr(),
                          style: AppTextStyles.normal.copyWith(
                              color: AppColors.warning2Color,
                              fontSize: 18.sp))),
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _noticeTitleController,
                  focusNode: _noticeTitle,
                  cursorColor: AppColors.warning2Color,
                  style: AppTextStyles.inputStyle1, // Use the style you defined
                  decoration: InputDecoration(
                    hintText: "Enter notice title", // Placeholder text
                    hintStyle: AppTextStyles.headLine3.copyWith(
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.w300),
                    border: InputBorder.none, // Removes the border
                  ),
                  onFieldSubmitted: (value) {
                    // Move to the second TextFormField when "Enter" is pressed
                    FocusScope.of(context).requestFocus(_noticeBody);
                  },
                ),
                TextFormField(
                  controller: _noticeBodyController,
                  focusNode: _noticeBody,
                  cursorColor: AppColors.warning2Color,
                  maxLines: null, // Allow multiple lines
                  minLines: 1, // Start with a single line
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(border: InputBorder.none),
                  onFieldSubmitted: (value) {
                    print(_noticeBodyController.text);
                    // You can handle submitting the form or closing the keyboard here
                    FocusScope.of(context)
                        .unfocus(); // Close keyboard when done
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
