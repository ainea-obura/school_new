import 'bloc/student_search_qr_code_bloc.dart';
import 'models/student_search_qr_code_model.dart';
import 'package:flutter/material.dart';
import 'package:school_new/core/app_export.dart';
import 'package:school_new/widgets/app_bar/appbar_leading_image.dart';
import 'package:school_new/widgets/app_bar/appbar_title.dart';
import 'package:school_new/widgets/app_bar/custom_app_bar.dart';
import 'package:school_new/widgets/custom_icon_button.dart';

class StudentSearchQrCodeScreen extends StatelessWidget {
  const StudentSearchQrCodeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<StudentSearchQrCodeBloc>(
        create: (context) => StudentSearchQrCodeBloc(StudentSearchQrCodeState(
            studentSearchQrCodeModelObj: StudentSearchQrCodeModel()))
          ..add(StudentSearchQrCodeInitialEvent()),
        child: StudentSearchQrCodeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentSearchQrCodeBloc, StudentSearchQrCodeState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  height: 768.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.center, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgBackground1,
                        height: 769.v,
                        width: 375.h,
                        alignment: Alignment.center),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.v),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10.v),
                                  _buildAppBar(context),
                                  SizedBox(height: 38.v),
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 257.v),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 19.h),
                                              child: Column(children: [
                                                _buildFortySix(context),
                                                SizedBox(height: 368.v),
                                                Text("msg_using_qr_code_is".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeBluegray90001)
                                              ]))))
                                ])))
                  ])),
              bottomNavigationBar: _buildMobile(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 28.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            margin: EdgeInsets.only(left: 16.h, bottom: 3.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: "lbl_scan_qr_code".tr, margin: EdgeInsets.only(left: 15.h)));
  }

  /// Section Widget
  Widget _buildFortySix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 16.v, bottom: 11.v),
              child: Text("msg_search_students".tr,
                  style: theme.textTheme.bodyLarge)),
          CustomIconButton(
              height: 49.v,
              width: 52.h,
              padding: EdgeInsets.all(1.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgContrastWhiteA700))
        ]));
  }

  /// Section Widget
  Widget _buildMobile(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                height: 114.v,
                width: 83.h,
                child: Stack(alignment: Alignment.topLeft, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgMobile,
                      height: 36.adaptSize,
                      width: 36.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 5.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50084,
                      height: 29.v,
                      width: 7.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 6.h, top: 8.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50085,
                      height: 25.v,
                      width: 16.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 18.h, top: 5.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgClock,
                      height: 20.v,
                      width: 16.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 14.h, top: 21.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50087,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 5.h, top: 12.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50088,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10.h, top: 15.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50089,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 3.h, top: 18.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50090,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 5.h, top: 25.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50091,
                      height: 1.v,
                      width: 2.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 6.h, top: 32.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50092,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 17.h, top: 24.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50093,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 17.h, top: 30.v)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 19.h, top: 37.v),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgPath50094,
                                height: 1.adaptSize,
                                width: 1.adaptSize),
                            CustomImageView(
                                imagePath: ImageConstant.imgPath50092,
                                height: 1.adaptSize,
                                width: 1.adaptSize,
                                margin: EdgeInsets.only(left: 5.h, bottom: 1.v))
                          ]))),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50096,
                      height: 2.v,
                      width: 1.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 31.h, top: 25.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50092,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 29.h, top: 21.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50087,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 30.h, top: 13.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50099,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 23.h, top: 10.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50084,
                      height: 20.v,
                      width: 25.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 7.h, bottom: 26.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 9.v,
                      width: 4.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 15.h, bottom: 43.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50102,
                      height: 4.adaptSize,
                      width: 4.adaptSize,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 19.h, bottom: 47.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50099,
                      height: 2.v,
                      width: 3.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 19.h, bottom: 47.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50087,
                      height: 4.v,
                      width: 3.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 27.h, bottom: 39.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 9.v,
                      width: 15.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 21.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkPrimarycontainer,
                      height: 11.v,
                      width: 12.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 21.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50163,
                      height: 4.v,
                      width: 18.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 20.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgFavorite,
                      height: 20.v,
                      width: 16.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 32.v, right: 16.h)),
                  CustomImageView(
                      imagePath: ImageConstant.imgSettings,
                      height: 20.v,
                      width: 64.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 2.h)),
                  CustomImageView(
                      imagePath: ImageConstant.imgLightBulb,
                      height: 17.v,
                      width: 57.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 9.h)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkPrimarycontainer9x7,
                      height: 9.v,
                      width: 7.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 28.h)),
                  CustomImageView(
                      imagePath: ImageConstant.imgSettingsPrimarycontainer,
                      height: 8.v,
                      width: 10.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 33.h, bottom: 4.v)),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 17.h, bottom: 8.v),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgLightBulb,
                                    height: 7.v,
                                    width: 6.h,
                                    margin: EdgeInsets.only(top: 1.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    margin: EdgeInsets.only(
                                        left: 1.h, top: 5.v, bottom: 1.v)),
                                _buildPath1(context,
                                    path: ImageConstant.imgPath50170)
                              ]))),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 34.h, bottom: 12.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 32.h, bottom: 13.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 6.h, bottom: 17.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPlay,
                      height: 58.v,
                      width: 39.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(bottom: 18.v)),
                  CustomImageView(
                      imagePath:
                          ImageConstant.imgCheckmarkPrimarycontainer50x33,
                      height: 50.v,
                      width: 33.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 1.h, bottom: 20.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50178,
                      height: 9.v,
                      width: 10.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 4.h, bottom: 28.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50178,
                      height: 11.adaptSize,
                      width: 11.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 11.h, bottom: 39.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgMobilePrimarycontainer,
                      height: 9.v,
                      width: 11.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 17.h, bottom: 48.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgMobilePrimarycontainer,
                      height: 8.v,
                      width: 11.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 24.h, top: 47.v)),
                  Padding(
                      padding: EdgeInsets.only(left: 18.h, top: 49.v),
                      child: _buildPath2(context)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 28.h)),
                  Padding(
                      padding: EdgeInsets.only(left: 30.h),
                      child: _buildPath3(context)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 14.h, bottom: 35.v)),
                  Padding(
                      padding: EdgeInsets.only(left: 16.h, bottom: 26.v),
                      child: _buildPath4(context)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 6.h, bottom: 43.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 6.h, bottom: 46.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50101,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 36.h, top: 45.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgSettingsPrimarycontainer45x46,
                      height: 45.v,
                      width: 46.h,
                      alignment: Alignment.bottomLeft),
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftTeal300,
                      height: 41.v,
                      width: 38.h,
                      alignment: Alignment.bottomLeft),
                  CustomImageView(
                      imagePath: ImageConstant.imgThumbsUp,
                      height: 16.v,
                      width: 17.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 20.h, bottom: 20.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgTelevisionTeal300,
                      height: 17.v,
                      width: 18.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 6.h, bottom: 5.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50198,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 24.h, bottom: 29.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50198,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 36.h, bottom: 24.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50198,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 23.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50198,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 20.h, bottom: 11.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50198,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 30.h, bottom: 6.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50198,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 5.h, bottom: 28.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgPath50198,
                      height: 1.adaptSize,
                      width: 1.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 3.h, bottom: 10.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgSettingsRed300,
                      height: 13.v,
                      width: 11.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 29.h)),
                  Padding(
                      padding: EdgeInsets.only(top: 47.v, right: 8.h),
                      child: _buildPath5(context))
                ])),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 9.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: 18.v,
                                        width: 33.h,
                                        margin: EdgeInsets.only(top: 13.v),
                                        child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgMobilePrimarycontainer,
                                                  height: 18.adaptSize,
                                                  width: 18.adaptSize,
                                                  alignment:
                                                      Alignment.centerLeft),
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgPlay,
                                                  height: 12.adaptSize,
                                                  width: 12.adaptSize,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 2.h)),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5.h, top: 4.v),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPath50101,
                                                                height: 4.v,
                                                                width: 1.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            3.v,
                                                                        bottom:
                                                                            1.v)),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPath50101,
                                                                height: 8.v,
                                                                width: 2.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 1
                                                                            .h)),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPath50099,
                                                                height: 2.v,
                                                                width: 1.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            1.h,
                                                                        top:
                                                                            3.v,
                                                                        bottom:
                                                                            2.v))
                                                          ]))),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50115,
                                                  height: 7.v,
                                                  width: 17.h,
                                                  alignment:
                                                      Alignment.bottomRight)
                                            ])),
                                    SizedBox(
                                        height: 32.v,
                                        width: 50.h,
                                        child: Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgMobilePrimarycontainer22x23,
                                                  height: 22.v,
                                                  width: 23.h,
                                                  alignment: Alignment.topLeft),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgClockPrimarycontainer,
                                                  height: 16.v,
                                                  width: 17.h,
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 3.h, top: 3.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgMobilePrimarycontainer22x23,
                                                  height: 22.v,
                                                  width: 23.h,
                                                  alignment:
                                                      Alignment.bottomRight),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgClockPrimarycontainer,
                                                  height: 16.v,
                                                  width: 17.h,
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  margin: EdgeInsets.only(
                                                      right: 3.h, bottom: 3.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50101,
                                                  height: 3.v,
                                                  width: 6.h,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  margin: EdgeInsets.only(
                                                      top: 12.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50101,
                                                  height: 2.v,
                                                  width: 6.h,
                                                  alignment: Alignment.center),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50155,
                                                  height: 3.v,
                                                  width: 6.h,
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 6.h, top: 6.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50101,
                                                  height: 4.v,
                                                  width: 8.h,
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 7.h, top: 8.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50099,
                                                  height: 1.v,
                                                  width: 2.h,
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 11.h, top: 12.v)),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 8.h,
                                                          bottom: 7.v),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPath50155,
                                                                height: 3.v,
                                                                width: 7.h,
                                                                alignment: Alignment
                                                                    .centerLeft),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPath50159,
                                                                height: 2.v,
                                                                width: 4.h),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPath50160,
                                                                height:
                                                                    1.adaptSize,
                                                                width:
                                                                    1.adaptSize)
                                                          ])))
                                            ]))
                                  ]))),
                      SizedBox(
                          height: 77.v,
                          width: 290.h,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50082,
                                    height: 54.v,
                                    width: 180.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 24.h)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgThumbsUpPrimarycontainer,
                                    height: 38.v,
                                    width: 47.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(right: 81.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgLightBulb,
                                    height: 29.v,
                                    width: 14.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(right: 109.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgEdit,
                                    height: 8.v,
                                    width: 15.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 98.h, bottom: 16.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 5.v,
                                    width: 14.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 95.h, bottom: 9.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 5.v,
                                    width: 14.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 97.h, bottom: 11.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50116,
                                    height: 31.v,
                                    width: 48.h,
                                    alignment: Alignment.bottomLeft),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 24.h),
                                        child: SizedBox(
                                            height: 24.v,
                                            child: VerticalDivider(
                                                width: 1.h,
                                                thickness: 1.v,
                                                color: theme.colorScheme
                                                    .primaryContainer)))),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.h, bottom: 1.v),
                                    child: _buildPath(context)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 26.h, bottom: 1.v),
                                    child: _buildPath(context)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgThumbsUpPrimarycontainer31x35,
                                    height: 31.v,
                                    width: 35.h,
                                    alignment: Alignment.topRight,
                                    margin:
                                        EdgeInsets.only(top: 9.v, right: 48.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50085,
                                    height: 18.v,
                                    width: 21.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 14.v, right: 56.h)),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 34.v, right: 76.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50143,
                                                  height: 1.v,
                                                  width: 2.h,
                                                  margin: EdgeInsets.only(
                                                      bottom: 2.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50159,
                                                  height: 3.v,
                                                  width: 1.h,
                                                  margin: EdgeInsets.only(
                                                      left: 2.h, top: 1.v))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50087,
                                    height: 2.v,
                                    width: 1.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 33.v, right: 69.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50087,
                                    height: 2.v,
                                    width: 1.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 29.v, right: 62.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50135,
                                    height: 2.v,
                                    width: 1.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 26.v, right: 56.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50099,
                                    height: 1.v,
                                    width: 2.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 21.v, right: 49.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50099,
                                    height: 2.adaptSize,
                                    width: 2.adaptSize,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 15.v, right: 54.h)),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.v, right: 60.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50099,
                                                  height: 1.adaptSize,
                                                  width: 1.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 2.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50099,
                                                  height: 2.v,
                                                  width: 1.h,
                                                  margin: EdgeInsets.only(
                                                      left: 5.h, bottom: 2.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50099,
                                                  height: 2.v,
                                                  width: 1.h,
                                                  margin: EdgeInsets.only(
                                                      left: 5.h, bottom: 1.v))
                                            ]))),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 19.v, right: 79.h),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50087,
                                                  height: 1.v,
                                                  width: 2.h,
                                                  alignment:
                                                      Alignment.centerRight),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50087,
                                                  height: 1.v,
                                                  width: 2.h,
                                                  margin:
                                                      EdgeInsets.only(top: 6.v))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgProfile,
                                    height: 21.v,
                                    width: 16.h,
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(left: 3.h, top: 5.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50145,
                                    height: 10.v,
                                    width: 12.h,
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(left: 2.h, top: 25.v)),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 4.h, top: 27.v),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50155,
                                                  height: 2.v,
                                                  width: 5.h),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50155,
                                                  height: 2.v,
                                                  width: 4.h,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin:
                                                      EdgeInsets.only(top: 1.v))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgCut,
                                    height: 13.v,
                                    width: 10.h,
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(left: 6.h, top: 13.v)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgSettingsAmber30001,
                                    height: 20.v,
                                    width: 64.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(right: 16.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgLightBulb,
                                    height: 17.v,
                                    width: 57.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(right: 16.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowRight,
                                    height: 9.v,
                                    width: 7.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(right: 28.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowRight,
                                    height: 8.v,
                                    width: 10.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 39.h, bottom: 4.v)),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 51.h, bottom: 8.v),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              _buildPath1(context,
                                                  path: ImageConstant
                                                      .imgPath50211),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50101,
                                                  height: 1.adaptSize,
                                                  width: 1.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 5.v, bottom: 1.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgSettingsPrimarycontainer7x6,
                                                  height: 7.v,
                                                  width: 6.h,
                                                  margin: EdgeInsets.only(
                                                      left: 1.h, top: 1.v))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 48.h, bottom: 12.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 49.h, bottom: 13.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 75.h, bottom: 17.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPlay,
                                    height: 58.v,
                                    width: 39.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(right: 1.h)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgCheckmarkPrimarycontainer50x33,
                                    height: 50.v,
                                    width: 33.h,
                                    alignment: Alignment.topRight,
                                    margin:
                                        EdgeInsets.only(top: 6.v, right: 1.h)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgSettingsPrimarycontainer9x10,
                                    height: 9.v,
                                    width: 10.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 4.h, bottom: 28.v)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgSettingsPrimarycontainer9x10,
                                    height: 11.adaptSize,
                                    width: 11.adaptSize,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 26.v, right: 11.h)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMobilePrimarycontainer,
                                    height: 9.v,
                                    width: 11.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 19.v, right: 17.h)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgCheckmarkPrimarycontainer,
                                    height: 8.v,
                                    width: 11.h,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 10.v, right: 24.h)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 13.v, right: 18.h),
                                    child: _buildPath2(context)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 22.v, right: 28.h)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 20.v, right: 30.h),
                                    child: _buildPath3(context)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 14.h, bottom: 35.v)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: 16.h, bottom: 26.v),
                                    child: _buildPath4(context)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.topRight,
                                    margin:
                                        EdgeInsets.only(top: 32.v, right: 6.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.topRight,
                                    margin:
                                        EdgeInsets.only(top: 29.v, right: 6.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50101,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.topRight,
                                    margin:
                                        EdgeInsets.only(top: 8.v, right: 36.h)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgSettingsPrimarycontainer,
                                    height: 45.v,
                                    width: 46.h,
                                    alignment: Alignment.bottomRight),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgArrowLeftTeal300,
                                    height: 41.v,
                                    width: 38.h,
                                    alignment: Alignment.bottomRight),
                                CustomImageView(
                                    imagePath: ImageConstant.imgClose,
                                    height: 16.v,
                                    width: 17.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 20.h, bottom: 20.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgSettingsTeal300,
                                    height: 17.v,
                                    width: 18.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 7.h, bottom: 5.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50198,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 24.h, bottom: 29.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50198,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 36.h, bottom: 24.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50198,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 40.h, bottom: 23.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50198,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 20.h, bottom: 11.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50198,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 30.h, bottom: 6.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50198,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 6.h, bottom: 28.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50198,
                                    height: 1.adaptSize,
                                    width: 1.adaptSize,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 3.h, bottom: 10.v)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCheckmarkTeal400,
                                    height: 24.v,
                                    width: 25.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 75.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgEdit,
                                    height: 21.adaptSize,
                                    width: 21.adaptSize,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 76.h)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgSettingsPrimarycontainer9x11,
                                    height: 9.v,
                                    width: 11.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        left: 85.h, bottom: 8.v)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgSettingsPrimarycontainer9x11,
                                    height: 10.v,
                                    width: 12.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        left: 79.h, bottom: 2.v)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgContrastPrimarycontainer,
                                    height: 33.v,
                                    width: 21.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 56.h)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgArrowRightTeal400,
                                    height: 28.v,
                                    width: 16.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 59.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPath50253,
                                    height: 6.v,
                                    width: 5.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        left: 59.h, bottom: 18.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgSettingsTeal400,
                                    height: 7.v,
                                    width: 8.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        left: 61.h, bottom: 11.v)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgSettingsTeal4006x9,
                                    height: 6.v,
                                    width: 9.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        left: 64.h, bottom: 4.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgProfile,
                                    height: 19.v,
                                    width: 25.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 120.h)),
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgClockPrimarycontainer15x19,
                                    height: 15.v,
                                    width: 19.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 123.h)),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 123.h, bottom: 19.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50091,
                                                  height: 2.adaptSize,
                                                  width: 2.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 6.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50091,
                                                  height: 8.v,
                                                  width: 1.h,
                                                  margin: EdgeInsets.only(
                                                      left: 6.h, bottom: 1.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50091,
                                                  height: 2.adaptSize,
                                                  width: 2.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      left: 7.h, top: 6.v))
                                            ]))),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 113.h, bottom: 3.v),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50101,
                                                  height: 1.v,
                                                  width: 5.h,
                                                  alignment: Alignment.center),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50099,
                                                  height: 1.v,
                                                  width: 3.h,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin:
                                                      EdgeInsets.only(top: 7.v))
                                            ]))),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 148.h,
                                            right: 136.h,
                                            bottom: 3.v),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50101,
                                                  height: 1.v,
                                                  width: 5.h,
                                                  alignment: Alignment.center),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPath50087,
                                                  height: 1.v,
                                                  width: 2.h,
                                                  margin:
                                                      EdgeInsets.only(top: 6.v))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgMobileTeal400,
                                    height: 9.v,
                                    width: 8.h,
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(left: 30.h, top: 27.v)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: 57.h, bottom: 30.v),
                                    child: _buildPath5(context)),
                                Opacity(
                                    opacity: 0.3,
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgGroup8125,
                                        height: 25.v,
                                        width: 48.h,
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                            left: 88.h, top: 2.v)))
                              ]))
                    ])))
          ])
        ]));
  }

  /// Common widget
  Widget _buildPath(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      CustomImageView(
          imagePath: ImageConstant.imgPath50163, height: 2.v, width: 18.h),
      CustomImageView(
          imagePath: ImageConstant.imgPath50163,
          height: 2.v,
          width: 18.h,
          margin: EdgeInsets.only(top: 1.v)),
      CustomImageView(
          imagePath: ImageConstant.imgPath50163,
          height: 2.v,
          width: 18.h,
          margin: EdgeInsets.only(top: 1.v)),
      CustomImageView(
          imagePath: ImageConstant.imgPath50163,
          height: 2.v,
          width: 18.h,
          margin: EdgeInsets.only(top: 1.v)),
      CustomImageView(
          imagePath: ImageConstant.imgPath50163,
          height: 2.v,
          width: 18.h,
          margin: EdgeInsets.only(top: 1.v)),
      CustomImageView(
          imagePath: ImageConstant.imgPath50163,
          height: 2.v,
          width: 18.h,
          margin: EdgeInsets.only(top: 1.v))
    ]);
  }

  /// Common widget
  Widget _buildPath1(
    BuildContext context, {
    required String path,
  }) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(imagePath: path, height: 5.v, width: 3.h),
          CustomImageView(
              imagePath: ImageConstant.imgPath50101,
              height: 1.adaptSize,
              width: 1.adaptSize,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 1.v))
        ]);
  }

  /// Common widget
  Widget _buildPath2(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgPath50101,
              height: 1.adaptSize,
              width: 1.adaptSize),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 3.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgPath50101,
                                height: 1.adaptSize,
                                width: 1.adaptSize)),
                        Expanded(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgPath50101,
                                height: 1.adaptSize,
                                width: 1.adaptSize))
                      ])))
        ]);
  }

  /// Common widget
  Widget _buildPath3(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgPath50101,
              height: 1.adaptSize,
              width: 1.adaptSize,
              alignment: Alignment.centerRight),
          CustomImageView(
              imagePath: ImageConstant.imgPath50101,
              height: 1.adaptSize,
              width: 1.adaptSize,
              margin: EdgeInsets.only(top: 1.v))
        ]);
  }

  /// Common widget
  Widget _buildPath4(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgPath50101,
              height: 1.adaptSize,
              width: 1.adaptSize),
          CustomImageView(
              imagePath: ImageConstant.imgPath50198,
              height: 1.adaptSize,
              width: 1.adaptSize,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 3.v)),
          CustomImageView(
              imagePath: ImageConstant.imgPath50198,
              height: 1.adaptSize,
              width: 1.adaptSize,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 2.v))
        ]);
  }

  /// Common widget
  Widget _buildPath5(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgPath50268,
              height: 1.adaptSize,
              width: 1.adaptSize,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 1.h)),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 4.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgPath50268,
                                height: 1.adaptSize,
                                width: 1.adaptSize)),
                        Expanded(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgPath50268,
                                height: 1.adaptSize,
                                width: 1.adaptSize))
                      ])))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
