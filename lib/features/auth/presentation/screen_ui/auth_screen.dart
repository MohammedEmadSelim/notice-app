import 'package:easy_localization/easy_localization.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/responsive/dimension.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/routes/route_path.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/validation/validator.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_btn_widget.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/widgets/custom_text.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/create_user_id_param.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _idController = TextEditingController();

  // Global key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: IntrinsicHeight(
            child: Container(

              width: 300.w,
              decoration:  BoxDecoration(
                  color: AppColors.accent2Color,
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 10),
                      child: CustomText(text: 'secure_data_message'.tr()),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          current is AuthUserIdExistSuccess ||
                          current is AuthUserIdExistLoading ||
                          current is AuthUserIdExistFailure,
                      listener: (context, state) {

                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: TextFormField(
                            validator: Validator.idValidator,
                            controller: _idController,
                            cursorColor: AppColors.greyColor,
                            decoration: InputDecoration(
                              errorText: state is AuthUserIdExistFailure
                                  ? state.message
                                  : null,
                              hintStyle: const TextStyle(
                                  fontFamily: 'SFArabicRounded',
                                  color: AppColors.greyColor),
                              hintText: 'please_insert_unique_id'.tr(),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 7.0),
                              // Adjust vertical padding

                              // Customize border color when focused, enabled, or normal
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.r)),
                                borderSide: const BorderSide(
                                    color: AppColors.greyColor, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.r)),
                                borderSide: const BorderSide(
                                    color: AppColors.greyColor, width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.r)),
                                borderSide: const BorderSide(
                                    color: AppColors.greyColor, width: 2.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.r)),
                                borderSide: const BorderSide(
                                    color: AppColors.greyColor, width: 2.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    BlocConsumer<AuthCubit, AuthState>(

                      listener: (context, state) {
                        if( state is AuthUserIdExistSuccess){
                          context.read<AuthCubit>().createUserId(
                              CreateUserIdParam(_idController.text));
                        }
                        if(state is AuthCreateUserIdSuccess){
                          Navigator.pushNamedAndRemoveUntil(context, RoutePath.homeScreen,(route) => false, );
                        }
                      },
                      builder: (context, state) {
                        return CustomButtonWidget(
                          actionBtn: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await context.read<AuthCubit>().checkUserIdExist(
                                  CreateUserIdParam(_idController.text));


                            }
                          },
                          height: 35.h,
                          width: 70.w,
                          bgColor: AppColors.greyColor.withOpacity(0.7),
                          child: CustomText(
                            text: 'confirm'.tr(),
                            fontSizes: 17.sp,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
