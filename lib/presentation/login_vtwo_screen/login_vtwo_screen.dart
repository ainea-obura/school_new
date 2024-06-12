import 'bloc/login_vtwo_bloc.dart';
import 'models/login_vtwo_model.dart';
import 'package:flutter/material.dart';
import 'package:school_new/core/app_export.dart';
import 'package:school_new/widgets/custom_elevated_button.dart';

class LoginVtwoScreen extends StatelessWidget {
  const LoginVtwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginVtwoBloc>(
      create: (context) => LoginVtwoBloc(LoginVtwoState(
        loginVtwoModelObj: LoginVtwoModel(),
      ))
        ..add(LoginVtwoInitialEvent()),
      child: LoginVtwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginVtwoBloc, LoginVtwoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 768.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: AppDecoration.gradientIndigoToPrimary,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 171.v),
                              Container(
                                height: 597.v,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.h),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 30.h,
                            top: 35.v,
                            right: 23.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgGroup8037,
                                height: 161.v,
                                width: 321.h,
                              ),
                              SizedBox(height: 50.v),
                              Text(
                                "lbl_hi_teacher".tr,
                                style: CustomTextStyles.displaySmallGray800,
                              ),
                              SizedBox(height: 6.v),
                              Text(
                                "msg_sign_in_to_continue".tr,
                                style: CustomTextStyles.titleLargeGray600,
                              ),
                              SizedBox(height: 35.v),
                              Text(
                                "msg_mobile_number_email".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              SizedBox(height: 5.v),
                              Text(
                                "msg_syalfreelance_gmail_com".tr,
                                style: theme.textTheme.bodyLarge,
                              ),
                              SizedBox(height: 15.v),
                              Divider(
                                endIndent: 6.h,
                              ),
                              SizedBox(height: 32.v),
                              Text(
                                "lbl_password".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              SizedBox(height: 9.v),
                              _buildGrid(context),
                              SizedBox(height: 17.v),
                              Divider(
                                endIndent: 6.h,
                              ),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                text: "lbl_sign_in".tr,
                                margin: EdgeInsets.only(right: 6.h),
                                rightIcon: Container(
                                  margin: EdgeInsets.only(left: 30.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgArrowleft,
                                    height: 17.v,
                                    width: 25.h,
                                  ),
                                ),
                                buttonStyle: CustomButtonStyles.none,
                                decoration: CustomButtonStyles
                                    .gradientIndigoToPrimaryDecoration,
                              ),
                              SizedBox(height: 19.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 6.h),
                                  child: Text(
                                    "msg_forgot_password".tr,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildGrid(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGrid,
            height: 8.v,
            width: 90.h,
            margin: EdgeInsets.only(top: 3.v),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEye,
            height: 12.v,
            width: 18.h,
          ),
        ],
      ),
    );
  }
}
