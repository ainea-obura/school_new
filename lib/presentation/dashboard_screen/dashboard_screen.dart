import '../dashboard_screen/widgets/eleven_item_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/dashboard_model.dart';
import 'models/eleven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:school_new/core/app_export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(DashboardState(
        dashboardModelObj: DashboardModel(),
      ))
        ..add(DashboardInitialEvent()),
      child: DashboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.img03Dashboard,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 25.v,
            ),
            child: Column(
              children: [
                _buildFourteen(context),
                SizedBox(height: 6.v),
                _buildThirteen(context),
                SizedBox(height: 12.v),
                _buildEleven(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFourteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_welcome".tr,
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 8.v),
              Opacity(
                opacity: 0.61,
                child: Text(
                  "lbl_teacher_no_04".tr,
                  style: CustomTextStyles.bodyLargeWhiteA70018_1,
                ),
              ),
              SizedBox(height: 9.v),
              SizedBox(
                height: 24.v,
                width: 84.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle2388,
                      height: 24.v,
                      width: 84.h,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          "lbl_2020_2021".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomImageView(
            imagePath: ImageConstant.imgContrast,
            height: 62.adaptSize,
            width: 62.adaptSize,
            margin: EdgeInsets.only(
              top: 19.v,
              bottom: 22.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildThirteen(BuildContext context) {
    return Container(
      width: 339.h,
      margin: EdgeInsets.only(
        left: 4.h,
        right: 2.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 32.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup13,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "lbl_hello".tr,
              style: CustomTextStyles.titleLargeBlack900,
            ),
          ),
          SizedBox(height: 16.v),
          Container(
            width: 289.h,
            margin: EdgeInsets.only(right: 17.h),
            child: Text(
              "msg_our_mission_is_to".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyLargeGray600.copyWith(
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.h),
      child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
        selector: (state) => state.dashboardModelObj,
        builder: (context, dashboardModelObj) {
          return ElevenItemWidget();
          // return GridView.builder(
          //   shrinkWrap: true,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     mainAxisExtent: 99.v,
          //     crossAxisCount: 2,
          //     mainAxisSpacing: 0.h,
          //     crossAxisSpacing: 0.h,
          //   ),
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: dashboardModelObj?.elevenItemList.length ?? 0,
          //   itemBuilder: (context, index) {
          //     ElevenItemModel model =
          //         dashboardModelObj?.elevenItemList[index] ?? ElevenItemModel();
          //     return ElevenItemWidget(
                
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
